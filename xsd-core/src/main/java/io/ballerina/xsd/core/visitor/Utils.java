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
import io.ballerina.xsd.core.component.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import java.util.Arrays;
import java.util.Iterator;
import java.util.Locale;
import java.util.NoSuchElementException;
import java.util.Objects;
import java.util.Set;

import static io.ballerina.xsd.core.visitor.XSDVisitorImpl.EMPTY_STRING;
import static io.ballerina.xsd.core.visitor.XSDVisitorImpl.generateFixedValue;

/**
 * Contains utility functions for working with XSD specifications.
 *
 * @since 0.1.0
 */
public final class Utils {
    public static final String WHITESPACE = " ";
    public static final String EQUAL = "=";
    public static final String DEFAULT = "default";
    public static final String FIXED = "fixed";
    public static final String QUOTATION_MARK = "\"";
    public static final String OPEN_BRACES = "{";
    public static final String CLOSE_BRACES = "}";
    public static final String OPEN_SQUARE_BRACKET = "[";
    public static final String CLOSE_SQUARE_BRACKET = "]";
    public static final String ZERO = "0";
    public static final String ONE = "1";
    public static final String QUESTION_MARK = "?";
    public static final String MAX_OCCURS = "maxOccurs";
    public static final String MIN_OCCURS = "minOccurs";
    public static final String UNBOUNDED = "unbounded";
    public static final String COMMA = ",";
    public static final String COLON = ":";
    public static final String TIME = "time";
    public static final String DATE_TIME = "dateTime";
    public static final String DATE = "date";
    public static final String LANGUAGE = "language";
    public static final String G_YEAR_MONTH = "gYearMonth";
    public static final String G_YEAR = "gYear";
    public static final String G_MONTH_DAY = "gMonthDay";
    public static final String G_DAY = "gDay";
    public static final String G_MONTH = "gMonth";
    public static final String NORMALIZED_STRING = "normalizedString";
    public static final String TOKEN = "token";
    public static final String NCNAME = "NCName";
    public static final String QNAME = "QName";
    public static final String NOTATION = "NOTATION";
    public static final String STRING = "string";
    public static final String INTEGER = "integer";
    public static final String LONG = "long";
    public static final String NEGATIVE_INTEGER = "negativeInteger";
    public static final String NON_POSITIVE_INTEGER = "nonPositiveInteger";
    public static final String NON_NEGATIVE_INTEGER = "nonNegativeInteger";
    public static final String POSITIVE_INTEGER = "positiveInteger";
    public static final String SHORT = "short";
    public static final String UNSIGNED_LONG = "unsignedLong";
    public static final String UNSIGNED_INT = "unsignedInt";
    public static final String UNSIGNED_SHORT = "unsignedShort";
    public static final String UNSIGNED_BYTE = "unsignedByte";
    public static final String INT = "int";
    public static final String BASE64_BINARY = "base64Binary";
    public static final String HEX_BINARY = "hexBinary";
    public static final String BYTE = "byte";
    public static final String BOOLEAN = "boolean";
    public static final String FLOAT = "float";
    public static final String DOUBLE = "double";
    public static final String DECIMAL = "decimal";
    public static final String ANY_URI = "anyURI";
    public static final String BALLERINA_XML_DATA_MODULE = "ballerina/data.xmldata";
    public static final String XMLDATA_NAMESPACE = "@xmldata:Namespace";
    public static final String URI = "uri";
    public static final String DURATION = "duration";
    public static final String UNDERSCORE = "_";
    private static final String INVALID_CHARS_PATTERN = ".*[!@$%^&*()_\\-|/\\\\\\s\\d].*";
    private static final String DIGIT_PATTERN = ".*\\d.*";
    private static final String STARTS_WITH_DIGIT_PATTERN = "^\\d.*";
    private static final String SLASH_PATTERN = "[/\\\\]";
    private static final String WHITESPACE_PATTERN = "\\s";
    private static final String SPECIAL_CHARS_PATTERN = "[!@$%^&*()_\\-|]";
    public static final String NMTOKEN = "NMTOKEN";
    public static final String IDREF = "IDREF";
    public static final String IDREFS = "IDREFS";
    public static final String ANYDATA = "anydata";
    public static final String ANY_TYPE = "anyType";
    public static final String ANY_SIMPLE_TYPE = "anySimpleType";
    public static final String ANY_ATOMIC_TYPE = "anyAtomicType";

