import ballerina/data.xmldata;

public type Order record {|
    @xmldata:Sequence {minOccurs: 0, maxOccurs: 1}
    SequenceGroup sequenceGroup?;
|};

public type Payment record {|
    @xmldata:Choice {minOccurs: 0, maxOccurs: 1}
    ChoiceOption choiceOption?;
|};

public type SequenceGroup record {|
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string item;
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    int quantity;
|};

public type ChoiceOption record {|
    string creditCard?;
    int cash?;
|};
