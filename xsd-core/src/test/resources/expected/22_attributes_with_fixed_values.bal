import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://tempuri.org/"}
public type Add record {|
    @xmldata:Attribute
    10 value?;
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {uri: "http://tempuri.org/"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "http://tempuri.org/"}
    @xmldata:SequenceOrder {value: 1}
    int intA;
    @xmldata:Namespace {uri: "http://tempuri.org/"}
    @xmldata:SequenceOrder {value: 2}
    int intB;
|};