    public static String addNamespace(XSDVisitorImpl xsdVisitor, String namespace) {
        if (Objects.equals(namespace, EMPTY_STRING)) {
            return EMPTY_STRING;
        }
        xsdVisitor.addImports(BALLERINA_XML_DATA_MODULE);
        return XMLDATA_NAMESPACE + WHITESPACE + OPEN_BRACES + URI + COLON + QUOTATION_MARK + namespace +
                QUOTATION_MARK + CLOSE_BRACES;
    }

    public static void handleFixedValues(Node node, StringBuilder builder, Node typeNode) {
        Node fixedNode = node.getAttributes().getNamedItem(FIXED);
        if (fixedNode != null) {
            builder.append(generateFixedValue(deriveType(typeNode), fixedNode.getNodeValue())).append(WHITESPACE);
        } else {
            builder.append(deriveType(typeNode)).append(WHITESPACE);
        }
    }

    public static void handleDefaultValues(Node node, StringBuilder builder, Node typeNode) {
        Node defaultNode = node.getAttributes().getNamedItem(DEFAULT);
        if (defaultNode != null) {
            builder.append(generateDefaultValue(deriveType(typeNode), defaultNode.getNodeValue()));
        }
    }

    public static String generateDefaultValue(String type, String value) {
        StringBuilder builder = new StringBuilder().append(WHITESPACE).append(EQUAL).append(WHITESPACE);
        final Set<String> unquotedTypes = Set.of(INT, INTEGER, LONG, NEGATIVE_INTEGER, NON_POSITIVE_INTEGER,
                POSITIVE_INTEGER, SHORT, UNSIGNED_LONG, UNSIGNED_INT,
                UNSIGNED_SHORT, BOOLEAN, FLOAT, DOUBLE, DECIMAL
        );
        builder.append(unquotedTypes.contains(type) ? value : QUOTATION_MARK + value + QUOTATION_MARK);
        return builder.toString();
    }

    public static void handleMinOccurrences(Element element, StringBuilder builder) {
        if (element.isOptional()) {
            builder.append(QUESTION_MARK);
            return;
        }
        Node node = element.getNode();
        Node minOccurrence = node.getAttributes().getNamedItem(MIN_OCCURS);
        if (minOccurrence != null) {
            if (minOccurrence.getNodeValue().equals(ZERO)) {
                builder.append(QUESTION_MARK);
            }
        }
    }

    public static void handleMaxOccurrences(Node node, StringBuilder builder) {
        Node maxOccurrence = node.getAttributes().getNamedItem(MAX_OCCURS);
        if (maxOccurrence != null) {
            String maxValue = maxOccurrence.getNodeValue();
            builder.append(maxValue.equals(UNBOUNDED)
                    ? OPEN_SQUARE_BRACKET + CLOSE_SQUARE_BRACKET + WHITESPACE : !maxValue.equals(ONE)
                    ? OPEN_SQUARE_BRACKET + EMPTY_STRING + CLOSE_SQUARE_BRACKET + WHITESPACE : EMPTY_STRING
            );
        }
    }

    public static String extractType(Node node) {
        return (node != null)
                ? node.getNodeValue().contains(COLON)
                ? node.getNodeValue().substring(node.getNodeValue().indexOf(COLON) + 1)
                : node.getNodeValue()
                : STRING;
    }

    public static String deriveType(Node node) {
        String derivedType = extractType(node);
        return typeGenerator(derivedType);
    }

