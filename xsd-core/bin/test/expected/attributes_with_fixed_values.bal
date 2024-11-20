import ballerina/data.xmldata;

public type Add record {
    @xmldata:Attribute
    10 value;
    int intA;
    int intB;
};
