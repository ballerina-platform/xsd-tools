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

package io.ballerina.xsdtorecordconverter.visitor;

import io.ballerina.compiler.syntax.tree.ModuleMemberDeclarationNode;
import io.ballerina.compiler.syntax.tree.SyntaxKind;
import io.ballerina.xsdtorecordconverter.component.ComplexType;
import io.ballerina.xsdtorecordconverter.component.Element;
import io.ballerina.xsdtorecordconverter.component.IComponent;
import io.ballerina.xsdtorecordconverter.component.SimpleType;
import io.ballerina.xsdtorecordconverter.XSDFactory;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import static io.ballerina.xsdtorecordconverter.visitor.VisitorUtils.addNamespace;
import static io.ballerina.xsdtorecordconverter.visitor.VisitorUtils.asIterable;
import static io.ballerina.xsdtorecordconverter.visitor.VisitorUtils.deriveType;
import static io.ballerina.xsdtorecordconverter.visitor.VisitorUtils.generateDefaultValue;
import static io.ballerina.xsdtorecordconverter.visitor.VisitorUtils.handleDefaultValues;
import static io.ballerina.xsdtorecordconverter.visitor.VisitorUtils.handleFixedValues;
import static io.ballerina.xsdtorecordconverter.visitor.VisitorUtils.handleMaxOccurrences;
import static io.ballerina.xsdtorecordconverter.visitor.VisitorUtils.handleMinOccurrences;
import static io.ballerina.xsdtorecordconverter.visitor.VisitorUtils.isSimpleType;
import static io.ballerina.xsdtorecordconverter.visitor.VisitorUtils.typeGenerator;

/**
 * This class is responsible for visiting and processing components of an XSD schema.
 */
public class XSDVisitor implements IXSDVisitor {
    public static final String PUBLIC = "public";
    public static final String WHITESPACE = " ";
    public static final String CONTENT_FIELD = "\\#content";
    public static final String SEMICOLON = ";";
    public static final String RECORD = "record";
    public static final String TYPE = "type";
    public static final String NAME = "name";
    public static final String DEFAULT = "default";
    public static final String FIXED = "fixed";
    public static final String NEW_LINE = "\n";
    public static final String QUOTATION_MARK = "\"";
    public static final String OPEN_BRACES = "{";
    public static final String CLOSE_BRACES = "}";
    public static final String IMPORT = "import";
    public static final String ELEMENT = "element";
    public static final String COMPLEX_TYPE = "complexType";
    public static final String SIMPLE_TYPE = "simpleType";
    public static final String SEQUENCE = "sequence";
    public static final String CHOICE = "choice";
    public static final String ATTRIBUTE = "attribute";
    public static final String COMPLEX_CONTENT = "complexContent";
    public static final String SIMPLE_CONTENT = "simpleContent";
    public static final String EXTENSION = "extension";
    public static final String ENUMERATION = "enumeration";
    public static final String ENUM = "enum";
    public static final String BASE = "base";
    public static final String QUESTION_MARK = "?";
    public static final String REQUIRED = "required";
    public static final String USE = "use";
    public static final String VALUE = "value";
    public static final String COMMA = ",";
    public static final String COLON = ":";
    public static final String STRING = "string";
    public static final String INT = "int";
    public static final String BALLERINA_XML_DATA_MODULE = "ballerina/data.xmldata";
    public static final String ATTRIBUTE_ANNOTATION = "@xmldata:Attribute";
    public static final String MEMBER_TYPES = "memberTypes";
    public static final String UNION = "union";
    public static final String VERTICAL_BAR = "|";
    public static final String EMPTY_STRING = "";
    public static final String RECORD_WITH_OPEN_BRACE = "record {";

    private final ArrayList<String> imports = new ArrayList<>();
    private final LinkedHashMap<String, String> extensions = new LinkedHashMap<>();
    private LinkedHashMap<String, String> rootElements = new LinkedHashMap<>();
    private final LinkedHashMap<String, String> nestedElements = new LinkedHashMap<>();

    @Override
    public String visit(Element element) {
        Node node = element.getNode();
        StringBuilder builder = new StringBuilder();
        builder.append(addNamespace(this, node));
        builder.append(PUBLIC).append(WHITESPACE).append(TYPE).append(WHITESPACE);
        if (!node.hasChildNodes()) {
            return handleSingleElementNode(node, builder);
        }
        return handleElementsWithChildNodes(node, builder);
    }

    @Override
    public String visit(Element element, boolean subElement) {
        Node node = element.getNode();
        StringBuilder builder = new StringBuilder();
        Node nameNode = node.getAttributes().getNamedItem(NAME);
        Node typeNode = node.getAttributes().getNamedItem(TYPE);
        typeNode = visitNestedElements(node, nameNode, typeNode);
        handleFixedValues(node, builder, typeNode);
        handleMaxOccurrences(node, builder);
        builder.append(nameNode.getNodeValue());
        handleMinOccurrences(element, builder);
        handleDefaultValues(node, builder, typeNode);
        builder.append(SEMICOLON);
        return builder.toString();
    }

