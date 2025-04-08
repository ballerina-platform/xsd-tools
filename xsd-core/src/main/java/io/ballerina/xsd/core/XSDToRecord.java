/*
 * Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com)
 *
 * WSO2 LLC. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package io.ballerina.xsd.core;

import io.ballerina.compiler.syntax.tree.ModuleMemberDeclarationNode;
import io.ballerina.compiler.syntax.tree.ModulePartNode;
import io.ballerina.compiler.syntax.tree.NodeParser;
import io.ballerina.xsd.core.component.XSDComponent;
import io.ballerina.xsd.core.context.XSDContext;
import io.ballerina.xsd.core.diagnostic.XSDDiagnostic;
import io.ballerina.xsd.core.node.Kind;
import io.ballerina.xsd.core.node.MemberNode;
import io.ballerina.xsd.core.node.XSDElement;
import io.ballerina.xsd.core.response.NodeResponse;
import io.ballerina.xsd.core.response.Response;
import io.ballerina.xsd.core.visitor.Utils;
import io.ballerina.xsd.core.visitor.XSDVisitor;
import io.ballerina.xsd.core.visitor.XSDVisitorImpl;
import org.ballerinalang.formatter.core.FormatterException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import java.io.ByteArrayInputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import static io.ballerina.xsd.core.Utils.extractSubstring;
import static io.ballerina.xsd.core.diagnostic.DiagnosticMessage.xsdToBallerinaError;
import static io.ballerina.xsd.core.visitor.Utils.CLOSE_BRACES;
import static io.ballerina.xsd.core.visitor.Utils.COMMA;
import static io.ballerina.xsd.core.visitor.Utils.OPEN_BRACES;
import static io.ballerina.xsd.core.visitor.Utils.QUOTATION_MARK;
import static io.ballerina.xsd.core.visitor.Utils.STRING;
import static io.ballerina.xsd.core.visitor.Utils.WHITESPACE;
import static io.ballerina.xsd.core.visitor.XSDVisitorImpl.ENUM;
import static io.ballerina.xsd.core.visitor.XSDVisitorImpl.NAME;
import static io.ballerina.xsd.core.visitor.XSDVisitorImpl.PUBLIC;
import static io.ballerina.xsd.core.visitor.XSDVisitorImpl.RECORD_WITH_OPEN_BRACE;
import static io.ballerina.xsd.core.visitor.XSDVisitorImpl.SEMICOLON;
import static io.ballerina.xsd.core.visitor.XSDVisitorImpl.VERTICAL_BAR;

/**
 * This class is used for transforming an XSD into a corresponding record format.
 *
 * @since 0.1.0
 */
public final class XSDToRecord {
    public static final String SCHEMA = "schema";
    public static final String EOF_TOKEN = "";
    public static final String INVALID_IMPORTS_ERROR = "Invalid imports have been found.";
    public static final String INVALID_XSD_FORMAT_ERROR = "The provided XML document is not a valid XSD schema. " +
            "The root element must be a <schema>.";
    public static final String XMLDATA_NAME_ANNOTATION = "@xmldata:Name {value: \"%s\"}";
    public static final String EQUAL = "=";
    public static final String TARGET_NAMESPACE = "targetNamespace";

    private static final String CONTENT_FIELD = "\\#content";
    public static final String FILE_EXTENSION = ".bal";

    /**
     * Converts the given XSD content into a record containing the generated types and associated diagnostics.
     *
     * @param document XSD content in the form of a DOM document
     * @return a record containing the generated types and associated diagnostics
     * @throws Exception if an error occurs while parsing the XSD content
     */
    public static Response convert(Document document) throws Exception {
        XSDVisitor xsdVisitor = new XSDVisitorImpl();
        Map<String, MemberNode> nodes = generateNodes(document, xsdVisitor);
        NodeResponse response = generateTypes(xsdVisitor, nodes);
        String generatedTypes = io.ballerina.xsd.core.Utils.formatModuleParts(response.types());
        return new Response(generatedTypes, response.diagnostics());
    }

