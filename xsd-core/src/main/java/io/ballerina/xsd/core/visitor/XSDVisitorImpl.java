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

package io.ballerina.xsd.core.visitor;

import io.ballerina.compiler.syntax.tree.SyntaxInfo;
import io.ballerina.compiler.syntax.tree.SyntaxKind;
import io.ballerina.xsd.core.XSDFactory;
import io.ballerina.xsd.core.component.ComplexType;
import io.ballerina.xsd.core.component.Element;
import io.ballerina.xsd.core.component.SimpleType;
import io.ballerina.xsd.core.component.XSDComponent;
import io.ballerina.xsd.core.diagnostic.XSDDiagnostic;
import io.ballerina.xsd.core.node.Kind;
import io.ballerina.xsd.core.node.XSDElement;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import static io.ballerina.xsd.core.Utils.resolveNameConflicts;
import static io.ballerina.xsd.core.diagnostic.DiagnosticMessage.xsdToBallerinaError;
import static io.ballerina.xsd.core.visitor.Utils.MAX_OCCURS;
import static io.ballerina.xsd.core.visitor.Utils.MIN_OCCURS;
import static io.ballerina.xsd.core.visitor.Utils.UNBOUNDED;
import static io.ballerina.xsd.core.visitor.Utils.addNamespace;
import static io.ballerina.xsd.core.visitor.Utils.asIterable;
import static io.ballerina.xsd.core.visitor.Utils.deriveType;
import static io.ballerina.xsd.core.visitor.Utils.extractType;
import static io.ballerina.xsd.core.visitor.Utils.generateDefaultValue;
import static io.ballerina.xsd.core.visitor.Utils.handleDefaultValues;
import static io.ballerina.xsd.core.visitor.Utils.handleFixedValues;
import static io.ballerina.xsd.core.visitor.Utils.handleKeywordNames;
import static io.ballerina.xsd.core.visitor.Utils.handleMaxOccurrences;
import static io.ballerina.xsd.core.visitor.Utils.handleMinOccurrences;
import static io.ballerina.xsd.core.visitor.Utils.isSimpleType;
import static io.ballerina.xsd.core.visitor.Utils.convertToCamelCase;
import static io.ballerina.xsd.core.visitor.Utils.resolveNames;
import static io.ballerina.xsd.core.visitor.Utils.sanitizeString;
import static io.ballerina.xsd.core.visitor.Utils.typeGenerator;

/**
 * This class is responsible for visiting and processing components of an XSD schema.
 *
 * @since 0.1.0
 */
public class XSDVisitorImpl implements XSDVisitor {
    public static final String PUBLIC = "public";
    public static final String WHITESPACE = " ";
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
    public static final String ALL = "all";
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
    public static final String ELEMENT_NAME_NOT_FOUND_ERROR = "Missing name attribute for the root element of '%s'";
    public static final String ATTRIBUTE_NOT_FOUND_ERROR = "Required attribute is not found: '%s'";
    public static final String ONE = "1";
    public static final String XMLDATA_CHOICE = "@xmldata:Choice";
    public static final String CHOICE_NAME = "ChoiceOption";
    public static final String EMPTY_ARRAY = "[]";
    public static final String XMLDATA_SEQUENCE = "@xmldata:Sequence";
    public static final String SEQUENCE_NAME = "SequenceGroup";
    public static final String XMLDATA_ORDER = "@xmldata:SequenceOrder";
    public static final String RESTRICTION = "restriction";
    public static final String CONTENT_FIELD = "\\#content";
    public static final String LIST = "list";
    public static final String ITEM_TYPE = "itemType";
    public static final String ANNOTATION = "annotation";
    public static final String SIMPLE_TYPE_DEFAULT_NAME = "SimpleType";
    public static final String REF = "ref";
    public static final String SINGLE_QUOTE = "'";

    private final ArrayList<String> imports = new ArrayList<>();
    private final Map<String, XSDElement> extensions = new LinkedHashMap<>();
    private final Map<String, String> rootElements = new LinkedHashMap<>();
    private final Map<String, XSDElement> nameResolvers = new LinkedHashMap<>();
    private final ArrayList<String> simpleTypeNames = new ArrayList<>();
    private final Map<String, XSDElement> nestedElements = new LinkedHashMap<>();
    private final Map<String, ArrayList<String>> enumerationElements = new LinkedHashMap<>();
    private final List<XSDDiagnostic> diagnostics = new ArrayList<>();
    private String targetNamespace;

    // Metadata to keep resolved name to original name
    private final Map<String, String> resolvedNameMeta = new HashMap<>();

