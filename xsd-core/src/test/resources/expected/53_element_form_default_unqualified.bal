import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://example.com/"}
public type Person record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {uri: "http://example.com/"}
public type PersonElement record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

public type SequenceGroup record {|
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string name;
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    int age;
|};
