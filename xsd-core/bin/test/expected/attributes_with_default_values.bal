import ballerina/data.xmldata;

public type Add record {
    @xmldata:Attribute
    string published = "unknown";
    int intA;
    int intB;
};
