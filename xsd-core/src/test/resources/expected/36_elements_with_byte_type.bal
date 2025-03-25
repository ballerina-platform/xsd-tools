import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://www.namespaces.com"}
public type xmlBytes record {|
    string \#content;
|};
