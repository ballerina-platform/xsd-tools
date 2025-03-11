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
import io.ballerina.xsd.core.diagnostic.XsdDiagnostic;
import io.ballerina.xsd.core.visitor.VisitorUtils;
import io.ballerina.xsd.core.visitor.XSDVisitor;
import io.ballerina.xsd.core.visitor.XSDVisitorImpl;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;

import static io.ballerina.xsd.core.visitor.VisitorUtils.CLOSE_BRACES;
import static io.ballerina.xsd.core.visitor.VisitorUtils.COMMA;
import static io.ballerina.xsd.core.visitor.VisitorUtils.OPEN_BRACES;
import static io.ballerina.xsd.core.visitor.VisitorUtils.QUOTATION_MARK;
import static io.ballerina.xsd.core.visitor.VisitorUtils.WHITESPACE;
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

    public static Response convert(Document document) throws Exception {
        Element rootElement = document.getDocumentElement();
        if (!Objects.equals(rootElement.getLocalName(), SCHEMA)) {
            throw new Exception(INVALID_XSD_FORMAT_ERROR);
        }
        XSDVisitor xsdVisitor = new XSDVisitorImpl();
        xsdVisitor.setTargetNamespace(rootElement.getAttribute(TARGET_NAMESPACE));
        Map<String, ModuleMemberDeclarationNode> nodes = new LinkedHashMap<>();
        processNodeList(rootElement, nodes, xsdVisitor);
        return generateTypes(xsdVisitor, nodes);
    }

    public static Map<String, Response> convert(Map<Document, String> documents) throws Exception {
        Map<String, Response> typesMap = new LinkedHashMap<>();
        XSDVisitor xsdVisitor = new XSDVisitorImpl();
        ArrayList<String> existingTypes = new ArrayList<>();
        for (Document document : documents.keySet()) {
            Map<String, ModuleMemberDeclarationNode> nodes = new LinkedHashMap<>();
            Element rootElement = document.getDocumentElement();
            if (!Objects.equals(rootElement.getLocalName(), SCHEMA)) {
                throw new Exception(INVALID_XSD_FORMAT_ERROR);
            }
            xsdVisitor.setTargetNamespace(rootElement.getAttribute(TARGET_NAMESPACE));
            xsdVisitor.clearImports();
            processNodeList(rootElement, nodes, xsdVisitor);
            handleExistingTypes(documents, typesMap, xsdVisitor, existingTypes, document, nodes);
        }
        return typesMap;
    }

    private static Response generateTypes(XSDVisitor xsdVisitor,
                                          Map<String, ModuleMemberDeclarationNode> nodes) throws Exception {
        ModulePartNode modulePartNode = Utils.generateModulePartNode(nodes, xsdVisitor);
        String generatedTypes = Utils.formatModuleParts(modulePartNode);
        List<XsdDiagnostic> diagnostics = xsdVisitor.getDiagnostics();
        return new Response(generatedTypes, diagnostics);
    }

    private static void handleExistingTypes(Map<Document, String> documents, Map<String, Response> typesMap,
                                            XSDVisitor xsdVisitor, ArrayList<String> existingTypes, Document document,
                                            Map<String, ModuleMemberDeclarationNode> nodes) throws Exception {
        for (String type : existingTypes) {
            nodes.remove(type);
        }
        typesMap.put(documents.get(document) + FILE_EXTENSION, generateTypes(xsdVisitor, nodes));
        existingTypes.addAll(nodes.keySet());
        for (ArrayList<String> array: xsdVisitor.getEnumerationElements().values()) {
            existingTypes.addAll(array);
        }
    }

    private static void processNodeList(Element rootElement, Map<String, ModuleMemberDeclarationNode> nodes,
                                        XSDVisitor xsdVisitor) throws Exception {
        generateNodes(rootElement, nodes, xsdVisitor);
        processRootElements(nodes, xsdVisitor.getRootElements());
        processNestedElements(nodes, xsdVisitor.getNestedElements());
        processNameResolvers(nodes, xsdVisitor.getNameResolvers());
        processExtensions(nodes, xsdVisitor);
        processEnumerations(nodes, xsdVisitor.getEnumerationElements());
    }

    public static void generateNodes(Element rootElement, Map<String, ModuleMemberDeclarationNode> nodes,
                                      XSDVisitor xsdVisitor) throws Exception {
        for (Node childNode : VisitorUtils.asIterable(rootElement.getChildNodes())) {
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
            String name = Utils.extractTypeName(moduleNode.toString().split(WHITESPACE));
            if (name == null && childNode.hasAttributes()) {
                name = childNode.getAttributes().getNamedItem(NAME).getNodeValue();
            }
            String resolvedName = nodes.containsKey(name) ? Utils.resolveNameConflicts(name, nodes) : name;
            nodes.put(resolvedName, moduleNode);
        }
    }

    public static void processRootElements(Map<String, ModuleMemberDeclarationNode> nodes,
                                            Map<String, String> rootElements) {
        for (Map.Entry<String, String> entry : rootElements.entrySet()) {
            String element = entry.getKey();
            String type = entry.getValue();
            String[] tokens = nodes.get(type).toString().split(WHITESPACE);
            if (!nodes.get(type).toString().contains(RECORD_WITH_OPEN_BRACE)) {
                Utils.processSingleTypeElements(nodes, element, type, tokens, CONTENT_FIELD);
            } else {
                Utils.processRecordTypeElements(nodes, element, type, CONTENT_FIELD);
            }
        }
    }

    public static void processNestedElements(Map<String, ModuleMemberDeclarationNode> nodes,
                                              Map<String, String> nestedElements) {
        for (Map.Entry<String, String> entry : nestedElements.entrySet()) {
            String element = entry.getKey();
            String nestedElement = entry.getValue();
            ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(nestedElement);
            nodes.put(element, moduleNode);
        }
    }

    public static void processNameResolvers(Map<String, ModuleMemberDeclarationNode> nodes,
                                             Map<String, String> nameResolvers) {
        for (Map.Entry<String, String> entry : nameResolvers.entrySet()) {
            String element = entry.getKey();
            String annotation = entry.getValue();
            String node = nodes.get(element).toString();
            node = node.replace(annotation + WHITESPACE, element + WHITESPACE);
            String newNode = String.format(XMLDATA_NAME_ANNOTATION, annotation) + node;
            ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(newNode);
            nodes.put(element, moduleNode);
        }
    }

    public static void processExtensions(Map<String, ModuleMemberDeclarationNode> nodes, XSDVisitor xsdVisitor) {
        Map<String, String> extensions = xsdVisitor.getExtensions();
        for (Map.Entry<String, String> entry : extensions.entrySet()) {
            String key = entry.getKey();
            String baseValue = entry.getValue();
            if (!nodes.containsKey(key)) {
                continue;
            }
            if (VisitorUtils.isSimpleType(baseValue)) {
                String fields = RECORD_WITH_OPEN_BRACE + baseValue + WHITESPACE + CONTENT_FIELD + SEMICOLON;
                ModuleMemberDeclarationNode parentNode = nodes.get(key);
                String extendedValue = parentNode.toString().replace(RECORD_WITH_OPEN_BRACE, fields);
                ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(extendedValue);
                nodes.replace(key, moduleNode);
            } else {
                ModuleMemberDeclarationNode baseNode = nodes.get(baseValue);
                if (baseNode == null) {
                    continue;
                }
                ModuleMemberDeclarationNode parentNode = nodes.get(key);
                String fields = Utils.extractSubstring(baseNode.toString(), RECORD_WITH_OPEN_BRACE,
                        VERTICAL_BAR + CLOSE_BRACES + SEMICOLON, CONTENT_FIELD);
                fields = RECORD_WITH_OPEN_BRACE + fields;
                String extendedValue = parentNode.toString().replace(RECORD_WITH_OPEN_BRACE, fields);
                ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(extendedValue);
                nodes.replace(key, moduleNode);
            }
        }
    }

    public static void processEnumerations(Map<String, ModuleMemberDeclarationNode> nodes,
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
                enumeration = nodes.get(key).toString();
                String replacingString = ENUM + WHITESPACE + key + WHITESPACE + OPEN_BRACES;
                enumeration = enumeration.replace(replacingString, replacingString + enumBuilder.substring(0,
                        enumBuilder.length() - 1));
                ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(enumeration);
                nodes.put(key, moduleNode);
            } else {
                enumeration = PUBLIC + WHITESPACE + ENUM + WHITESPACE + key + WHITESPACE +
                        OPEN_BRACES + enumBuilder.substring(0, enumBuilder.length() - 1) + CLOSE_BRACES + SEMICOLON;
            }
            ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(enumeration);
            nodes.put(key, moduleNode);
        }
    }
}