    /**
     * Converts a set of XSD documents into a map of file names and their corresponding records.
     *
     * @param documents a map of XSD documents and their corresponding file names
     * @return a map of file names and their corresponding records
     */
    public static Map<String, Response> convert(Map<Document, String> documents) throws Exception {
        Map<String, NodeResponse> typesMap = new LinkedHashMap<>();
        XSDVisitor xsdVisitor = new XSDVisitorImpl();
        ArrayList<String> existingTypes = new ArrayList<>();

        for (Map.Entry<Document, String> entry : documents.entrySet()) {
            Document document = entry.getKey();
            String fileName = entry.getValue();
            try {
                Map<String, MemberNode> nodes = new LinkedHashMap<>();
                Element rootElement = document.getDocumentElement();
                if (!Objects.equals(rootElement.getLocalName(), SCHEMA)) {
                    throw new Exception(INVALID_XSD_FORMAT_ERROR);
                }
                xsdVisitor.setTargetNamespace(rootElement.getAttribute(TARGET_NAMESPACE));
                xsdVisitor.clearImports();
                processNodeList(rootElement, nodes, xsdVisitor);
                handleExistingTypes(documents, typesMap, xsdVisitor, existingTypes, document, nodes);
            } catch (Exception e) {
                typesMap.put(fileName, new NodeResponse(null, xsdVisitor.getDiagnostics(), null));
            }
        }
        return typesMap.entrySet().stream()
                .collect(Collectors.toMap(Map.Entry::getKey, entry -> {
                    NodeResponse response = entry.getValue();
                    String generatedTypes;
                    try {
                        generatedTypes = io.ballerina.xsd.core.Utils.formatModuleParts(response.types());
                    } catch (FormatterException e) {
                        throw new RuntimeException(e);
                    }
                    return new Response(generatedTypes, response.diagnostics());
                }));
    }

    /**
     * Generates nodes from the given XSD content.
     *
     * @param xsdContent XSD content as a string
     * @return a map of element names and their corresponding record nodes
     * @throws Exception if an error occurs while parsing the XSD content
     */
    public static Map<String, MemberNode> generateNodes(String xsdContent) throws Exception {
        Document document = parseXSD(xsdContent);
        XSDVisitor xsdVisitor = new XSDVisitorImpl();
        return generateNodes(document, xsdVisitor);
    }

    /**
     * Generates nodes from multiple XSD contents.
     *
     * @param xsdContents XSD content as an array of strings
     * @return a map of element names and their corresponding record nodes
     */
    public static NodeResponse generateNodes(String... xsdContents) {
        XSDVisitor xsdVisitor = new XSDVisitorImpl();
        Map<String, MemberNode> typesMap = new LinkedHashMap<>();
        ArrayList<String> existingTypes = new ArrayList<>();
        int index = 0;
        try {
            for (String xsdContent : xsdContents) {
                Document document = parseXSD(xsdContent);
                Element rootElement = document.getDocumentElement();
                if (!Objects.equals(rootElement.getLocalName(), SCHEMA)) {
                    throw new Exception(INVALID_XSD_FORMAT_ERROR);
                }
                xsdVisitor.setTargetNamespace(rootElement.getAttribute(TARGET_NAMESPACE));
                Map<String, MemberNode> nodes = new LinkedHashMap<>();
                xsdVisitor.setTargetNamespace(rootElement.getAttribute(TARGET_NAMESPACE));
                xsdVisitor.clearImports();
                processNodeList(rootElement, nodes, xsdVisitor);
                handleExistingTypes(typesMap, xsdVisitor, existingTypes, nodes);
            }
            index++;
            return generateTypes(xsdVisitor, typesMap);
        } catch (Exception e) {
            String errorMessage = String.format(
                    "An error occurred while processing XSD content at index %d.%n Error: %s%n%n XSD Content: %n%s",
                    index, e.getMessage(), xsdContents[index]
            );
            xsdVisitor.getDiagnostics().add(xsdToBallerinaError(errorMessage));
            return new NodeResponse(null, xsdVisitor.getDiagnostics(), null);
        }
    }

