import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Basket record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
    @xmldata:Attribute
    int count?;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Order record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup1 sequenceGroup1;
    @xmldata:Attribute
    int count;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string item;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup1 record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string id;
|};
