package io.ballerina.xsdtorecordconverter;

public interface IComponent {
    String accept(IXSDVisitor xsdVisitor);
    void setSubType(boolean subType);
    boolean isSubType();
}
