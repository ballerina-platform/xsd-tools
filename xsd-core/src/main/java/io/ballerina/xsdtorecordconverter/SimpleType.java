package io.ballerina.xsdtorecordconverter;

import org.w3c.dom.Node;

public class SimpleType implements IComponent {
    Node node;
    boolean isSubType;

    public SimpleType(Node node) {
        this.node = node;
        this.isSubType = false;
    }

    public Node getNode() {
        return node;
    }

    @Override
    public String accept(IXSDVisitor xsdVisitor) {
        return xsdVisitor.visit(this);
    }

    @Override
    public void setSubType(boolean subType) {
        this.isSubType = subType;
    }

    @Override
    public boolean isSubType() {
        return isSubType;
    }
}