    /**
     * Generates nodes as a syntax tree from multiple XSD contents.
     *
     * @param xsdContents XSD content as an array of strings
     * @return a {@link NodeResponse} containing the generated nodes as a syntax tree and diagnostics
     */
    public static NodeResponse generateNodes(ArrayList<String> xsdContents) {
        XSDVisitor xsdVisitor = new XSDVisitorImpl();
        Map<String, MemberNode> typesMap = new LinkedHashMap<>();
        ArrayList<String> existingTypes = new ArrayList<>();
        int index = 0;
        try {
            for (String xsdContent : xsdContents) {
                Document document = parseXSD(xsdContent);
                Element rootElement = document.getDocumentElement();
                if (!Objects.equals(rootElement.getLocalName(), SCHEMA)) {
                    throw new Exception(INVALID_XSD_FORMAT_ERROR);
                }
                xsdVisitor.setTargetNamespace(rootElement.getAttribute(TARGET_NAMESPACE));
                Map<String, MemberNode> nodes = new LinkedHashMap<>();
                xsdVisitor.setTargetNamespace(rootElement.getAttribute(TARGET_NAMESPACE));
                xsdVisitor.clearImports();
                processNodeList(rootElement, nodes, xsdVisitor);
                handleExistingTypes(typesMap, xsdVisitor, existingTypes, nodes);
            }
            index++;
            return generateTypes(xsdVisitor, typesMap);
        } catch (Exception e) {
            String errorMessage = String.format(
                    "An error occurred while processing XSD content at index %d.%n Error: %s%n%n XSD Content: %n%s",
                    index, e.getMessage(), xsdContents.get(index)
            );
            xsdVisitor.getDiagnostics().add(xsdToBallerinaError(errorMessage));
            return new NodeResponse(null, xsdVisitor.getDiagnostics(), null);
        }
    }

    /**
     * Generates nodes from the given XSD content.
     *
     * @param document XSD content in the form of a DOM document
     * @param xsdVisitor The visitor interface to visit the XSD components
     * @return a map of element names and their corresponding record nodes
     * @throws Exception if an error occurs while generating types from the XSD content
     */
    public static Map<String, MemberNode> generateNodes(Document document, XSDVisitor xsdVisitor) throws Exception {
        Element rootElement = document.getDocumentElement();
        if (!Objects.equals(rootElement.getLocalName(), SCHEMA)) {
            throw new Exception(INVALID_XSD_FORMAT_ERROR);
        }
        xsdVisitor.setTargetNamespace(rootElement.getAttribute(TARGET_NAMESPACE));
        Map<String, MemberNode> nodes = new LinkedHashMap<>();
        processNodeList(rootElement, nodes, xsdVisitor);
        return nodes;
    }

    /**
     * Generates nodes from the given XSD content.
     *
     * @param rootElement The root element of the XSD content
     * @param nodes The map of element names and their corresponding record nodes
     * @param xsdVisitor The visitor interface to visit the XSD components
     * @throws Exception if an error occurs while generating types from the XSD content
     */
    public static void generateNodes(Element rootElement, Map<String, MemberNode> nodes,
                                     XSDVisitor xsdVisitor) throws Exception {
        for (Node childNode : Utils.asIterable(rootElement.getChildNodes())) {
            if (childNode.getNodeType() != Node.ELEMENT_NODE) {
                continue;
            }
            StringBuilder stringBuilder = new StringBuilder();
            Optional<XSDComponent> component = XSDFactory.generateComponents(childNode);
            if (component.isEmpty()) {
                continue;
            }
            stringBuilder.append(component.get().accept(xsdVisitor));
            ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(stringBuilder.toString());
            String name = io.ballerina.xsd.core.Utils.extractTypeName(stringBuilder.toString().split(WHITESPACE));
            if (name == null && childNode.hasAttributes()) {
                name = childNode.getAttributes().getNamedItem(NAME).getNodeValue();
            }
            String resolvedName = name;
            if (nodes.containsKey(name)) {
                resolvedName = io.ballerina.xsd.core.Utils.resolveNameConflicts(name, nodes);
                xsdVisitor.getNameResolvers().put(resolvedName, new XSDElement(name, component.get().getKind()));
            }
            nodes.put(resolvedName, new MemberNode(moduleNode, component.get().getKind()));
        }
    }