    private Node visitNestedElements(Node node, Node nameNode, Node typeNode) {
        if (typeNode == null && node.hasChildNodes()) {
            typeNode = nameNode;
            for (Node childNode : asIterable(node.getChildNodes())) {
                IComponent component = XSDFactory.generateComponents(childNode);
                if (component == null) {
                    continue;
                }
                component.setNestedElement(true);
                nestedElements.put(nameNode.getNodeValue(), component.accept(this));
            }
        }
        return typeNode;
    }

    private String handleElementsWithChildNodes(Node node, StringBuilder builder) {
        Node nameNode = node.getAttributes().getNamedItem(NAME);
        Node typeNode = node.getAttributes().getNamedItem(TYPE);
        if (typeNode != null && typeNode.getNodeValue().equals(nameNode.getNodeValue())) {
            builder.append(resolveNameConflicts(nameNode.getNodeValue(), typeNode.getNodeValue())).append(WHITESPACE);
        } else if (typeNode == null) {
            builder.append(nameNode.getNodeValue()).append(WHITESPACE);
        }
        if (typeNode != null) {
            builder.append(deriveType(typeNode)).append(SEMICOLON).append(NEW_LINE);
        }
        for (Node child : asIterable(node.getChildNodes())) {
            IComponent component = XSDFactory.generateComponents(child);
            if (component != null) {
                component.setSubType(true);
                builder.append(component.accept(this));
            }
        }
        return builder.toString();
    }

    private static String resolveNameConflicts(String name, String typeName) {
        StringBuilder resolvedName = new StringBuilder(name);
        int counter = 1;
        while (resolvedName.toString().equals(typeName)) {
            resolvedName.append(counter);
            counter++;
        }
        return resolvedName.toString();
    }

    public static String generateFixedValue(String type, String value) {
        StringBuilder builder = new StringBuilder();
        switch (type) {
            case INT -> builder.append(value).append(WHITESPACE);
            case STRING -> builder.append(QUOTATION_MARK).append(value).append(QUOTATION_MARK).append(WHITESPACE);
        }
        return builder.toString();
    }

    @Override
    public String visit(ComplexType element) {
        Node node = element.getNode();
        StringBuilder builder = new StringBuilder();
        builder.append(addNamespace(this, node));
        builder.append(PUBLIC).append(WHITESPACE).append(TYPE).append(WHITESPACE);
        setTypeDefinition(element, node, builder);
        processChildNodes(node, builder);
        builder.append(CLOSE_BRACES).append(SEMICOLON);
        return builder.toString();
    }

    private void setTypeDefinition(ComplexType element, Node node, StringBuilder builder) {
        Node nameNode = node.getAttributes().getNamedItem(NAME);
        if (nameNode != null) {
            builder.append(nameNode.getNodeValue());
        } else if (element.isNestedElement()) {
            builder.append(getParentNodeName(element));
        }
        builder.append(WHITESPACE).append(RECORD).append(WHITESPACE).append(OPEN_BRACES);
    }

    private String getParentNodeName(ComplexType element) {
        Node parentNode = element.getNode().getParentNode();
        Node nameNode = parentNode.getAttributes().getNamedItem(NAME);
        return nameNode != null ? nameNode.getNodeValue() : EMPTY_STRING;
    }

    private void processChildNodes(Node node, StringBuilder builder) {
        NodeList childNodes = node.getChildNodes();
        for (Node childNode : asIterable(childNodes)) {
            if (childNode.getNodeType() != Node.ELEMENT_NODE) {
                continue;
            }
            processChildNodeByType(childNode, builder);
        }
    }

    private void processChildNodeByType(Node childNode, StringBuilder builder) {
        String localName = childNode.getLocalName();
        switch (localName) {
            case SEQUENCE -> builder.append(visitSequence(childNode, false));
            case CHOICE -> builder.append(visitChoice(childNode));
            case ATTRIBUTE -> builder.append(visitAttribute(childNode));
            case COMPLEX_CONTENT, SIMPLE_CONTENT -> builder.append(visitComplexContent(childNode));
        }
    }

