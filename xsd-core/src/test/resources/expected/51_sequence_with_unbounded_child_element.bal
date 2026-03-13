import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Order record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 65535}
    SequenceGroup[] sequenceGroup;
|};

@xmldata:Name {value: "Order"}
@xmldata:Namespace {uri: "http://namespace.org/"}
public type Order1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 65535}
    SequenceGroup[] sequenceGroup;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 65535}
    string[] item;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    int quantity;
|};
