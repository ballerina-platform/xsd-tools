import ballerina/data.xmldata;

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type Add record {|
    @xmldata:Attribute
    10 value;
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type SequenceGroup record {|
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 1}
    int intA;
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 2}
    int intB;
|};
