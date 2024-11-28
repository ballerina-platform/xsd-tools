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

import io.ballerina.compiler.syntax.tree.SyntaxKind;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import java.util.ArrayList;
import java.util.LinkedHashMap;

public class XSDVisitor implements IXSDVisitor {
    public static final String PUBLIC = "public";
    public static final String WHITESPACE = " ";
    public static final String CONTENT_FIELD = "\\#content";
    public static final String EQUAL = "=";
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
    public static final String OPEN_SQUARE_BRACKET = "[";
    public static final String CLOSE_SQUARE_BRACKET = "]";
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
    public static final String ZERO = "0";
    public static final String ONE = "1";
    public static final String QUESTION_MARK = "?";
    public static final String MAX_OCCURS = "maxOccurs";
    public static final String MIN_OCCURS = "minOccurs";
    public static final String UNBOUNDED = "unbounded";
    public static final String REQUIRED = "required";
    public static final String USE = "use";
    public static final String VALUE = "value";
    public static final String COMMA = ",";
    public static final String COLON = ":";
    public static final String TIME = "time";
    public static final String DATE_TIME = "dateTime";
    public static final String DATE = "date";
    public static final String G_YEAR_MONTH = "gYearMonth";
    public static final String G_YEAR = "gYear";
    public static final String STRING = "string";
    public static final String INTEGER = "integer";
    public static final String LONG = "long";
    public static final String NEGATIVE_INTEGER = "negativeInteger";
    public static final String NON_POSITIVE_INTEGER = "nonPositiveInteger";
    public static final String POSITIVE_INTEGER = "positiveInteger";
    public static final String SHORT = "short";
    public static final String UNSIGNED_LONG = "unsignedLong";
    public static final String UNSIGNED_INT = "unsignedInt";
    public static final String UNSIGNED_SHORT = "unsignedShort";
    public static final String UNSIGNED_BYTE = "unsignedByte";
    public static final String INT = "int";
    public static final String BASE64_BINARY = "base64Binary";
    public static final String BYTE_ARRAY = "byte[]";
    public static final String BALLERINA_XML_DATA_MODULE = "ballerina/data.xmldata";
    public static final String ATTRIBUTE_ANNOTATION = "@xmldata:Attribute";
    public static final String XMLDATA_NAMESPACE = "@xmldata:Namespace";
    public static final String TYPE_NAME_SUFFIX = "123";
    public static final String PREFIX = "prefix";
    public static final String URI = "uri";
    private final ArrayList<String> imports = new ArrayList<>();
    private final LinkedHashMap<String, String> extensions = new LinkedHashMap<>();

    @Override
    public String visit(Element element) {
        Node node = element.getNode();
        StringBuilder builder = new StringBuilder();
        builder.append(addNamespace(node));
        builder.append(PUBLIC).append(WHITESPACE).append(TYPE).append(WHITESPACE);
        if (!node.hasChildNodes()) {
            return handleSingleElementNode(node, builder);
        }
        return handleElementsWithChildNodes(node, builder);
    }

    public String addNamespace(Node node) {
        this.addImports(BALLERINA_XML_DATA_MODULE);
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(XMLDATA_NAMESPACE).append(WHITESPACE).append(OPEN_BRACES);
        stringBuilder.append(PREFIX).append(COLON).append(QUOTATION_MARK);
        stringBuilder.append(node.getPrefix()).append(QUOTATION_MARK).append(COMMA);
        stringBuilder.append(URI).append(COLON).append(QUOTATION_MARK);
        stringBuilder.append(node.getNamespaceURI()).append(QUOTATION_MARK).append(CLOSE_BRACES);
        return stringBuilder.toString();
    }

    @Override
    public String visit(Element element, boolean subElement) {
        Node node = element.getNode();
        StringBuilder builder = new StringBuilder();
        Node nameNode = node.getAttributes().getNamedItem(NAME);
        Node typeNode = node.getAttributes().getNamedItem(TYPE);
        handleFixedValues(node, builder, typeNode);
        handleMaxOccurrences(node, builder);
        builder.append(nameNode.getNodeValue());
        handleMinOccurrences(node, builder);
        handleDefaultValues(node, builder, typeNode);
        builder.append(SEMICOLON);
        return builder.toString();
    }

    private void handleFixedValues(Node node, StringBuilder builder, Node typeNode) {
        Node fixedNode = node.getAttributes().getNamedItem(FIXED);
        if (fixedNode != null) {
            builder.append(generateFixedValue(deriveType(typeNode), fixedNode.getNodeValue())).append(WHITESPACE);
        } else {
            builder.append(deriveType(typeNode)).append(WHITESPACE);
        }
    }