    public static String typeGenerator(String typeName) {
        switch (typeName) {
            case TIME, DATE_TIME, DATE, G_YEAR_MONTH, G_YEAR, STRING, LANGUAGE,
                    DURATION, ANY_URI, G_MONTH_DAY, NMTOKEN, IDREF, IDREFS, G_DAY, G_MONTH, NORMALIZED_STRING,
                    TOKEN, NCNAME, QNAME, NOTATION, BASE64_BINARY, HEX_BINARY, BYTE -> {
                return STRING;
            }
            case INTEGER, LONG, NEGATIVE_INTEGER, NON_POSITIVE_INTEGER, POSITIVE_INTEGER, SHORT,
                    UNSIGNED_LONG, UNSIGNED_INT, UNSIGNED_SHORT, UNSIGNED_BYTE, INT, NON_NEGATIVE_INTEGER -> {
                return INT;
            }
            case DOUBLE, FLOAT -> {
                return FLOAT;
            }
            case BOOLEAN -> {
                return BOOLEAN;
            }
            case DECIMAL -> {
                return DECIMAL;
            }
            case ANY_TYPE, ANY_SIMPLE_TYPE, ANY_ATOMIC_TYPE  -> {
                return ANYDATA;
            }
            default -> {
                return typeName;
            }
        }
    }

    public static boolean isSimpleType(String type) {
        String typeName = type.contains(COLON) ? type.substring(type.indexOf(COLON) + 1) : type;
        String[] simpleTypes = {
                TIME, DATE_TIME, DATE, G_YEAR_MONTH, G_YEAR, STRING, LANGUAGE, DURATION,
                INTEGER, LONG, NEGATIVE_INTEGER, NON_POSITIVE_INTEGER, POSITIVE_INTEGER, SHORT,
                UNSIGNED_LONG, UNSIGNED_INT, UNSIGNED_SHORT,
                UNSIGNED_BYTE, INT, BASE64_BINARY, BOOLEAN, FLOAT, DOUBLE, DECIMAL, ANY_URI, NON_NEGATIVE_INTEGER
        };
        return Arrays.stream(simpleTypes).toList().contains(typeName);
    }

    public static Iterable<Node> asIterable(NodeList nodeList) {
        return () -> new Iterator<>() {
            private int index = 0;

            @Override
            public boolean hasNext() {
                return index < nodeList.getLength();
            }

            @Override
            public Node next() {
                if (!hasNext()) {
                    throw new NoSuchElementException();
                }
                return nodeList.item(index++);
            }
        };
    }

    public static String convertToCamelCase(String pascalCase) {
        if (pascalCase == null || pascalCase.isEmpty()) {
            return pascalCase;
        }
        return Character.toLowerCase(pascalCase.charAt(0)) + pascalCase.substring(1);
    }

    public static String sanitizeString(String input) {
        if (!input.matches(INVALID_CHARS_PATTERN)
                || (input.matches(DIGIT_PATTERN) && !input.matches(STARTS_WITH_DIGIT_PATTERN))) {
            return input;
        }
        if (input.matches(STARTS_WITH_DIGIT_PATTERN)) {
            input = UNDERSCORE + input;
        }
        String keyPart = input.toLowerCase(Locale.ROOT);
        for (String s : Arrays.asList(SLASH_PATTERN, WHITESPACE_PATTERN, SPECIAL_CHARS_PATTERN)) {
            keyPart = keyPart.replaceAll(s, UNDERSCORE);
        }
        return keyPart + " = \"" + input + "\"";
    }

    public static String resolveNames(String input) {
        if (!input.matches(INVALID_CHARS_PATTERN)
                || (input.matches(DIGIT_PATTERN) && !input.matches(STARTS_WITH_DIGIT_PATTERN))) {
            return input;
        }
        if (input.matches(STARTS_WITH_DIGIT_PATTERN)) {
            input = UNDERSCORE + input;
        }
        for (String placeholder : Arrays.asList(SLASH_PATTERN, WHITESPACE_PATTERN, SPECIAL_CHARS_PATTERN)) {
            input = input.replaceAll(placeholder, UNDERSCORE);
        }
        return input;
    }

    static String handleKeywordNames(Node nameNode) {
        String fieldName = nameNode.getNodeValue();
        fieldName = SyntaxInfo.isKeyword(fieldName) ? XSDVisitorImpl.SINGLE_QUOTE + fieldName : fieldName;
        return fieldName;
    }
}
