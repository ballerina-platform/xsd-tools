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
import org.ballerinalang.formatter.core.Formatter;
import org.ballerinalang.formatter.core.FormatterException;
import org.ballerinalang.formatter.core.options.ForceFormattingOptions;
import org.ballerinalang.formatter.core.options.FormattingOptions;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import java.io.ByteArrayInputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import static io.ballerina.xsdtorecordconverter.XSDVisitor.CLOSE_BRACES;
import static io.ballerina.xsdtorecordconverter.XSDVisitor.NAME;
import static io.ballerina.xsdtorecordconverter.XSDVisitor.NEW_LINE;
import static io.ballerina.xsdtorecordconverter.XSDVisitor.OPEN_BRACES;
import static io.ballerina.xsdtorecordconverter.XSDVisitor.RECORD;
import static io.ballerina.xsdtorecordconverter.XSDVisitor.SEMICOLON;
import static io.ballerina.xsdtorecordconverter.XSDVisitor.TYPE_NAME_SUFFIX;
import static io.ballerina.xsdtorecordconverter.XSDVisitor.WHITESPACE;

public class XSDToRecord {
    public static final String EOF_TOKEN = "";
    public static final String INVALID_IMPORTS_ERROR = "Invalid imports have been found.";

    public static String convert(String xsdData) {
        try {
            ByteArrayInputStream inputStream = new ByteArrayInputStream(xsdData.getBytes(StandardCharsets.UTF_8));
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            dbFactory.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true);
            dbFactory.setNamespaceAware(true);
            DocumentBuilder docBuilder = dbFactory.newDocumentBuilder();
            Document doc = docBuilder.parse(inputStream);
            Element rootElement = doc.getDocumentElement();
            HashMap<String, ModuleMemberDeclarationNode> nodes = new LinkedHashMap<>();
            XSDVisitor xsdVisitor = new XSDVisitor();
            for (int i = 0; i < rootElement.getChildNodes().getLength(); i++) {
                if (rootElement.getChildNodes().item(i).getNodeType() == org.w3c.dom.Node.ELEMENT_NODE) {
                    StringBuilder stringBuilder = new StringBuilder();
                    IComponent component = XSDFactory.generateComponents(rootElement.getChildNodes().item(i));
                    if (component != null) {
                        stringBuilder.append(component.accept(xsdVisitor));
                        String[] types = stringBuilder.toString().split(NEW_LINE);
                        for (String type : types) {
                            ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(type);
                            String name = rootElement
                                    .getChildNodes().item(i).getAttributes().getNamedItem(NAME).getNodeValue();
                            if (!nodes.containsKey(name)) {
                                nodes.put(name, moduleNode);
                            } else {
                                nodes.put(name + TYPE_NAME_SUFFIX, moduleNode);
                            }
                        }
                    }
                }
            }
            handleExtensions(nodes, xsdVisitor);
            NodeList<ModuleMemberDeclarationNode> moduleMembers = AbstractNodeFactory.createNodeList(nodes.values());
            NodeList<ImportDeclarationNode> imports = getImportDeclarations(xsdVisitor);
            Token eofToken = AbstractNodeFactory.createIdentifierToken(EOF_TOKEN);
            ModulePartNode modulePartNode = NodeFactory.createModulePartNode(imports, moduleMembers, eofToken);
            return formatModuleParts(modulePartNode);
        } catch (Exception e) {
            return e.getMessage();
        }
    }

    private static void handleExtensions(HashMap<String, ModuleMemberDeclarationNode> nodes, XSDVisitor xsdVisitor) {
        LinkedHashMap<String, String> extensions = xsdVisitor.getExtensions();
        for (String key: extensions.keySet()) {
            if (nodes.containsKey(key)) {
                String value = extensions.get(key);
                String attributes = value.substring(value.indexOf(OPEN_BRACES) + 1, value.indexOf(CLOSE_BRACES));
                attributes += CLOSE_BRACES;
                String extendedValue = nodes.get(key).toString().replace(CLOSE_BRACES, attributes);
                if (nodes.get(key).toString().equals(extendedValue)) {
                    String recordPart = WHITESPACE + RECORD + WHITESPACE + OPEN_BRACES;
                    String[] tokens = extendedValue.substring(0, extendedValue.length() - 1).split(WHITESPACE);
                    recordPart = recordPart + tokens[3] + WHITESPACE + tokens[2] + SEMICOLON;
                    extendedValue = value.replace(OPEN_BRACES, recordPart);
                }
                ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(extendedValue);
                nodes.replace(key, moduleNode);
            }
        }
    }

    public static NodeList<ImportDeclarationNode> getImportDeclarations(XSDVisitor xsdVisitor) throws Exception {
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
