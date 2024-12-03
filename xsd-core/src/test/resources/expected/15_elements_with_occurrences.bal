import ballerina/data.xmldata;

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type Add record {
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    int intA?;
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    int intB;
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    int[] intC?;
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    string[] stringA;
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    int[] intD?;
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    string[] stringB;
};
