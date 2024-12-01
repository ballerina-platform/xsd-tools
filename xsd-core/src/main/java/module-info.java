module io.ballerina.xsdtorecordconverter {
    requires java.xml;
    requires io.ballerina.parser;
    requires io.ballerina.formatter.core;

    exports io.ballerina.xsdtorecordconverter;
    exports io.ballerina.xsdtorecordconverter.visitor;
    exports io.ballerina.xsdtorecordconverter.component;
}