    private void handleDefaultValues(Node node, StringBuilder builder, Node typeNode) {
        Node defaultNode = node.getAttributes().getNamedItem(DEFAULT);
        if (defaultNode != null) {
            builder.append(generateDefaultValue(deriveType(typeNode), defaultNode.getNodeValue()));
        }
    }

    private static void handleMinOccurrences(Node node, StringBuilder builder) {
        Node minOccurrence = node.getAttributes().getNamedItem(MIN_OCCURS);
        if (minOccurrence != null) {
            if (minOccurrence.getNodeValue().equals(ZERO)) {
                builder.append(QUESTION_MARK);
            }
        }
    }

    private static void handleMaxOccurrences(Node node, StringBuilder builder) {
        Node maxOccurrence = node.getAttributes().getNamedItem(MAX_OCCURS);
        if (maxOccurrence != null) {
            if (maxOccurrence.getNodeValue().equals(UNBOUNDED)) {
                builder.append(OPEN_SQUARE_BRACKET).append(CLOSE_SQUARE_BRACKET).append(WHITESPACE);
            } else if (!maxOccurrence.getNodeValue().equals(ONE)) {
                builder.append(OPEN_SQUARE_BRACKET).append(maxOccurrence.getNodeValue())
                        .append(CLOSE_SQUARE_BRACKET).append(WHITESPACE);
            }
        }
    }

    private void handleFixedValues(StringBuilder builder, Node typeNode, Node fixedNode) {
        if (fixedNode != null) {
            builder.append(generateFixedValue(deriveType(typeNode), fixedNode.getNodeValue())).append(WHITESPACE);
        } else {
            builder.append(deriveType(typeNode)).append(WHITESPACE);
        }
    }

    private static void handleMaxOccurrences(StringBuilder builder, Node maxOccurrence) {

    }

    private String handleElementsWithChildNodes(Node node, StringBuilder builder) {
        Node nameNode = node.getAttributes().getNamedItem(NAME);
        Node typeNode = node.getAttributes().getNamedItem(TYPE);
        if (typeNode != null && typeNode.getNodeValue().equals(nameNode.getNodeValue())) {
            builder.append(nameNode.getNodeValue()).append(TYPE_NAME_SUFFIX).append(WHITESPACE);
        } else if (typeNode == null) {
            builder.append(nameNode.getNodeValue()).append(WHITESPACE);
        }
        if (typeNode != null) {
            builder.append(deriveType(typeNode)).append(SEMICOLON).append(NEW_LINE);
        }
        for (int i = 0; i < node.getChildNodes().getLength(); i++) {
            IComponent component = XSDFactory.generateComponents(node.getChildNodes().item(i));
            if (component != null) {
                component.setSubType(true);
                builder.append(component.accept(this));
            }
        }
        return builder.toString();
    }

    public String generateFixedValue(String type, String value) {
        StringBuilder builder = new StringBuilder();
        switch (type) {
            case INT -> builder.append(value).append(WHITESPACE);
            case STRING -> builder.append(QUOTATION_MARK).append(value).append(QUOTATION_MARK).append(WHITESPACE);
        }
        return builder.toString();
    }

    public String generateDefaultValue(String type, String value) {
        StringBuilder builder = new StringBuilder().append(WHITESPACE).append(EQUAL).append(WHITESPACE);
        switch (type) {
            case INT -> builder.append(value);
            case STRING -> builder.append(QUOTATION_MARK).append(value).append(QUOTATION_MARK);
        }
        return builder.toString();
    }

    @Override
    public String visit(ComplexType element) {
        Node node = element.getNode();
        StringBuilder builder = new StringBuilder();
        builder.append(addNamespace(node));
        builder.append(PUBLIC).append(WHITESPACE).append(TYPE).append(WHITESPACE);
        Node nameNode = node.getAttributes().getNamedItem(NAME);
        if (nameNode != null) {
            builder.append(nameNode.getNodeValue()).append(WHITESPACE);
            builder.append(RECORD).append(WHITESPACE);
            builder.append(OPEN_BRACES);
        }
        for (int i = 0; i < node.getChildNodes().getLength(); i++) {
            if (node.getChildNodes().item(i).getNodeType() == Node.ELEMENT_NODE) {
                Node compositor = node.getChildNodes().item(i);
                switch (compositor.getLocalName()) {
                    case SEQUENCE -> builder.append(visitSequence(compositor));
                    case CHOICE -> builder.append(visitChoice(compositor));
                    case ATTRIBUTE -> builder.append(visitAttribute(compositor));
                    case COMPLEX_CONTENT, SIMPLE_CONTENT -> builder.append(visitComplexContent(compositor));
                }
            }
        }
        builder.append(CLOSE_BRACES).append(SEMICOLON);
        return builder.toString();
    }

