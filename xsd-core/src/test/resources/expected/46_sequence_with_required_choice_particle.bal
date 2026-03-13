import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Order record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Name {value: "Order"}
@xmldata:Namespace {uri: "http://namespace.org/"}
public type Order1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type ChoiceOption record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    string onlinePayment?;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    string cashPayment?;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 0, maxOccurs: 1}
    string note?;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption choiceOption;
|};
