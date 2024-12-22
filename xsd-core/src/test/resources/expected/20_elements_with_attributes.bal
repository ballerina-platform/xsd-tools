import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Person record {|
    @xmldata:Attribute
    int id;
    @xmldata:Attribute
    string name;
    @xmldata:Attribute
    int age?;
|};
