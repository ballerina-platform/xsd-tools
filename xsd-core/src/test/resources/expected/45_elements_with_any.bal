import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://example.com/schema"}
public type ExtensibleType record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {uri: "http://example.com/schema"}
public type MixedContent record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup1 sequenceGroup1;
|};

@xmldata:Namespace {uri: "http://example.com/schema"}
public type OpenEnded record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup2 sequenceGroup2;
|};

@xmldata:Namespace {uri: "http://example.com/schema"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 1}
    string fixedField;
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 2}
    anydata[]? anyElement;
|};

@xmldata:Namespace {uri: "http://example.com/schema"}
public type SequenceGroup1 record {|
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 1}
    string header;
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 2}
    xml? anyElement;
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 3}
    string footer;
|};

@xmldata:Namespace {uri: "http://example.com/schema"}
public type SequenceGroup2 record {|
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 1}
    xml anyElement;
|};
