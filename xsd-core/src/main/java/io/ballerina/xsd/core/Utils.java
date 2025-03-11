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

import io.ballerina.compiler.syntax.tree.AbstractNodeFactory;
import io.ballerina.compiler.syntax.tree.ImportDeclarationNode;
import io.ballerina.compiler.syntax.tree.ModuleMemberDeclarationNode;
import io.ballerina.compiler.syntax.tree.ModulePartNode;
import io.ballerina.compiler.syntax.tree.NodeFactory;
import io.ballerina.compiler.syntax.tree.NodeList;
import io.ballerina.compiler.syntax.tree.NodeParser;
import io.ballerina.compiler.syntax.tree.Token;
import io.ballerina.xsd.core.visitor.XSDVisitor;
import io.ballerina.xsd.core.visitor.XSDVisitorImpl;
import org.ballerinalang.formatter.core.Formatter;
import org.ballerinalang.formatter.core.FormatterException;
import org.ballerinalang.formatter.core.options.ForceFormattingOptions;
import org.ballerinalang.formatter.core.options.FormattingOptions;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import static io.ballerina.xsd.core.visitor.XSDVisitorImpl.CLOSE_BRACES;
import static io.ballerina.xsd.core.visitor.XSDVisitorImpl.RECORD_WITH_OPEN_BRACE;
import static io.ballerina.xsd.core.visitor.XSDVisitorImpl.SEMICOLON;
import static io.ballerina.xsd.core.visitor.XSDVisitorImpl.STRING;
import static io.ballerina.xsd.core.visitor.XSDVisitorImpl.TYPE;
import static io.ballerina.xsd.core.visitor.XSDVisitorImpl.VERTICAL_BAR;
import static io.ballerina.xsd.core.visitor.XSDVisitorImpl.WHITESPACE;

/**
 * This class contains util functions for converting XSD to Ballerina Record types.
 *
 * @since 0.1.0
 */
public class Utils {

    private Utils() {
    }

    public static ModulePartNode generateModulePartNode(Map<String, ModuleMemberDeclarationNode> nodes,
                                                 XSDVisitor xsdVisitor) throws Exception {
        NodeList<ModuleMemberDeclarationNode> moduleMembers = AbstractNodeFactory.createNodeList(nodes.values());
        NodeList<ImportDeclarationNode> imports = getImportDeclarations(xsdVisitor);
        Token eofToken = AbstractNodeFactory.createIdentifierToken(XSDToRecord.EOF_TOKEN);
        return NodeFactory.createModulePartNode(imports, moduleMembers, eofToken);
    }

    static void processRecordTypeElements(Map<String, ModuleMemberDeclarationNode> nodes,
                                          String element, String type, String contentField) {
        String fields = extractSubstring(nodes.get(type).toString(), RECORD_WITH_OPEN_BRACE,
                               VERTICAL_BAR + CLOSE_BRACES + SEMICOLON, contentField);
        String extendedValue = nodes.get(element)
                .toString().replace(type + WHITESPACE + contentField + SEMICOLON, fields);
        ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(extendedValue);
        nodes.put(element, moduleNode);
    }

    static void processSingleTypeElements(Map<String, ModuleMemberDeclarationNode> nodes,
                                          String element, String type, String[] tokens, String contentField) {
        String token = (!nodes.containsKey(type)) || nodes.get(type).toString().contains(XSDVisitorImpl.ENUM)
                ? STRING : tokens[tokens.length - 2];
        String rootElement = nodes.get(element).toString().replace(type + WHITESPACE + contentField,
                token + WHITESPACE + contentField);
        ModuleMemberDeclarationNode moduleNode = NodeParser.parseModuleMemberDeclaration(rootElement);
        nodes.put(element, moduleNode);
    }

    static String extractSubstring(String baseString, String startToken, String endToken, String contentField) {
        if (!baseString.contains(startToken)) {
            return baseString.split(WHITESPACE)[baseString.split(WHITESPACE).length - 2] +
                    WHITESPACE + contentField + SEMICOLON;
        }
        int startIndex = baseString.indexOf(startToken) + startToken.length();
        int endIndex = baseString.indexOf(endToken, startIndex);
        return baseString.substring(startIndex, endIndex);
    }

    static NodeList<ImportDeclarationNode> getImportDeclarations(XSDVisitor xsdVisitor) throws Exception {
        Collection<ImportDeclarationNode> imports = new ArrayList<>();
        for (String module : xsdVisitor.getImports()) {
            ImportDeclarationNode node = NodeParser.parseImportDeclaration(module);
            if (node.hasDiagnostics()) {
                throw new Exception(XSDToRecord.INVALID_IMPORTS_ERROR);
            }
            imports.add(node);
        }
        return AbstractNodeFactory.createNodeList(imports);
    }

    static String formatModuleParts(ModulePartNode modulePartNode) throws FormatterException {
        ForceFormattingOptions forceFormattingOptions = ForceFormattingOptions.builder()
                .setForceFormatRecordFields(true).build();
        FormattingOptions formattingOptions = FormattingOptions.builder()
                .setForceFormattingOptions(forceFormattingOptions).build();
        return Formatter.format(modulePartNode.syntaxTree(), formattingOptions).toSourceCode();
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

    public static String resolveNameConflicts(String name, ArrayList<?> nodes) {
        String baseName = name;
        int counter = 1;
        while (nodes.contains(name)) {
            name = baseName + counter;
            counter++;
        }
        return name;
    }

    static String extractTypeName(String[] values) {
        String previous = null;
        for (String current : values) {
            if (TYPE.equals(previous)) {
                return current;
            }
            previous = current;
        }
        return null;
    }
}
