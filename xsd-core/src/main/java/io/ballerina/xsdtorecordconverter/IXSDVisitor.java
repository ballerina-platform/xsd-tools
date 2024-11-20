package io.ballerina.xsdtorecordconverter;

public interface IXSDVisitor {
    String visit(Element element);
    String visit(Element element, boolean isSubType);
    String visit(ComplexType element);
    String visit(ComplexType element, boolean isSubType);
    String visit(SimpleType element);
}
