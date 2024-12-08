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

import io.ballerina.compiler.syntax.tree.SyntaxKind;
import io.ballerina.xsdtorecordconverter.XSDToRecord;
import io.ballerina.xsdtorecordconverter.component.ComplexType;
import io.ballerina.xsdtorecordconverter.component.Element;
import io.ballerina.xsdtorecordconverter.component.XSDComponent;
import io.ballerina.xsdtorecordconverter.component.SimpleType;
import io.ballerina.xsdtorecordconverter.XSDFactory;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Locale;

import static io.ballerina.xsdtorecordconverter.visitor.VisitorUtils.MAX_OCCURS;
import static io.ballerina.xsdtorecordconverter.visitor.VisitorUtils.MIN_OCCURS;
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
public class XSDVisitorImpl implements XSDVisitor {
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
    public static final String RECORD_WITH_OPEN_BRACE = "record {|";
    public static final String REQUIRED_FIELD_NOT_FOUND_ERROR = "Required field is not found in <complexType>: '%s'";
    public static final String ONE = "1";
    public static final String XMLDATA_CHOICE = "@xmldata:Choice";
    public static final String CHOICE_TYPE_NAME = "Choice";
    public static final String EMPTY_ARRAY = "[]";
    public static final String XMLDATA_SEQUENCE = "@xmldata:Sequence";
    public static final String SEQUENCE_NAME = "Seq";

    private final ArrayList<String> imports = new ArrayList<>();
    private final LinkedHashMap<String, String> extensions = new LinkedHashMap<>();
    private final LinkedHashMap<String, String> rootElements = new LinkedHashMap<>();
    private final LinkedHashMap<String, String> nestedElements = new LinkedHashMap<>();

