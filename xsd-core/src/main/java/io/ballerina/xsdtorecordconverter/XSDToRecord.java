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

package io.ballerina.xsdtorecordconverter;

import io.ballerina.compiler.syntax.tree.AbstractNodeFactory;
import io.ballerina.compiler.syntax.tree.ImportDeclarationNode;
import io.ballerina.compiler.syntax.tree.ModuleMemberDeclarationNode;
import io.ballerina.compiler.syntax.tree.ModulePartNode;
import io.ballerina.compiler.syntax.tree.NodeFactory;
import io.ballerina.compiler.syntax.tree.NodeList;
import io.ballerina.compiler.syntax.tree.NodeParser;
import io.ballerina.compiler.syntax.tree.Token;
import io.ballerina.xsdtorecordconverter.component.XSDComponent;
import io.ballerina.xsdtorecordconverter.visitor.VisitorUtils;
import io.ballerina.xsdtorecordconverter.visitor.XSDVisitorImpl;
import org.ballerinalang.formatter.core.Formatter;
import org.ballerinalang.formatter.core.FormatterException;
import org.ballerinalang.formatter.core.options.ForceFormattingOptions;
import org.ballerinalang.formatter.core.options.FormattingOptions;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;

import static io.ballerina.xsdtorecordconverter.visitor.XSDVisitorImpl.CLOSE_BRACES;
import static io.ballerina.xsdtorecordconverter.visitor.XSDVisitorImpl.CONTENT_FIELD;
import static io.ballerina.xsdtorecordconverter.visitor.XSDVisitorImpl.NAME;
import static io.ballerina.xsdtorecordconverter.visitor.XSDVisitorImpl.SEMICOLON;
import static io.ballerina.xsdtorecordconverter.visitor.XSDVisitorImpl.STRING;
import static io.ballerina.xsdtorecordconverter.visitor.XSDVisitorImpl.TYPE;
import static io.ballerina.xsdtorecordconverter.visitor.XSDVisitorImpl.VERTICAL_BAR;
import static io.ballerina.xsdtorecordconverter.visitor.XSDVisitorImpl.WHITESPACE;

/**
 * This class is used for transforming an XSD into a corresponding record format.
 */
public final class XSDToRecord {
    public static final String SCHEMA = "schema";
    public static final String EOF_TOKEN = "";
    public static final String INVALID_IMPORTS_ERROR = "Invalid imports have been found.";
    public static final String INVALID_XSD_FORMAT_ERROR = "The provided XML document is not a valid XSD schema. " +
            "The root element must be a <schema>.";
    public static final String XMLDATA_NAME_ANNOTATION = "@xmldata:Name {value: \"%s\"}";

    public static String convert(Document document) throws Exception {
        Element rootElement = document.getDocumentElement();
        if (!Objects.equals(rootElement.getLocalName(), SCHEMA)) {
            throw new Exception(INVALID_XSD_FORMAT_ERROR);
        }
        HashMap<String, ModuleMemberDeclarationNode> nodes = new LinkedHashMap<>();
        XSDVisitorImpl xsdVisitor = new XSDVisitorImpl();
        processNodeList(rootElement, nodes, xsdVisitor);
        ModulePartNode modulePartNode = generateModulePartNode(nodes, xsdVisitor);
        return formatModuleParts(modulePartNode);
    }

    private static ModulePartNode generateModulePartNode(HashMap<String, ModuleMemberDeclarationNode> nodes,
                                                         XSDVisitorImpl xsdVisitor) throws Exception {
        NodeList<ModuleMemberDeclarationNode> moduleMembers = AbstractNodeFactory.createNodeList(nodes.values());
        NodeList<ImportDeclarationNode> imports = getImportDeclarations(xsdVisitor);
        Token eofToken = AbstractNodeFactory.createIdentifierToken(EOF_TOKEN);
        return NodeFactory.createModulePartNode(imports, moduleMembers, eofToken);
    }

    private static void processNodeList(Element rootElement, HashMap<String, ModuleMemberDeclarationNode> nodes,
                                        XSDVisitorImpl xsdVisitor) throws Exception {
        generateNodes(rootElement, nodes, xsdVisitor);
        processRootElements(nodes, xsdVisitor.getRootElements());
        processNestedElements(nodes, xsdVisitor.getNestedElements());
        processNameResolvers(nodes, xsdVisitor.getNameResolvers());
        processExtensions(nodes, xsdVisitor);
    }

    private static void processNameResolvers(HashMap<String, ModuleMemberDeclarationNode> nodes,
                                             LinkedHashMap<String, String> nameResolvers) {
        for (String element: nameResolvers.keySet()) {
            String node = nodes.get(element).toString();
            String newNode = String.format(XMLDATA_NAME_ANNOTATION, nameResolvers.get(element)) + node;
            ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(newNode);
            nodes.put(element, moduleNode);
        }
    }

    private static void processNestedElements(HashMap<String, ModuleMemberDeclarationNode> nodes,
                                              HashMap<String, String> nestedElements) {
        for (String element: nestedElements.keySet()) {
            String nestedElement = nestedElements.get(element);
            ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(nestedElement);
            nodes.put(element, moduleNode);
        }
    }

