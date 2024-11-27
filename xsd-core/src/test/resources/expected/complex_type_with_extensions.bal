import ballerina/data.xmldata;

public type PersonBase record {
    @xmldata:Attribute
    int id;
    @xmldata:Attribute
    string name;
    @xmldata:Attribute
    int age?;
    @xmldata:Attribute
    string position?;
};

public type Employee record {
    PersonBase PersonBase;
};

public type Employee123 record {
    Employee \#content;
};
