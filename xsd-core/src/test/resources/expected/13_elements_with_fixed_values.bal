import ballerina/data.xmldata;

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type Add record {
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    "data" stringField;
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    56 intField;
};