    /**
     * Generates the residual nodes from the given XSD content.
     *
     * @param nodes The map of element names and their corresponding record nodes
     * @param xsdVisitor The visitor interface to visit the XSD components
     */
    public static void generateResidualNodes(Map<String, MemberNode> nodes, XSDVisitor xsdVisitor) {
        processRootElements(nodes, xsdVisitor.getRootElements());
        processNestedElements(nodes, xsdVisitor.getNestedElements());
        processNameResolvers(nodes, xsdVisitor.getNameResolvers());
        processExtensions(nodes, xsdVisitor);
        processEnumerations(nodes, xsdVisitor.getEnumerationElements());
    }

    private static NodeResponse generateTypes(XSDVisitor xsdVisitor,
                                              Map<String, MemberNode> nodes) throws Exception {
        ModulePartNode modulePartNode = io.ballerina.xsd.core.Utils.generateModulePartNode(nodes, xsdVisitor);
        List<XSDDiagnostic> diagnostics = xsdVisitor.getDiagnostics();
        XSDContext xsdContext = new XSDContext(nodes, xsdVisitor.getNameResolvers());
        return new NodeResponse(modulePartNode, diagnostics, xsdContext);
    }

    private static void handleExistingTypes(Map<String, MemberNode> typesMap,
                                            XSDVisitor xsdVisitor, Collection<String> existingTypes,
                                            Map<String, MemberNode> nodes) {
        for (String type : existingTypes) {
            nodes.remove(type);
        }
        typesMap.putAll(nodes);
        existingTypes.addAll(nodes.keySet());
        for (ArrayList<String> array: xsdVisitor.getEnumerationElements().values()) {
            existingTypes.addAll(array);
        }
    }

    private static void handleExistingTypes(Map<Document, String> documents, Map<String, NodeResponse> typesMap,
                                            XSDVisitor xsdVisitor, ArrayList<String> existingTypes, Document document,
                                            Map<String, MemberNode> nodes) throws Exception {
        existingTypes.forEach(nodes.keySet()::remove);
        typesMap.put(documents.get(document) + FILE_EXTENSION, generateTypes(xsdVisitor, nodes));
        existingTypes.addAll(nodes.keySet());
        for (ArrayList<String> array: xsdVisitor.getEnumerationElements().values()) {
            existingTypes.addAll(array);
        }
    }

    private static void processNodeList(Element rootElement, Map<String, MemberNode> nodes,
                                        XSDVisitor xsdVisitor) throws Exception {
        generateNodes(rootElement, nodes, xsdVisitor);
        generateResidualNodes(nodes, xsdVisitor);
    }

    private static void processRootElements(Map<String, MemberNode> nodes,
                                            Map<String, String> rootElements) {
        for (Map.Entry<String, String> entry : rootElements.entrySet()) {
            String element = entry.getKey();
            String type = entry.getValue();
            if (nodes.containsKey(type)) {
                String[] tokens = nodes.get(type).node().toString().split(WHITESPACE);
                if (!nodes.get(type).node().toString().contains(RECORD_WITH_OPEN_BRACE) && nodes.containsKey(element)) {
                    io.ballerina.xsd.core.Utils.processSingleTypeElements(nodes, element, type, tokens, CONTENT_FIELD);
                } else {
                    io.ballerina.xsd.core.Utils.processRecordTypeElements(nodes, element, type, CONTENT_FIELD);
                }
            } else if (nodes.containsKey(element)) {
                String rootElement = nodes.get(element).node().toString().replace(type, STRING);
                ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(rootElement);
                nodes.put(element, new MemberNode(moduleNode, Kind.ELEMENT));
            }
        }
    }

    private static void processNestedElements(Map<String, MemberNode> nodes,
                                              Map<String, XSDElement> nestedElements) {
        for (Map.Entry<String, XSDElement> entry : nestedElements.entrySet()) {
            String element = entry.getKey();
            XSDElement xsdElement = entry.getValue();
            ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(xsdElement.type());
            nodes.put(element, new MemberNode(moduleNode, xsdElement.kind()));
        }
    }