    @Override
    public String visit(Element element) throws Exception {
        if (element.isSubType()) {
            return this.visit(element, true);
        }
        Node node = element.getNode();
        StringBuilder builder = new StringBuilder();
        builder.append(addNamespace(this, getTargetNamespace()));
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
        try {
            for (Node childNode : asIterable(node.getChildNodes())) {
                Optional<XSDComponent> component = XSDFactory.generateComponents(childNode);
                if (component.isEmpty()) {
                    continue;
                }
                if (component.get() instanceof SimpleType simpleType) {
                    if (nameNode == null) {
                        throw new Exception(String.format(ELEMENT_NAME_NOT_FOUND_ERROR,
                                            simpleType.getNode().getNodeName()));
                    }
                    return handleNestedSimpleTypes(builder, nameNode, component.get());
                }
            }
            typeNode = visitNestedElements(node, nameNode, typeNode);
        } catch (Exception e) {
            String errorMessage = String.format("The content of the XSD is not supported. %s", e.getMessage());
            diagnostics.add(xsdToBallerinaError(errorMessage));
        }
        if (nameNode == null && typeNode == null) {
            builder.append(STRING).append(WHITESPACE).append(CONTENT_FIELD);
        } else if (nameNode == null) {
            if (isSimpleType(deriveType(typeNode))) {
                builder.append(STRING).append(WHITESPACE).append(CONTENT_FIELD);
            } else {
                builder.append(deriveType(typeNode)).append(WHITESPACE).append(extractType(typeNode));
            }
        } else if (typeNode != null && node.hasAttributes()) {
            handleFixedValues(node, builder, typeNode);
            handleMaxOccurrences(node, builder);
            builder.append(resolveNames(Utils.handleKeywordNames(nameNode)));
            handleMinOccurrences(element, builder);
            handleDefaultValues(node, builder, typeNode);
        }
        builder.append(SEMICOLON);
        return builder.toString();
    }

    private String handleNestedSimpleTypes(StringBuilder builder, Node nameNode, XSDComponent component) {
        String fieldName = Utils.handleKeywordNames(nameNode);
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(PUBLIC).append(WHITESPACE).append(TYPE).append(WHITESPACE)
                .append(fieldName).append(WHITESPACE);
        for (Node simpleTypeNode : asIterable(((SimpleType) component).getNode().getChildNodes())) {
            if (simpleTypeNode.hasAttributes()) {
                Node type = simpleTypeNode.getAttributes().getNamedItem(BASE);
                stringBuilder.append(deriveType(type)).append(WHITESPACE).append(SEMICOLON);
            }
        }
        nestedElements.put(fieldName, new XSDElement(stringBuilder.toString(), Kind.SIMPLE_TYPE));
        return builder.append(WHITESPACE).append(fieldName).append(WHITESPACE)
                .append(fieldName).append(SEMICOLON).toString();
    }

