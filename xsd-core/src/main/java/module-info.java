module io.ballerina.xsdtorecordconverter {
    requires java.xml;
    requires io.ballerina.parser;
    requires io.ballerina.formatter.core;

    exports io.ballerina.xsd.core;
    exports io.ballerina.xsd.core.visitor;
    exports io.ballerina.xsd.core.component;
}