    private static void processRootElements(HashMap<String, ModuleMemberDeclarationNode> nodes,
                                            HashMap<String, String> rootElements) {
        for (String element: rootElements.keySet()) {
            String type = rootElements.get(element);
            String[] tokens = nodes.get(type).toString().split(WHITESPACE);
            if (!nodes.get(type).toString().contains(XSDVisitorImpl.RECORD_WITH_OPEN_BRACE)) {
                processSingleTypeElements(nodes, element, type, tokens);
            } else {
                processRecordTypeElements(nodes, element, type);
            }
        }
    }

    private static void processRecordTypeElements(HashMap<String, ModuleMemberDeclarationNode> nodes,
                                                  String element, String type) {
        String fields = extractSubstring(nodes.get(type).toString(), XSDVisitorImpl.RECORD_WITH_OPEN_BRACE,
                                         VERTICAL_BAR + CLOSE_BRACES + SEMICOLON);
        String extendedValue = nodes.get(element)
                .toString().replace(type + WHITESPACE + CONTENT_FIELD + SEMICOLON, fields);
        ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(extendedValue);
        nodes.put(element, moduleNode);
    }

    private static void processSingleTypeElements(HashMap<String, ModuleMemberDeclarationNode> nodes,
                                                  String element, String type, String[] tokens) {
        String token = nodes.get(type).toString().contains(XSDVisitorImpl.ENUM) ? STRING : tokens[tokens.length - 2];
        String rootElement = nodes.get(element).toString().replace(type + WHITESPACE + CONTENT_FIELD,
                token + WHITESPACE + CONTENT_FIELD);
        ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(rootElement);
        nodes.put(element, moduleNode);
    }

    private static void generateNodes(Element rootElement, HashMap<String, ModuleMemberDeclarationNode> nodes,
                                      XSDVisitorImpl xsdVisitor) throws Exception {
        for (Node childNode : VisitorUtils.asIterable(rootElement.getChildNodes())) {
            if (childNode.getNodeType() != Node.ELEMENT_NODE) {
                continue;
            }
            StringBuilder stringBuilder = new StringBuilder();
            XSDComponent component = XSDFactory.generateComponents(childNode);
            if (component == null) {
                continue;
            }
            stringBuilder.append(component.accept(xsdVisitor));
            ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(stringBuilder.toString());
            String name = extractTypeName(moduleNode.toString().split(WHITESPACE));
            if (name == null) {
                name = childNode.getAttributes().getNamedItem(NAME).getNodeValue();
            }
            nodes.put(nodes.containsKey(name) ? resolveNameConflicts(name, nodes) : name, moduleNode);
        }
    }

    public static String resolveNameConflicts(String name, Map<?, ?> nodes) {
        String baseName = name;
        int counter = 1;
        while (nodes.containsKey(name)) {
            name = baseName + counter;
            counter++;
        }
        return name;
    }

    public static String extractTypeName(String[] values) {
        String previous = null;
        for (String current : values) {
            if (TYPE.equals(previous)) {
                return current;
            }
            previous = current;
        }
        return null;
    }

    private static void processExtensions(HashMap<String,
                                          ModuleMemberDeclarationNode> nodes, XSDVisitorImpl xsdVisitor) {
        LinkedHashMap<String, String> extensions = xsdVisitor.getExtensions();
        for (String key: extensions.keySet()) {
            if (!nodes.containsKey(key)) {
                continue;
            }
            String baseValue = extensions.get(key);
            ModuleMemberDeclarationNode baseNode = nodes.get(baseValue);
            ModuleMemberDeclarationNode parentNode = nodes.get(key);
            String fields = extractSubstring(baseNode.toString(), XSDVisitorImpl.RECORD_WITH_OPEN_BRACE,
                                             VERTICAL_BAR + CLOSE_BRACES + SEMICOLON);
            fields = XSDVisitorImpl.RECORD_WITH_OPEN_BRACE + fields;
            String extendedValue = parentNode.toString().replace(XSDVisitorImpl.RECORD_WITH_OPEN_BRACE, fields);
            ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(extendedValue);
            nodes.replace(key, moduleNode);
        }
    }

    public static String extractSubstring(String baseString, String startToken, String endToken) {
        if (!baseString.contains(startToken)) {
            return baseString.split(WHITESPACE)[baseString.split(WHITESPACE).length - 2] +
                    WHITESPACE + CONTENT_FIELD + SEMICOLON;
        }
        int startIndex = baseString.indexOf(startToken) + startToken.length();
        int endIndex = baseString.indexOf(endToken, startIndex);
        return baseString.substring(startIndex, endIndex);
    }

    public static NodeList<ImportDeclarationNode> getImportDeclarations(XSDVisitorImpl xsdVisitor) throws Exception {
        Collection<ImportDeclarationNode> imports = new ArrayList<>();
        for (String module : xsdVisitor.getImports()) {
            ImportDeclarationNode node = NodeParser.parseImportDeclaration(module);
            if (node.hasDiagnostics()) {
                throw new Exception(INVALID_IMPORTS_ERROR);
            }
            imports.add(node);
        }
        return AbstractNodeFactory.createNodeList(imports);
    }

    public static String formatModuleParts(ModulePartNode modulePartNode) throws FormatterException {
        ForceFormattingOptions forceFormattingOptions = ForceFormattingOptions.builder()
                .setForceFormatRecordFields(true).build();
        FormattingOptions formattingOptions = FormattingOptions.builder()
                .setForceFormattingOptions(forceFormattingOptions).build();
        return Formatter.format(modulePartNode.syntaxTree(), formattingOptions).toSourceCode();
    }
}
