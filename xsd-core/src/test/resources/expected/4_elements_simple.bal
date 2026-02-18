import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Name record {|
    string \#content?;
|};