    @Override
    public String visit(ComplexType element, boolean isSubType) {
        Node node = element.getNode();
        StringBuilder builder = new StringBuilder();
        builder.append(RECORD).append(WHITESPACE).append(OPEN_BRACES).append(WHITESPACE);
        NodeList childNodes = node.getChildNodes();
        for (Node childNode : asIterable(childNodes)) {
            if (childNode.getNodeType() != Node.ELEMENT_NODE) {
                continue;
            }
            switch (childNode.getLocalName()) {
                case SEQUENCE -> builder.append(visitSequence(childNode, false));
                case CHOICE -> builder.append(visitChoice(childNode));
                case ATTRIBUTE -> builder.append(visitAttribute(childNode));
                case COMPLEX_CONTENT, SIMPLE_CONTENT -> builder.append(visitComplexContent(childNode));
            }
        }
        builder.append(CLOSE_BRACES).append(SEMICOLON);
        return builder.toString();
    }

    public String visitComplexContent(Node node) {
        StringBuilder builder = new StringBuilder();
        NodeList childNodes = node.getChildNodes();
        for (Node childNode : asIterable(childNodes)) {
            if (childNode.getNodeType() == Node.ELEMENT_NODE && EXTENSION.equals(childNode.getLocalName())) {
                String base = childNode.getAttributes().getNamedItem(BASE).getNodeValue();
                builder.append(visitExtension(childNode));
                String parentNodeName = node.getParentNode().getAttributes().getNamedItem(NAME).getNodeValue();
                extensions.put(parentNodeName, base);
            }
        }
        return builder.toString();
    }

    public String visitExtension(Node node) {
        StringBuilder builder = new StringBuilder();
        NodeList childNodes = node.getChildNodes();
        for (Node childNode : asIterable(childNodes)) {
            addNamespace(this, childNode);
            if (childNode.getNodeType() == Node.ELEMENT_NODE) {
                builder.append(visitAttribute(childNode));
            }
        }
        return builder.toString();
    }

    public String visitChoice(Node node) {
        StringBuilder builder = new StringBuilder();
        NodeList childNodes = node.getChildNodes();
        for (Node childNode : asIterable(childNodes)) {
            if (childNode.getNodeType() != Node.ELEMENT_NODE) {
                continue;
            }
            if (childNode.getLocalName().equals(SEQUENCE)) {
                builder.append(visitSequence(childNode, true));
            } else { // TODO: check child node have other types except sequence and none
                builder.append(addNamespace(this, childNode));
                Node nameNode = childNode.getAttributes().getNamedItem(NAME);
                Node typeNode = childNode.getAttributes().getNamedItem(TYPE);
                builder.append(deriveType(typeNode)).append(WHITESPACE);
                builder.append(nameNode.getNodeValue()).append(QUESTION_MARK).append(SEMICOLON);
            }
        }
        return builder.toString();
    }

    public String visitAttribute(Node attribute) {
        StringBuilder builder = new StringBuilder();
        this.addImports(BALLERINA_XML_DATA_MODULE);
        Node nameNode = attribute.getAttributes().getNamedItem(NAME);
        Node typeNode = attribute.getAttributes().getNamedItem(TYPE);
        builder.append(ATTRIBUTE_ANNOTATION).append(WHITESPACE);
        Node fixedNode = attribute.getAttributes().getNamedItem(FIXED);
        handleFixedValues(builder, typeNode, fixedNode);
        builder.append(nameNode.getNodeValue());
        Node attributeType = attribute.getAttributes().getNamedItem(USE);
        if (attributeType != null && !attributeType.getNodeValue().equals(REQUIRED)) {
            builder.append(QUESTION_MARK);
        }
        Node defaultNode = attribute.getAttributes().getNamedItem(DEFAULT);
        if (defaultNode != null) {
            builder.append(generateDefaultValue(deriveType(typeNode), defaultNode.getNodeValue()));
        }
        builder.append(SEMICOLON);
        return builder.toString();
    }

    public String visitSequence(Node node, boolean isOptional) {
        StringBuilder builder = new StringBuilder();
        NodeList childNodes = node.getChildNodes();
        for (Node childNode : asIterable(childNodes)) {
            IComponent component = XSDFactory.generateComponents(childNode);
            if (component == null) {
                continue;
            }
            component.setSubType(true);
            component.setOptional(isOptional);
            builder.append(addNamespace(this, childNode));
            builder.append(component.accept(this));
        }
        return builder.toString();
    }

    @Override
    public String visit(SimpleType element) {
        StringBuilder builder = new StringBuilder();
        Node nameNode = element.getNode().getAttributes().getNamedItem(NAME);
        for (Node simpleTypeNode : asIterable(element.getNode().getChildNodes())) {
            if (simpleTypeNode.getNodeType() != Node.ELEMENT_NODE) {
                continue;
            }
            StringBuilder stringBuilder = new StringBuilder();
            builder.append(addNamespace(this, element.getNode()));
            boolean enumeration = hasEnumerations(simpleTypeNode, stringBuilder);
            if (enumeration) {
                processEnumerations(builder, nameNode, stringBuilder);
            } else if (UNION.equals(simpleTypeNode.getLocalName())) {
                processUnionOfSimpleTypes(builder, simpleTypeNode);
            } else {
                processSimpleType(builder, nameNode, simpleTypeNode);
            }
        }
        return builder.toString();
    }

