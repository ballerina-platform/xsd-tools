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
    int intA?;
    @xmldata:Namespace {uri: "http://tempuri.org/"}
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    int intB;
    @xmldata:Namespace {uri: "http://tempuri.org/"}
    @xmldata:SequenceOrder {value: 3}
    @xmldata:Element {minOccurs: 0, maxOccurs: 4294967295}
    int[] intC?;
    @xmldata:Namespace {uri: "http://tempuri.org/"}
    @xmldata:SequenceOrder {value: 4}
    @xmldata:Element {minOccurs: 1, maxOccurs: 4294967295}
    string[] stringA;
    @xmldata:Namespace {uri: "http://tempuri.org/"}
    @xmldata:SequenceOrder {value: 5}
    @xmldata:Element {minOccurs: 0, maxOccurs: 5}
    int[] intD?;
    @xmldata:Namespace {uri: "http://tempuri.org/"}
    @xmldata:SequenceOrder {value: 6}
    @xmldata:Element {minOccurs: 2, maxOccurs: 5}
    string[] stringB;
|};