    private static void processNameResolvers(Map<String, MemberNode> nodes, Map<String, XSDElement> nameResolvers) {
        for (Map.Entry<String, XSDElement> entry : nameResolvers.entrySet()) {
            String element = entry.getKey();
            XSDElement annotation = entry.getValue();
            if (nodes.containsKey(element)) {
                String node = nodes.get(element).node().toString();
                node = node.replace(annotation.type() + WHITESPACE, element + WHITESPACE);
                String newNode = String.format(XMLDATA_NAME_ANNOTATION, annotation.type()) + node;
                ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(newNode);
                nodes.put(element, new MemberNode(moduleNode, annotation.kind()));
            }
        }
    }

    private static void processExtensions(Map<String, MemberNode> nodes, XSDVisitor xsdVisitor) {
        Map<String, XSDElement> extensions = xsdVisitor.getExtensions();
        for (Map.Entry<String, XSDElement> entry : extensions.entrySet()) {
            String key = entry.getKey();
            XSDElement baseValue = entry.getValue();
            if (!nodes.containsKey(key)) {
                continue;
            }
            if (Utils.isSimpleType(baseValue.type()) && nodes.containsKey(key)) {
                String fields = RECORD_WITH_OPEN_BRACE + baseValue + WHITESPACE + CONTENT_FIELD + SEMICOLON;
                String extendedValue = nodes.get(key).node().toString().replace(RECORD_WITH_OPEN_BRACE, fields);
                ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(extendedValue);
                nodes.replace(key, new MemberNode(moduleNode, Kind.SIMPLE_TYPE));
            } else {
                MemberNode baseNode = nodes.get(baseValue.type());
                if (baseNode == null) {
                    continue;
                }
                MemberNode parentNode = nodes.get(key);
                String fields = extractSubstring(baseNode.node().toString(), RECORD_WITH_OPEN_BRACE,
                        VERTICAL_BAR + CLOSE_BRACES + SEMICOLON, CONTENT_FIELD);
                fields = RECORD_WITH_OPEN_BRACE + fields;
                String extendedValue = parentNode.node().toString().replace(RECORD_WITH_OPEN_BRACE, fields);
                ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(extendedValue);
                nodes.replace(key, new MemberNode(moduleNode, baseValue.kind()));
            }
        }
    }

    private static void processEnumerations(Map<String, MemberNode> nodes,
                                            Map<String, ArrayList<String>> enumerations) {
        for (Map.Entry<String, ArrayList<String>> entry : enumerations.entrySet()) {
            String key = entry.getKey();
            ArrayList<String> enums = entry.getValue();
            StringBuilder enumBuilder = new StringBuilder();
            for (String enumValue : enums) {
                if (nodes.containsKey(enumValue)) {
                    enumValue = enumValue.toLowerCase(Locale.ROOT) +
                            WHITESPACE + EQUAL + QUOTATION_MARK + enumValue + QUOTATION_MARK;
                }
                enumBuilder.append(enumValue).append(COMMA);
            }
            String enumeration;
            if (nodes.containsKey(key)) {
                enumeration = nodes.get(key).node().toString();
                String replacingString = ENUM + WHITESPACE + key + WHITESPACE + OPEN_BRACES;
                enumeration = enumeration.replace(replacingString, replacingString + enumBuilder.substring(0,
                        enumBuilder.length() - 1));
                ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(enumeration);
                nodes.put(key, new MemberNode(moduleNode, Kind.ENUM));
            } else {
                enumeration = PUBLIC + WHITESPACE + ENUM + WHITESPACE + key + WHITESPACE +
                        OPEN_BRACES + enumBuilder.substring(0, enumBuilder.length() - 1) + CLOSE_BRACES + SEMICOLON;
            }
            ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(enumeration);
            nodes.put(key, new MemberNode(moduleNode, Kind.ENUM));
        }
    }

    static Document parseXSD(String xsdData) throws Exception {
        ByteArrayInputStream inputStream = new ByteArrayInputStream(xsdData.getBytes(StandardCharsets.UTF_8));
        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        dbFactory.setNamespaceAware(true);
        DocumentBuilder docBuilder = dbFactory.newDocumentBuilder();
        return docBuilder.parse(inputStream);
    }
}
