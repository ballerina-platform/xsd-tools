import ballerina/data.xmldata;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type PersonBase record {
    @xmldata:Attribute
    int id;
    @xmldata:Attribute
    string name;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Employee record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PersonBase PersonBase;
    @xmldata:Attribute
    int age?;
    @xmldata:Attribute
    string position?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Employee123 record {
    Employee \#content;
};
