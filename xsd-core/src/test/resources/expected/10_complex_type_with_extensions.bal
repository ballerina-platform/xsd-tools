import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type PersonBase record {|
    @xmldata:Attribute
    int id;
    @xmldata:Attribute
    string name;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
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
@xmldata:Namespace {uri: "http://namespace.org/"}
public type Employee1 record {|
    @xmldata:Attribute
    int age?;
    @xmldata:Attribute
    string position?;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type EmployeePerson record {|
    @xmldata:Attribute
    int id;
    @xmldata:Attribute
    string name;
|};
