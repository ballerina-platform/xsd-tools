import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://tempuri.org/"}
public type Age decimal;

@xmldata:Namespace {uri: "http://tempuri.org/"}
public type Root record {|
    decimal \#content?;
|};
