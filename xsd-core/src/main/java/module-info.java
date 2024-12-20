module io.ballerina.xsd.core {
    requires java.xml;
    requires io.ballerina.parser;
    requires io.ballerina.formatter.core;
    requires io.ballerina.tools.api;

    exports io.ballerina.xsd.core;
    exports io.ballerina.xsd.core.visitor;
    exports io.ballerina.xsd.core.component;
    exports io.ballerina.xsd.core.diagnostic;
}