    private static void processSimpleType(StringBuilder builder, Node nameNode, Node simpleTypeNode) {
        builder.append(PUBLIC).append(WHITESPACE).append(TYPE).append(WHITESPACE);
        builder.append(nameNode.getNodeValue()).append(WHITESPACE);
        Node typeNode = simpleTypeNode.getAttributes().getNamedItem(BASE);
        builder.append(deriveType(typeNode)).append(WHITESPACE).append(SEMICOLON);
    }

    private static void processUnionOfSimpleTypes(StringBuilder builder, Node simpleTypeNode) {
        builder.append(PUBLIC).append(WHITESPACE).append(TYPE).append(WHITESPACE);
        builder.append(simpleTypeNode.getParentNode().getAttributes().getNamedItem(NAME).getNodeValue());
        builder.append(WHITESPACE);
        String unionTypes = simpleTypeNode.getAttributes().getNamedItem(MEMBER_TYPES).getNodeValue();
        String[] typesArray = unionTypes.split(WHITESPACE);
        for (String type: typesArray) {
            builder.append(type.substring(type.indexOf(COLON) + 1)).append(VERTICAL_BAR);
        }
        builder.delete(builder.length() - 1, builder.length()).append(SEMICOLON);
    }

    private static void processEnumerations(StringBuilder builder, Node nameNode, StringBuilder stringBuilder) {
        builder.append(PUBLIC).append(WHITESPACE).append(ENUM).append(WHITESPACE);
        builder.append(nameNode.getNodeValue()).append(WHITESPACE).append(OPEN_BRACES);
        builder.append(stringBuilder.substring(0, stringBuilder.length() - 1));
        builder.append(CLOSE_BRACES).append(SEMICOLON);
    }

    private static boolean hasEnumerations(Node simpleTypeNode, StringBuilder stringBuilder) {
        boolean enumeration = false;
        if (simpleTypeNode.hasChildNodes()) {
            NodeList nodes = simpleTypeNode.getChildNodes();
            for (Node node : asIterable(nodes)) {
                if (node.getNodeType() == Node.ELEMENT_NODE && ENUMERATION.equals(node.getLocalName())) {
                    enumeration = true;
                    stringBuilder.append(node.getAttributes().getNamedItem(VALUE).getNodeValue()).append(COMMA);
                }
            }
        }
        return enumeration;
    }

    private String handleSingleElementNode(Node element, StringBuilder builder) {
        Node nameNode = element.getAttributes().getNamedItem(NAME);
        if (nameNode == null) {
            return null;
        }
        String elementName = nameNode.getNodeValue();
        Node typeNode = element.getAttributes().getNamedItem(TYPE);
        if (typeNode == null) {
            builder.append(SyntaxKind.ANYDATA_KEYWORD.stringValue());
        } else {
            handleTypedElement(elementName, typeNode, builder);
        }
        builder.append(SEMICOLON);
        return builder.toString();
    }

    private void handleTypedElement(String elementName, Node typeNode, StringBuilder builder) {
        String typeName = deriveType(typeNode);
        elementName = appendElementNameWithSuffix(elementName, typeName, builder);
        if (!isSimpleType(typeName)) {
            rootElements.put(elementName, typeName);
        }
        appendRecordStructure(typeName, builder);
    }

    private String appendElementNameWithSuffix(String elementName, String typeName, StringBuilder builder) {
        if (typeName.equals(elementName)) {
            elementName = resolveNameConflicts(elementName, typeName);
        }
        builder.append(elementName).append(WHITESPACE);
        return elementName;
    }

    private void appendRecordStructure(String typeName, StringBuilder builder) {
        builder.append(WHITESPACE).append(RECORD).append(WHITESPACE).append(OPEN_BRACES).append(WHITESPACE)
                .append(typeGenerator(typeName)).append(WHITESPACE).append(CONTENT_FIELD)
                .append(SEMICOLON).append(WHITESPACE).append(CLOSE_BRACES);
    }

    public void addImports(String module) {
        String importDeclaration = IMPORT + WHITESPACE + module + SEMICOLON;
        if (!imports.contains(importDeclaration)) {
            this.imports.add(importDeclaration);
        }
    }

    public ArrayList<String> getImports() {
        return imports;
    }

    public LinkedHashMap<String, String> getExtensions() {
        return extensions;
    }

    public LinkedHashMap<String, String> getRootElements() {
        return rootElements;
    }

    public void setRootElements(LinkedHashMap<String, String> rootElements) {
        this.rootElements = rootElements;
    }

    public LinkedHashMap<String, String> getNestedElements() {
        return nestedElements;
    }
}