    @Override
    public String visit(ComplexType element, boolean isSubType) {
        Node node = element.getNode();
        StringBuilder builder = new StringBuilder();
        builder.append(RECORD).append(WHITESPACE).append(OPEN_BRACES).append(WHITESPACE);
        for (int i = 0; i < node.getChildNodes().getLength(); i++) {
            if (node.getChildNodes().item(i).getNodeType() == Node.ELEMENT_NODE) {
                Node compositor = node.getChildNodes().item(i);
                switch (compositor.getLocalName()) {
                    case SEQUENCE -> builder.append(visitSequence(compositor));
                    case CHOICE -> builder.append(visitChoice(compositor));
                    case ATTRIBUTE -> builder.append(visitAttribute(compositor));
                    case COMPLEX_CONTENT, SIMPLE_CONTENT -> builder.append(visitComplexContent(compositor));
                }
            }
        }
        builder.append(CLOSE_BRACES).append(SEMICOLON);
        return builder.toString();
    }

    public String visitComplexContent(Node node) {
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < node.getChildNodes().getLength(); i++) {
            Node element = node.getChildNodes().item(i);
            if (element.getNodeType() == Node.ELEMENT_NODE && element.getLocalName().equals(EXTENSION)) {
                builder.append(addNamespace(element));
                String base = element.getAttributes().getNamedItem(BASE).getNodeValue();
                builder.append(base).append(WHITESPACE).append(base).append(SEMICOLON);
                builder.append(visitExtension(element));
            }
        }
        return builder.toString();
    }

    public String visitExtension(Node node) {
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < node.getChildNodes().getLength(); i++) {
            Node element = node.getChildNodes().item(i);
            addNamespace(element);
            if (element.getNodeType() == Node.ELEMENT_NODE) {builder.append(visitAttribute(element));
            }
        }
        return builder.toString();
    }

    public String visitChoice(Node node) {
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < node.getChildNodes().getLength(); i++) {
            Node element = node.getChildNodes().item(i);
            if (element.getNodeType() == Node.ELEMENT_NODE) {
                if (element.getLocalName().equals(SEQUENCE)) {
                    builder.append(visitSequence(element));
                } else {
                    builder.append(addNamespace(element));
                    Node nameNode = element.getAttributes().getNamedItem(NAME);
                    Node typeNode = element.getAttributes().getNamedItem(TYPE);
                    builder.append(deriveType(typeNode)).append(WHITESPACE);
                    builder.append(nameNode.getNodeValue()).append(QUESTION_MARK).append(SEMICOLON);
                }
            }
        }
        return builder.toString();
    }

    public String visitAttribute(Node attribute) {
        StringBuilder builder = new StringBuilder();
        this.addImports(BALLERINA_XML_DATA_MODULE);
        builder.append(ATTRIBUTE_ANNOTATION).append(WHITESPACE);
        Node nameNode = attribute.getAttributes().getNamedItem(NAME);
        Node typeNode = attribute.getAttributes().getNamedItem(TYPE);
        Node defaultNode = attribute.getAttributes().getNamedItem(DEFAULT);
        Node fixedNode = attribute.getAttributes().getNamedItem(FIXED);
        handleFixedValues(builder, typeNode, fixedNode);
        builder.append(nameNode.getNodeValue());
        Node attributeType = attribute.getAttributes().getNamedItem(USE);
        if (attributeType != null && !attributeType.getNodeValue().equals(REQUIRED)) {
            builder.append(QUESTION_MARK);
        }
        if (defaultNode != null) {
            builder.append(generateDefaultValue(deriveType(typeNode), defaultNode.getNodeValue()));
        }
        builder.append(SEMICOLON);
        return builder.toString();
    }

    public String visitSequence(Node node) {
        StringBuilder builder = new StringBuilder();
        for (int j = 0; j < node.getChildNodes().getLength(); j++) {
            IComponent component = XSDFactory.generateComponents(node.getChildNodes().item(j));
            if (component != null) {
                component.setSubType(true);
                builder.append(addNamespace(node.getChildNodes().item(j)));
                builder.append(component.accept(this));
            }
        }
        return builder.toString();
    }

    @Override
    public String visit(SimpleType element) {
        StringBuilder builder = new StringBuilder();
        Node nameNode = element.getNode().getAttributes().getNamedItem(NAME);
        for (int i = 0; i < element.getNode().getChildNodes().getLength(); i++) {
            Node simpleTypeNode = element.getNode().getChildNodes().item(i);
            StringBuilder stringBuilder = new StringBuilder();
            if (simpleTypeNode.getNodeType() == Node.ELEMENT_NODE) {
                builder.append(addNamespace(element.getNode()));
                boolean enumeration = hasEnumerations(simpleTypeNode, stringBuilder);
                if (enumeration) {
                    builder.append(PUBLIC).append(WHITESPACE).append(ENUM).append(WHITESPACE);
                    builder.append(nameNode.getNodeValue()).append(WHITESPACE).append(OPEN_BRACES);
                    builder.append(stringBuilder.substring(0, stringBuilder.length() - 1));
                    builder.append(CLOSE_BRACES).append(SEMICOLON);
                } else {
                    builder.append(PUBLIC).append(WHITESPACE).append(TYPE).append(WHITESPACE);
                    builder.append(nameNode.getNodeValue()).append(WHITESPACE);
                    builder.append(WHITESPACE).append(RECORD).append(WHITESPACE).append(OPEN_BRACES);
                    Node typeNode = simpleTypeNode.getAttributes().getNamedItem(BASE);
                    builder.append(deriveType(typeNode)).append(WHITESPACE).append(CONTENT_FIELD).append(SEMICOLON);
                    builder.append(CLOSE_BRACES).append(SEMICOLON);
                }
            }
        }
        return builder.toString();
    }

    private static boolean hasEnumerations(Node simpleTypeNode, StringBuilder stringBuilder) {
        boolean enumeration = false;
        if (simpleTypeNode.hasChildNodes()) {
            NodeList nodes = simpleTypeNode.getChildNodes();
            for (int i = 0; i < nodes.getLength(); i++) {
                Node node = nodes.item(i);
                if (node.getNodeType() == Node.ELEMENT_NODE && node.getLocalName().equals(ENUMERATION)) {
                    enumeration = true;
                    stringBuilder.append(node.getAttributes().getNamedItem(VALUE).getNodeValue()).append(COMMA);
                }
            }
        }
        return enumeration;
    }

    private String handleSingleElementNode(Node element, StringBuilder builder) {
        Node nameNode = element.getAttributes().getNamedItem(NAME);
        if (nameNode != null) {
            Node typeNode = element.getAttributes().getNamedItem(TYPE);
            if (typeNode != null) {
                String typeName = deriveType(typeNode);
                if (typeName.equals(nameNode.getNodeValue())) {
                    builder.append(nameNode.getNodeValue()).append(TYPE_NAME_SUFFIX).append(WHITESPACE);
                } else {
                    builder.append(nameNode.getNodeValue()).append(WHITESPACE);
                }
                builder.append(WHITESPACE).append(RECORD).append(OPEN_BRACES);
                builder.append(typeGenerator(typeName)).append(WHITESPACE).append(CONTENT_FIELD).append(SEMICOLON);
                builder.append(CLOSE_BRACES);
            } else {
                builder.append(SyntaxKind.ANYDATA_KEYWORD.stringValue());
            }
            builder.append(SEMICOLON);
            return builder.toString();
        }
        return null;
    }

    public String deriveType(Node node) {
        String derivedType = node.getNodeValue().contains(COLON) ?
                node.getNodeValue().substring(node.getNodeValue().indexOf(COLON) + 1) : node.getNodeValue();
        return typeGenerator(derivedType);
    }

    public ArrayList<String> getImports() {
        return imports;
    }

    public void addImports(String module) {
        String importDeclaration = IMPORT + WHITESPACE + module + SEMICOLON;
        if (!imports.contains(importDeclaration)) {
            this.imports.add(importDeclaration);
        }
    }

    public LinkedHashMap<String, String> getExtensions() {
        return extensions;
    }

    public static String typeGenerator(String typeName) {
        switch (typeName) {
            case TIME, DATE_TIME, DATE, G_YEAR_MONTH, G_YEAR, STRING -> {
                return STRING;
            }
            case INTEGER, LONG, NEGATIVE_INTEGER, NON_POSITIVE_INTEGER, POSITIVE_INTEGER, SHORT,
                    UNSIGNED_LONG, UNSIGNED_INT, UNSIGNED_SHORT, UNSIGNED_BYTE, INT -> {
                return INT;
            }
            case BASE64_BINARY -> {
                return BYTE_ARRAY;
            }
            default -> {
                return typeName;
            }
        }
    }
}
