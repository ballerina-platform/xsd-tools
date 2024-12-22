import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type PersonAge record {|
    decimal \#content;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Age decimal;
