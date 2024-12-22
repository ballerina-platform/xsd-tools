import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type ID string|int;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Person record {|
    ID \#content;
|};