    @Override
    public String visit(Element element) throws Exception {
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
    public String visit(Element element, boolean subElement) throws Exception {
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

    private Node visitNestedElements(Node node, Node nameNode, Node typeNode) throws Exception {
        if (typeNode == null && node.hasChildNodes()) {
            typeNode = nameNode;
            for (Node childNode : asIterable(node.getChildNodes())) {
                XSDComponent component = XSDFactory.generateComponents(childNode);
                if (component == null) {
                    continue;
                }
                component.setNestedElement(true);
                nestedElements.put(nameNode.getNodeValue(), component.accept(this));
            }
        }
        return typeNode;
    }

    private String handleElementsWithChildNodes(Node node, StringBuilder builder) throws Exception {
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
            XSDComponent component = XSDFactory.generateComponents(child);
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
    public String visit(ComplexType element) throws Exception {
        Node node = element.getNode();
        StringBuilder builder = new StringBuilder();
        builder.append(addNamespace(this, node));
        builder.append(PUBLIC).append(WHITESPACE).append(TYPE).append(WHITESPACE);
        setTypeDefinition(element, node, builder);
        processChildNodes(node, builder);
        builder.append(VERTICAL_BAR).append(CLOSE_BRACES).append(SEMICOLON);
        return builder.toString();
    }

    private void setTypeDefinition(ComplexType element, Node node, StringBuilder builder) throws Exception {
        Node nameNode = node.getAttributes().getNamedItem(NAME);
        if (nameNode != null) {
            builder.append(nameNode.getNodeValue());
        } else if (element.isNestedElement()) {
            builder.append(getParentNodeName(element));
        } else {
            throw new Exception(String.format(REQUIRED_FIELD_NOT_FOUND_ERROR, NAME));
        }
        builder.append(WHITESPACE).append(RECORD).append(WHITESPACE).append(OPEN_BRACES).append(VERTICAL_BAR);
    }

    private String getParentNodeName(ComplexType element) {
        Node parentNode = element.getNode().getParentNode();
        Node nameNode = parentNode.getAttributes().getNamedItem(NAME);
        return nameNode != null ? nameNode.getNodeValue() : EMPTY_STRING;
    }

    private void processChildNodes(Node node, StringBuilder builder) throws Exception {
        NodeList childNodes = node.getChildNodes();
        for (Node childNode : asIterable(childNodes)) {
            if (childNode.getNodeType() != Node.ELEMENT_NODE) {
                continue;
            }
            processChildNodeByType(childNode, builder);
        }
    }

    private void processChildNodeByType(Node childNode, StringBuilder builder) throws Exception {
        String localName = childNode.getLocalName();
        switch (localName) {
            case SEQUENCE -> builder.append(visitSequence(childNode, false));
            case CHOICE -> builder.append(visitChoice(childNode));
            case ATTRIBUTE -> builder.append(visitAttribute(childNode));
            case COMPLEX_CONTENT, SIMPLE_CONTENT -> builder.append(visitComplexContent(childNode));
        }
    }

    @Override
    public String visit(ComplexType element, boolean isSubType) throws Exception {
        Node node = element.getNode();
        StringBuilder builder = new StringBuilder();
        builder.append(RECORD).append(WHITESPACE).append(OPEN_BRACES).append(VERTICAL_BAR).append(WHITESPACE);
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
        builder.append(VERTICAL_BAR).append(CLOSE_BRACES).append(SEMICOLON);
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

    public String visitChoice(Node node) throws Exception {
        StringBuilder builder = new StringBuilder();
        NodeList childNodes = node.getChildNodes();
        String choiceName = applyChoiceAnnotation(builder, node);
        String childElements = processChildChoiceNodes(node, childNodes, choiceName).toString();
        nestedElements.put(choiceName, childElements);
        return builder.toString();
    }

    private StringBuilder processChildChoiceNodes(Node node, NodeList childNodes, String choiceName) throws Exception {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(addNamespace(this, node));
        stringBuilder.append(PUBLIC).append(WHITESPACE).append(TYPE).append(WHITESPACE).append(choiceName);
        stringBuilder.append(WHITESPACE).append(RECORD).append(WHITESPACE).append(OPEN_BRACES).append(VERTICAL_BAR);
        for (Node childNode : asIterable(childNodes)) {
            if (childNode.getNodeType() != Node.ELEMENT_NODE) {
                continue;
            }
            if (childNode.getLocalName().equals(SEQUENCE)) {
                stringBuilder.append(visitSequence(childNode, true));
            } else {
                stringBuilder.append(addNamespace(this, childNode));
                Node nameNode = childNode.getAttributes().getNamedItem(NAME);
                Node typeNode = childNode.getAttributes().getNamedItem(TYPE);
                stringBuilder.append(deriveType(typeNode)).append(WHITESPACE);
                stringBuilder.append(nameNode.getNodeValue()).append(QUESTION_MARK).append(SEMICOLON);
            }
        }
        stringBuilder.append(VERTICAL_BAR).append(CLOSE_BRACES).append(SEMICOLON);
        return stringBuilder;
    }

    private String applyChoiceAnnotation(StringBuilder builder, Node node) {
        Node maxOccurrenceNode = node.getAttributes().getNamedItem(MAX_OCCURS);
        Node minOccurrenceNode = node.getAttributes().getNamedItem(MIN_OCCURS);
        String maxOccurrence = (maxOccurrenceNode != null) ? maxOccurrenceNode.getNodeValue() : ONE;
        String minOccurrence = (minOccurrenceNode != null) ? minOccurrenceNode.getNodeValue() : ONE;
        String choiceName = (nestedElements.containsKey(CHOICE_TYPE_NAME))
                ? XSDToRecord.resolveNameConflicts(CHOICE_TYPE_NAME, nestedElements) : CHOICE_TYPE_NAME;
        builder.append(XMLDATA_CHOICE).append(WHITESPACE).append(OPEN_BRACES);
        builder.append(MIN_OCCURS).append(COLON).append(minOccurrence).append(COMMA);
        builder.append(MAX_OCCURS).append(COLON).append(maxOccurrence).append(CLOSE_BRACES);
        builder.append(choiceName).append((maxOccurrence.equals(ONE)) ? EMPTY_STRING : EMPTY_ARRAY);
        builder.append(WHITESPACE).append(choiceName.toLowerCase(Locale.ROOT)).append(SEMICOLON);
        return choiceName;
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

    public String visitSequence(Node node, boolean isOptional) throws Exception {
        StringBuilder builder = new StringBuilder();
        NodeList childNodes = node.getChildNodes();
        String sequenceName = applySequenceAnnotation(node, builder);
        StringBuilder stringBuilder = processChildSequenceNodes(node, isOptional, childNodes, sequenceName);
        nestedElements.put(sequenceName, stringBuilder.toString());
        return builder.toString();
    }

    private StringBuilder processChildSequenceNodes(Node node, boolean isOptional,
                                                    NodeList childNodes, String sequenceName) throws Exception {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(addNamespace(this, node));
        stringBuilder.append(PUBLIC).append(WHITESPACE).append(TYPE).append(WHITESPACE).append(sequenceName);
        stringBuilder.append(WHITESPACE).append(RECORD).append(WHITESPACE).append(OPEN_BRACES).append(VERTICAL_BAR);
        for (Node childNode : asIterable(childNodes)) {
            XSDComponent component = XSDFactory.generateComponents(childNode);
            if (component == null) {
                continue;
            }
            component.setSubType(true);
            component.setOptional(isOptional);
            stringBuilder.append(addNamespace(this, childNode));
            stringBuilder.append(component.accept(this));
        }
        stringBuilder.append(VERTICAL_BAR).append(CLOSE_BRACES).append(SEMICOLON);
        return stringBuilder;
    }

    private String applySequenceAnnotation(Node node, StringBuilder builder) {
        Node maxOccurrenceNode = node.getAttributes().getNamedItem(MAX_OCCURS);
        Node minOccurrenceNode = node.getAttributes().getNamedItem(MIN_OCCURS);
        String maxOccurrence = (maxOccurrenceNode != null) ? maxOccurrenceNode.getNodeValue() : ONE;
        String minOccurrence = (minOccurrenceNode != null) ? minOccurrenceNode.getNodeValue() : ONE;
        String sequenceName = (nestedElements.containsKey(SEQUENCE_NAME))
                ? XSDToRecord.resolveNameConflicts(SEQUENCE_NAME, nestedElements) : SEQUENCE_NAME;
        builder.append(XMLDATA_SEQUENCE).append(WHITESPACE).append(OPEN_BRACES);
        builder.append(MIN_OCCURS).append(COLON).append(minOccurrence).append(COMMA);
        builder.append(MAX_OCCURS).append(COLON).append(maxOccurrence).append(CLOSE_BRACES);
        builder.append(sequenceName).append((maxOccurrence.equals(ONE)) ? "" : EMPTY_ARRAY);
        builder.append(WHITESPACE).append(sequenceName.toLowerCase(Locale.ROOT)).append(SEMICOLON);
        return sequenceName;
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
        builder.append(PUBLIC).append(WHITESPACE).append(ENUM).append(WHITESPACE).append(nameNode.getNodeValue())
                .append(WHITESPACE).append(OPEN_BRACES).append(stringBuilder.substring(0, stringBuilder.length() - 1))
                .append(CLOSE_BRACES).append(SEMICOLON);
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

    private String handleSingleElementNode(Node element, StringBuilder builder) throws Exception {
        Node nameNode = element.getAttributes().getNamedItem(NAME);
        if (nameNode == null) {
            throw new Exception(String.format(REQUIRED_FIELD_NOT_FOUND_ERROR, NAME));
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
        builder.append(WHITESPACE).append(RECORD).append(WHITESPACE).append(OPEN_BRACES).append(VERTICAL_BAR)
                .append(WHITESPACE).append(typeGenerator(typeName)).append(WHITESPACE).append(CONTENT_FIELD)
                .append(SEMICOLON).append(WHITESPACE).append(VERTICAL_BAR).append(CLOSE_BRACES);
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

    public LinkedHashMap<String, String> getNestedElements() {
        return nestedElements;
    }
}
