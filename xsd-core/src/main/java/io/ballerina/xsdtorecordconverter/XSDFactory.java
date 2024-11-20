package io.ballerina.xsdtorecordconverter;

import org.w3c.dom.Node;

import static io.ballerina.xsdtorecordconverter.XSDVisitor.COMPLEX_TYPE;
import static io.ballerina.xsdtorecordconverter.XSDVisitor.ELEMENT;
import static io.ballerina.xsdtorecordconverter.XSDVisitor.SIMPLE_TYPE;

public class XSDFactory {
    public static IComponent generateComponents(Node node) {
        if (node.getNodeType() != Node.ELEMENT_NODE) {
            return null;
        }
        switch (node.getLocalName()) {
            case ELEMENT -> {
                return new Element(node);
            }
            case COMPLEX_TYPE -> {
                return new ComplexType(node);
            }
            case SIMPLE_TYPE -> {
                return new SimpleType(node);
            }
            default -> {
                return null;
            }
        }
    }
}
