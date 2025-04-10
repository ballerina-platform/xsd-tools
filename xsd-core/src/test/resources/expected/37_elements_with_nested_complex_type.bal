import ballerina/data.xmldata;

public type Person record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

public type SequenceGroup record {|
    @xmldata:SequenceOrder {value: 1}
    string Name;
    @xmldata:SequenceOrder {value: 2}
    int Age;
    @xmldata:SequenceOrder {value: 3}
    string Email;
|};
