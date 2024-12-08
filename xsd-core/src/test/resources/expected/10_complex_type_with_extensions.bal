import ballerina/data.xmldata;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type PersonBase record {|
    @xmldata:Attribute
    int id;
    @xmldata:Attribute
    string name;
|};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Employee record {|
    @xmldata:Attribute
    int id;
    @xmldata:Attribute
    string name;
    @xmldata:Attribute
    int age?;
    @xmldata:Attribute
    string position?;
|};

@xmldata:Name {value: "Employee"}
@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Employee1 record {|
    @xmldata:Attribute
    int age?;
    @xmldata:Attribute
    string position?;
|};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type EmployeePerson record {|
    @xmldata:Attribute
    int id;
    @xmldata:Attribute
    string name;
|};
