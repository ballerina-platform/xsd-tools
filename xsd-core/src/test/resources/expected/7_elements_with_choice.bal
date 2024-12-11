import ballerina/data.xmldata;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type contact record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption choiceOption;
|};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type SequenceGroup record {|
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 1}
    string email?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 2}
    string phone?;
|};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ChoiceOption record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    string address?;
|};
