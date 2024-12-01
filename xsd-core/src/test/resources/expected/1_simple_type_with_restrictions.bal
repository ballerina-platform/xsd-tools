import ballerina/data.xmldata;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Age decimal;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Root record {
    decimal \#content;
};
