import ballerina/data.xmldata;

public type Person record {
    @xmldata:Attribute
    int id;
    @xmldata:Attribute
    string name;
    @xmldata:Attribute
    int age?;
};
