import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Note record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
    @xmldata:Namespace {uri: "http://external.org/"}
    @xmldata:Attribute
    string lang;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string text;
|};