    @Override
    public String visit(ComplexType element) throws Exception {
        if (element.isSubType()) {
            return this.visit(element, true);
        }
        Node node = element.getNode();
        StringBuilder builder = new StringBuilder();
        builder.append(addNamespace(this, getTargetNamespace()));
        builder.append(PUBLIC).append(WHITESPACE).append(TYPE).append(WHITESPACE);
        setTypeDefinition(element, node, builder);
        processChildNodes(node, builder);
        builder.append(VERTICAL_BAR).append(CLOSE_BRACES).append(SEMICOLON);
        return builder.toString();
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
                case ALL -> builder.append(visitAllContent(childNode, false));
                default -> builder.append(visitComplexContent(childNode));
            }
        }
        builder.append(VERTICAL_BAR).append(CLOSE_BRACES).append(SEMICOLON);
        return builder.toString();
    }

    @Override
    public String visit(SimpleType element, boolean isSubType) throws Exception {
        StringBuilder builder = new StringBuilder();
        Node nameNode = element.getNode().getAttributes().getNamedItem(NAME);
        for (Node simpleTypeNode : asIterable(element.getNode().getChildNodes())) {
            if (simpleTypeNode.getNodeType() != Node.ELEMENT_NODE
                    || simpleTypeNode.getLocalName().equals(ANNOTATION)) {
                continue;
            }
            ArrayList<String> enumValues = new ArrayList<>();
            boolean enumeration = hasEnumerations(simpleTypeNode, enumValues);
            StringBuilder stringBuilder = new StringBuilder();
            String name = (nameNode != null) ? nameNode.getNodeValue() : SIMPLE_TYPE_DEFAULT_NAME;
            if (simpleTypeNames.contains(name)) {
                name = resolveNameConflicts(name, simpleTypeNames);
            }
            if (enumeration) {
                stringBuilder.append(addNamespace(this, getTargetNamespace()));
                enumerationElements.put(name, enumValues);
                stringBuilder.append(PUBLIC).append(WHITESPACE).append(ENUM).append(WHITESPACE)
                        .append(name).append(WHITESPACE).append(OPEN_BRACES).append(WHITESPACE)
                        .append(CLOSE_BRACES).append(SEMICOLON);
            } else if (UNION.equals(simpleTypeNode.getLocalName())) {
                processUnionOfSimpleTypes(name, stringBuilder, simpleTypeNode, this, getTargetNamespace());
            } else {
                Node typeNode = simpleTypeNode.getAttributes().getNamedItem(BASE);
                builder.append(deriveType(typeNode)).append(WHITESPACE).append(SEMICOLON);
            }
            builder.append(stringBuilder);
        }
        return builder.toString();
    }

    @Override
    public String visit(SimpleType element) throws Exception {
        if (element.isSubType()) {
            return this.visit(element, true);
        }
        StringBuilder builder = new StringBuilder();
        Node nameNode = element.getNode().getAttributes().getNamedItem(NAME);
        for (Node simpleTypeNode : asIterable(element.getNode().getChildNodes())) {
            if (simpleTypeNode.getNodeType() != Node.ELEMENT_NODE
                    || simpleTypeNode.getLocalName().equals(ANNOTATION)) {
                continue;
            }
            ArrayList<String> enumValues = new ArrayList<>();
            boolean enumeration = hasEnumerations(simpleTypeNode, enumValues);
            StringBuilder stringBuilder = new StringBuilder();
            String name = (nameNode != null) ? nameNode.getNodeValue() : SIMPLE_TYPE_DEFAULT_NAME;
            if (simpleTypeNames.contains(name)) {
                name = resolveNameConflicts(name, simpleTypeNames);
            }
            simpleTypeNames.add(name);
            if (enumeration) {
                stringBuilder.append(addNamespace(this, getTargetNamespace()));
                enumerationElements.put(name, enumValues);
                stringBuilder.append(PUBLIC).append(WHITESPACE).append(ENUM).append(WHITESPACE)
                        .append(name).append(WHITESPACE).append(OPEN_BRACES).append(WHITESPACE)
                        .append(CLOSE_BRACES).append(SEMICOLON);
            } else if (UNION.equals(simpleTypeNode.getLocalName())) {
                processUnionOfSimpleTypes(name, stringBuilder, simpleTypeNode, this, getTargetNamespace());
            } else {
                stringBuilder.append(addNamespace(this, getTargetNamespace()));
                processSimpleType(stringBuilder, name, simpleTypeNode);
            }
            builder.append(stringBuilder);
        }
        return builder.toString();
    }

    @Override
    public void setTargetNamespace(String targetNamespace) {
        this.targetNamespace = targetNamespace;
    }

    @Override
    public String getTargetNamespace() {
        return this.targetNamespace;
    }

    private Node visitNestedElements(Node node, Node nameNode, Node typeNode) throws Exception {
        if (typeNode == null && node.hasChildNodes()) {
            typeNode = nameNode;
            for (Node childNode : asIterable(node.getChildNodes())) {
                Optional<XSDComponent> component = XSDFactory.generateComponents(childNode);
                if (component.isEmpty()) {
                    continue;
                }
                component.get().setNestedElement(true);
                if (nameNode == null) {
                    throw new Exception(String.format(ELEMENT_NAME_NOT_FOUND_ERROR, node.getNodeName()));
                }
                String fieldName = handleKeywordNames(nameNode);
                if (nestedElements.containsKey(fieldName)) {
                    String resolvedName = resolveNameConflicts(fieldName, nestedElements);
                    String element = component.get().accept(this);
                    nestedElements.put(resolvedName, new XSDElement(element, component.get().getKind()));
                    nameResolvers.put(resolvedName, new XSDElement(fieldName, component.get().getKind()));
                    resolvedNameMeta.put(targetNamespace + fieldName, resolvedName);
                } else {
                    String element = component.get().accept(this);
                    nestedElements.put(fieldName, new XSDElement(element, component.get().getKind()));
                }
            }
        } else if (typeNode == null && node.hasAttributes()) {
            typeNode = nameNode;
            for (int i = 0; i < node.getAttributes().getLength(); i++) {
                Node attribute = node.getAttributes().item(i);
                if (attribute.getNodeName().equals(TYPE) || attribute.getNodeName().equals(REF)) {
                    typeNode = attribute;
                }
            }
        }
        return typeNode;
    }

    public String visitAttribute(Node attribute) throws Exception {
        StringBuilder builder = new StringBuilder();
        this.addImports(BALLERINA_XML_DATA_MODULE);
        Node nameNode = attribute.getAttributes().getNamedItem(NAME);
        Node typeNode = attribute.getAttributes().getNamedItem(TYPE);
        if (nameNode == null) {
            throw new Exception(String.format(ATTRIBUTE_NOT_FOUND_ERROR, NAME));
        }
        builder.append(ATTRIBUTE_ANNOTATION).append(WHITESPACE);
        Node fixedNode = attribute.getAttributes().getNamedItem(FIXED);
        Node defaultNode = attribute.getAttributes().getNamedItem(DEFAULT);
        if (defaultNode != null) {
            builder.append(deriveType(typeNode)).append(WHITESPACE);
        } else if (fixedNode != null) {
            builder.append(generateFixedValue(deriveType(typeNode), fixedNode.getNodeValue())).append(WHITESPACE);
        } else if (attribute.hasChildNodes()) {
            builder.append(visitAttributeChildNodes(attribute.getChildNodes())).append(WHITESPACE);
        } else {
            builder.append(deriveType(typeNode)).append(WHITESPACE);
        }
        builder.append(handleKeywordNames(nameNode));
        Node attributeType = attribute.getAttributes().getNamedItem(USE);
        if (defaultNode != null) {
            builder.append(generateDefaultValue(deriveType(typeNode), defaultNode.getNodeValue()));
        } else if (attributeType != null && !attributeType.getNodeValue().equals(REQUIRED)) {
            builder.append(QUESTION_MARK);
        }
        builder.append(SEMICOLON);
        return builder.toString();
    }

    public String visitAttributeChildNodes(NodeList childNodes) {
        for (Node childNode: asIterable(childNodes)) {
            if (childNode.getNodeType() != Node.ELEMENT_NODE) {
                continue;
            }
            if (childNode.getLocalName().equals(SIMPLE_TYPE)) {
                for (Node simpleTypeNode : asIterable(childNode.getChildNodes())) {
                    if (simpleTypeNode.getNodeType() != Node.ELEMENT_NODE) {
                        continue;
                    }
                    if (simpleTypeNode.getLocalName().equals(RESTRICTION)) {
                        return deriveType(simpleTypeNode.getAttributes().getNamedItem(BASE));
                    } else if (simpleTypeNode.getLocalName().equals(LIST)) {
                        return deriveType(simpleTypeNode.getAttributes().getNamedItem(ITEM_TYPE));
                    }
                    return STRING;
                }
            }
        }
        return STRING;
    }

    public String visitComplexContent(Node node) throws Exception {
        StringBuilder builder = new StringBuilder();
        NodeList childNodes = node.getChildNodes();
        for (Node childNode : asIterable(childNodes)) {
            if (childNode.getNodeType() == Node.ELEMENT_NODE && EXTENSION.equals(childNode.getLocalName())) {
                String base = deriveType(childNode.getAttributes().getNamedItem(BASE));
                builder.append(visitExtension(childNode));
                Node nameNode = node.getParentNode().getAttributes().getNamedItem(NAME);
                if (nameNode != null) {
                    String parentNodeName = deriveType(node.getParentNode().getAttributes().getNamedItem(NAME));
                    extensions.put(parentNodeName, new XSDElement(base, Kind.COMPLEX_TYPE));
                }
            }
        }
        return builder.toString();
    }

    public String visitExtension(Node node) throws Exception {
        StringBuilder builder = new StringBuilder();
        NodeList childNodes = node.getChildNodes();
        for (Node childNode : asIterable(childNodes)) {
            addNamespace(this, getTargetNamespace());
            if (childNode.getNodeType() == Node.ELEMENT_NODE) {
                String localName = childNode.getLocalName();
                switch (localName) {
                    case SEQUENCE -> builder.append(visitSequence(childNode, false));
                    case CHOICE -> builder.append(visitChoice(childNode));
                    case ATTRIBUTE -> builder.append(visitAttribute(childNode));
                    case ALL -> builder.append(visitAllContent(childNode, false));
                    default -> builder.append(visitComplexContent(childNode));
                }
            }
        }
        return builder.toString();
    }

    public String visitChoice(Node node) throws Exception {
        StringBuilder builder = new StringBuilder();
        NodeList childNodes = node.getChildNodes();
        StringBuilder stringBuilder = new StringBuilder();
        StringBuilder childNodeBuilder = new StringBuilder();
        processChildChoiceNodes(childNodes, childNodeBuilder);
        this.addImports(BALLERINA_XML_DATA_MODULE);
        stringBuilder.append(addNamespace(this, getTargetNamespace()));
        String choiceName = applyChoiceAnnotation(builder, node);
        stringBuilder.append(PUBLIC).append(WHITESPACE).append(TYPE).append(WHITESPACE).append(choiceName);
        stringBuilder.append(WHITESPACE).append(RECORD).append(WHITESPACE).append(OPEN_BRACES).append(VERTICAL_BAR);
        stringBuilder.append(childNodeBuilder);
        stringBuilder.append(VERTICAL_BAR).append(CLOSE_BRACES).append(SEMICOLON);
        String childElements = stringBuilder.toString();
        if (nestedElements.containsKey(choiceName)) {
            choiceName = resolveNameConflicts(choiceName, nestedElements);
        }
        nestedElements.put(choiceName, new XSDElement(childElements, Kind.CHOICE));
        return builder.toString();
    }

    public String visitSequence(Node node, boolean isOptional) throws Exception {
        StringBuilder builder = new StringBuilder();
        NodeList childNodes = node.getChildNodes();
        StringBuilder stringBuilder = new StringBuilder();
        StringBuilder childNodeBuilder = new StringBuilder();
        processChildNodes(isOptional, childNodes, childNodeBuilder);
        this.addImports(BALLERINA_XML_DATA_MODULE);
        stringBuilder.append(addNamespace(this, getTargetNamespace()));
        String sequenceName = applySequenceAnnotation(node, builder);
        generateSequenceType(stringBuilder, childNodeBuilder, sequenceName);
        if (nestedElements.containsKey(sequenceName)) {
            sequenceName = resolveNameConflicts(sequenceName, nestedElements);
        }
        nestedElements.put(sequenceName, new XSDElement(stringBuilder.toString(), Kind.SEQUENCE));
        return builder.toString();
    }

    public String visitAllContent(Node node, boolean isOptional) throws Exception {
        NodeList childNodes = node.getChildNodes();
        StringBuilder childNodeBuilder = new StringBuilder();
        processAllChildNodes(isOptional, childNodes, childNodeBuilder);
        return childNodeBuilder.toString();
    }

    private String handleElementsWithChildNodes(Node node, StringBuilder builder) throws Exception {
        Node nameNode = node.getAttributes().getNamedItem(NAME);
        Node typeNode = node.getAttributes().getNamedItem(TYPE);
        if (nameNode == null) {
            throw new Exception(String.format(ATTRIBUTE_NOT_FOUND_ERROR, NAME));
        }
        String fieldName = handleKeywordNames(nameNode);
        if (typeNode != null && typeNode.getNodeValue().equals(fieldName)) {
            String resolvedName = resolveTypeNameConflicts(fieldName, typeNode.getNodeValue());
            nameResolvers.put(resolvedName, new XSDElement(fieldName, Kind.ELEMENT));
            resolvedNameMeta.put(targetNamespace + fieldName, resolvedName);
            builder.append(resolvedName).append(WHITESPACE);
        } else if (typeNode == null) {
            builder.append(fieldName).append(WHITESPACE);
        }
        if (typeNode != null) {
            builder.append(fieldName).append(WHITESPACE);
            builder.append(deriveType(typeNode)).append(SEMICOLON).append(NEW_LINE);
        }
        for (Node child : asIterable(node.getChildNodes())) {
            Optional<XSDComponent> component = XSDFactory.generateComponents(child);
            if (component.isEmpty()) {
                continue;
            }
            component.ifPresent(xsdComponent -> xsdComponent.setSubType(true));
            builder.append(component.get().accept(this));
        }
        return builder.toString();
    }

    private static String resolveTypeNameConflicts(String name, String typeName) {
        StringBuilder resolvedName = new StringBuilder(name);
        if (resolvedName.toString().equals(typeName)) {
            resolvedName.append(ONE);
        }
        return resolvedName.toString();
    }

    public static String generateFixedValue(String type, String value) {
        StringBuilder builder = new StringBuilder();
        if (type.equals(INT)) {
            builder.append(value).append(WHITESPACE);
        } else {
            builder.append(QUOTATION_MARK).append(value).append(QUOTATION_MARK).append(WHITESPACE);
        }
        return builder.toString();
    }

    private void setTypeDefinition(ComplexType element, Node node, StringBuilder builder) throws Exception {
        Node nameNode = node.getAttributes().getNamedItem(NAME);
        if (nameNode != null) {
            if (SyntaxInfo.isKeyword(nameNode.getNodeValue())) {
                String resolvedName = Character.toUpperCase(nameNode.getNodeValue().charAt(0))
                        + nameNode.getNodeValue().substring(1);
                nameResolvers.put(resolvedName, new XSDElement(nameNode.getNodeValue(), Kind.COMPLEX_TYPE));
                resolvedNameMeta.put(targetNamespace + nameNode.getNodeValue(), resolvedName);
                builder.append(resolvedName);
            } else {
                builder.append(handleKeywordNames(nameNode));
            }
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
        return nameNode != null ? handleKeywordNames(nameNode) : EMPTY_STRING;
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
            case ALL -> builder.append(visitAllContent(childNode, false));
            default -> builder.append(visitComplexContent(childNode));
        }
    }

    private void processChildChoiceNodes(NodeList childNodes, StringBuilder stringBuilder) throws Exception {
        for (Node childNode : asIterable(childNodes)) {
            if (childNode.getNodeType() != Node.ELEMENT_NODE || childNode.getLocalName().equals(ANNOTATION)) {
                continue;
            }
            if (childNode.getLocalName().equals(SEQUENCE)) {
                stringBuilder.append(visitSequence(childNode, true));
            } else {
                stringBuilder.append(addNamespace(this, getTargetNamespace()));
                if (childNode.hasChildNodes()) {
                    StringBuilder childNodeBuilder = new StringBuilder();
                    processChildNode(childNode, childNodeBuilder);
                }
                Node nameNode = childNode.getAttributes().getNamedItem(NAME);
                Node typeNode = childNode.getAttributes().getNamedItem(TYPE);
                typeNode = typeNode == null ? nameNode : typeNode;
                if (childNode.hasAttributes() && childNode.getAttributes().getNamedItem(REF) != null) {
                    Node refNode = childNode.getAttributes().getNamedItem(REF);
                    String derivedType = refNode.getNodeValue().contains(COLON)
                            ? refNode.getNodeValue().substring(refNode.getNodeValue().indexOf(COLON) + 1)
                            : refNode.getNodeValue();
                    stringBuilder.append(derivedType).append(WHITESPACE);
                    stringBuilder.append(derivedType);
                } else {
                    if (nameNode == null) {
                        throw new Exception(String.format(ATTRIBUTE_NOT_FOUND_ERROR, NAME));
                    }
                    stringBuilder.append(deriveType(typeNode)).append(WHITESPACE);
                    stringBuilder.append(handleKeywordNames(nameNode));
                }
                stringBuilder.append(QUESTION_MARK).append(SEMICOLON);
            }
        }
    }

    private String applyChoiceAnnotation(StringBuilder builder, Node node) {
        this.addImports(BALLERINA_XML_DATA_MODULE);
        Node maxOccurrenceNode = node.getAttributes().getNamedItem(MAX_OCCURS);
        Node minOccurrenceNode = node.getAttributes().getNamedItem(MIN_OCCURS);
        String maxOccurrence = (maxOccurrenceNode != null) ? maxOccurrenceNode.getNodeValue() : ONE;
        String minOccurrence = (minOccurrenceNode != null) ? minOccurrenceNode.getNodeValue() : ONE;
        String choiceName = (nestedElements.containsKey(CHOICE_NAME))
                ? resolveNameConflicts(CHOICE_NAME, nestedElements) : CHOICE_NAME;
        builder.append(XMLDATA_CHOICE).append(WHITESPACE).append(OPEN_BRACES);
        builder.append(MIN_OCCURS).append(COLON).append(minOccurrence);
        if (!(UNBOUNDED.equalsIgnoreCase(maxOccurrence))) {
            builder.append(COMMA).append(MAX_OCCURS).append(COLON).append(maxOccurrence);
        }
        builder.append(CLOSE_BRACES);
        builder.append(choiceName).append((maxOccurrence.equals(ONE)) ? EMPTY_STRING : EMPTY_ARRAY);
        builder.append(WHITESPACE).append(convertToCamelCase(choiceName)).append(SEMICOLON);
        return choiceName;
    }

    private static void generateSequenceType(StringBuilder stringBuilder,
                                             StringBuilder childNodeBuilder, String sequenceName) {
        stringBuilder.append(PUBLIC).append(WHITESPACE).append(TYPE).append(WHITESPACE).append(sequenceName);
        stringBuilder.append(WHITESPACE).append(RECORD).append(WHITESPACE).append(OPEN_BRACES).append(VERTICAL_BAR);
        stringBuilder.append(childNodeBuilder);
        stringBuilder.append(VERTICAL_BAR).append(CLOSE_BRACES).append(SEMICOLON);
    }

    private void processChildNodes(boolean isOptional, NodeList childNodes,
                                   StringBuilder stringBuilder) throws Exception {
        int order = 0;
        for (Node childNode : asIterable(childNodes)) {
            Optional<XSDComponent> component = XSDFactory.generateComponents(childNode);
            if (component.isEmpty()) {
                continue;
            }
            order++;
            component.get().setSubType(true);
            component.get().setOptional(isOptional);
            stringBuilder.append(addNamespace(this, getTargetNamespace()));
            String orderAnnotation = XMLDATA_ORDER + WHITESPACE + OPEN_BRACES + VALUE + COLON + order + CLOSE_BRACES;
            stringBuilder.append(orderAnnotation);
            stringBuilder.append(component.get().accept(this));
        }
        if (order == 0) {
            stringBuilder.append(addNamespace(this, getTargetNamespace()));
            stringBuilder.append(XMLDATA_ORDER + WHITESPACE + OPEN_BRACES + VALUE + COLON + ONE + CLOSE_BRACES);
            stringBuilder.append(STRING).append(WHITESPACE).append(CONTENT_FIELD).append(SEMICOLON);
        }
    }

    private void processAllChildNodes(boolean isOptional, NodeList childNodes,
                                      StringBuilder stringBuilder) throws Exception {
        for (Node childNode : asIterable(childNodes)) {
            Optional<XSDComponent> component = XSDFactory.generateComponents(childNode);
            if (component.isEmpty()) {
                continue;
            }
            component.get().setSubType(true);
            component.get().setOptional(isOptional);
            stringBuilder.append(addNamespace(this, getTargetNamespace()));
            stringBuilder.append(component.get().accept(this));
        }
    }

    private void processChildNode(Node childNode,
                                  StringBuilder stringBuilder) throws Exception {
        Optional<XSDComponent> component = XSDFactory.generateComponents(childNode);
        if (component.isPresent()) {
            component.get().setSubType(true);
            component.get().setOptional(false);
            stringBuilder.append(addNamespace(this, getTargetNamespace()));
            stringBuilder.append(component.get().accept(this));
        }
    }

    private String applySequenceAnnotation(Node node, StringBuilder builder) {
        Node maxOccurrenceNode = node.getAttributes().getNamedItem(MAX_OCCURS);
        Node minOccurrenceNode = node.getAttributes().getNamedItem(MIN_OCCURS);
        String maxOccurrence = (maxOccurrenceNode != null) ? maxOccurrenceNode.getNodeValue() : ONE;
        String minOccurrence = (minOccurrenceNode != null) ? minOccurrenceNode.getNodeValue() : ONE;
        String sequenceName = (nestedElements.containsKey(SEQUENCE_NAME))
                ? resolveNameConflicts(SEQUENCE_NAME, nestedElements) : SEQUENCE_NAME;
        sequenceName = (sequenceName.contains(COLON))
                ? sequenceName.substring(sequenceName.indexOf(COLON) + 1) : sequenceName;
        builder.append(XMLDATA_SEQUENCE).append(WHITESPACE).append(OPEN_BRACES);
        builder.append(MIN_OCCURS).append(COLON).append(minOccurrence).append(COMMA);
        builder.append(MAX_OCCURS).append(COLON).append(maxOccurrence).append(CLOSE_BRACES);
        builder.append(sequenceName).append((maxOccurrence.equals(ONE)) ? EMPTY_STRING : EMPTY_ARRAY);
        builder.append(WHITESPACE).append(convertToCamelCase(sequenceName)).append(SEMICOLON);
        return sequenceName;
    }

    private static void processSimpleType(StringBuilder builder, String name, Node simpleTypeNode) {
        builder.append(PUBLIC).append(WHITESPACE).append(TYPE).append(WHITESPACE);
        builder.append(name).append(WHITESPACE);
        Node typeNode = simpleTypeNode.getAttributes().getNamedItem(BASE);
        builder.append(deriveType(typeNode)).append(WHITESPACE).append(SEMICOLON);
    }

    private void processUnionOfSimpleTypes(String nameValue, StringBuilder builder,
                                           Node simpleTypeNode, XSDVisitorImpl xsdVisitor,
                                           String targetNamespace) throws Exception {
        if (simpleTypeNode.hasAttributes() && simpleTypeNode.getAttributes().getNamedItem(MEMBER_TYPES) != null) {
            builder.append(addNamespace(xsdVisitor, targetNamespace));
            builder.append(PUBLIC).append(WHITESPACE).append(TYPE).append(WHITESPACE);
            Node nameNode = simpleTypeNode.getParentNode().getAttributes().getNamedItem(NAME);
            if (nameNode == null) {
                throw new Exception(String.format(ATTRIBUTE_NOT_FOUND_ERROR, NAME));
            }
            builder.append(handleKeywordNames(nameNode));
            builder.append(WHITESPACE);
            Node memberTypesNode = simpleTypeNode.getAttributes().getNamedItem(MEMBER_TYPES);
            if (memberTypesNode == null) {
                throw new Exception(String.format(ATTRIBUTE_NOT_FOUND_ERROR, MEMBER_TYPES));
            }
            String unionTypes = memberTypesNode.getNodeValue();
            String[] typesArray = unionTypes.split(WHITESPACE);
            ArrayList<String> existingTypes = new ArrayList<>();
            for (String type: typesArray) {
                String generatedType = typeGenerator(type.substring(type.indexOf(COLON) + 1));
                if (existingTypes.contains(generatedType)) {
                    continue;
                }
                existingTypes.add(generatedType);
                builder.append(generatedType).append(VERTICAL_BAR);
            }
            builder.delete(builder.length() - 1, builder.length()).append(SEMICOLON);
        } else if (simpleTypeNode.hasChildNodes()) {
            NodeList nodes = simpleTypeNode.getChildNodes();
            StringBuilder stringBuilder = new StringBuilder();
            for (Node childNode : asIterable(nodes)) {
                Optional<XSDComponent> component = XSDFactory.generateComponents(childNode);
                if (component.isEmpty()) {
                    continue;
                }
                Node nameNode = childNode.getAttributes().getNamedItem(NAME);
                String name = (nameNode != null) ? handleKeywordNames(nameNode) : SIMPLE_TYPE_DEFAULT_NAME;
                if (simpleTypeNames.contains(name)) {
                    name = resolveNameConflicts(name, simpleTypeNames);
                }
                component.get().setNestedElement(true);
                if (nestedElements.containsKey(name)) {
                    String resolvedName = resolveNameConflicts(name, nestedElements);
                    String element = component.get().accept(this);
                    nestedElements.put(resolvedName, new XSDElement(element, component.get().getKind()));
                    nameResolvers.put(resolvedName, new XSDElement(name, component.get().getKind()));
                    resolvedNameMeta.put(targetNamespace + name, resolvedName);
                } else {
                    String element = component.get().accept(this);
                    nestedElements.put(name, new XSDElement(element, component.get().getKind()));
                }
                stringBuilder.append(name).append(VERTICAL_BAR);
            }
            builder.append(addNamespace(xsdVisitor, targetNamespace))
                    .append(PUBLIC).append(WHITESPACE).append(TYPE).append(WHITESPACE)
                    .append(nameValue).append(WHITESPACE);
            builder.append(stringBuilder.substring(0, stringBuilder.length() - 1)).append(WHITESPACE).append(SEMICOLON);
        }
    }

    private static boolean hasEnumerations(Node simpleTypeNode, ArrayList<String> enumValues) throws Exception {
        boolean enumeration = false;
        if (simpleTypeNode.hasChildNodes()) {
            NodeList nodes = simpleTypeNode.getChildNodes();
            for (Node node : asIterable(nodes)) {
                if (node.getNodeType() == Node.ELEMENT_NODE && ENUMERATION.equals(node.getLocalName())) {
                    enumeration = true;
                    Node valueNode = node.getAttributes().getNamedItem(VALUE);
                    if (valueNode == null) {
                        throw new Exception(String.format(ATTRIBUTE_NOT_FOUND_ERROR, VALUE));
                    }
                    String enumValue = sanitizeString(valueNode.getNodeValue());
                    if (enumValue.equals(EMPTY_STRING)) {
                        continue;
                    }
                    enumValues.add(enumValue);
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
        String elementName = handleKeywordNames(nameNode);
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
            elementName = resolveTypeNameConflicts(elementName, typeName);
            nameResolvers.put(elementName, new XSDElement(typeName, Kind.ELEMENT));
            resolvedNameMeta.put(targetNamespace + typeName, elementName);
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

    @Override
    public void clearImports() {
        imports.clear();
    }

    @Override
    public ArrayList<String> getImports() {
        return imports;
    }

    @Override
    public Map<String, XSDElement> getExtensions() {
        return extensions;
    }

    @Override
    public Map<String, String> getRootElements() {
        return rootElements;
    }

    @Override
    public Map<String, XSDElement> getNestedElements() {
        return nestedElements;
    }

    @Override
    public Map<String, XSDElement> getNameResolvers() {
        return nameResolvers;
    }

    @Override
    public Map<String, String> getResolvedNameMeta() {
        return resolvedNameMeta;
    }

    @Override
    public Map<String, ArrayList<String>> getEnumerationElements() {
        return enumerationElements;
    }

    public List<XSDDiagnostic> getDiagnostics() {
        return diagnostics;
    }
}
