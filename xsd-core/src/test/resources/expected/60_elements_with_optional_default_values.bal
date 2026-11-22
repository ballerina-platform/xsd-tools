import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://tempuri.org/"}
public type Add record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {uri: "http://tempuri.org/"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "http://tempuri.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 0, maxOccurs: 1}
    string operation?;
    @xmldata:Namespace {uri: "http://tempuri.org/"}
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 0, maxOccurs: 1}
    int priority?;
    @xmldata:Namespace {uri: "http://tempuri.org/"}
    @xmldata:SequenceOrder {value: 3}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string requiredWithDefault = "hello";
|};
