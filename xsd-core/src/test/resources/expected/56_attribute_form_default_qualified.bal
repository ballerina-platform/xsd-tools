import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://example.com/"}
public type PersonType record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
    @xmldata:Namespace {uri: "http://example.com/"}
    @xmldata:Attribute
    string id;
    @xmldata:Namespace {uri: "http://example.com/"}
    @xmldata:Attribute
    string version?;
|};

@xmldata:Namespace {uri: "http://example.com/"}
public type AddressType record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup1 sequenceGroup1;
    @xmldata:Namespace {uri: "http://example.com/"}
    @xmldata:Attribute
    string country;
|};

@xmldata:Namespace {uri: "http://example.com/"}
public type Person record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
    @xmldata:Namespace {uri: "http://example.com/"}
    @xmldata:Attribute
    string id;
    @xmldata:Namespace {uri: "http://example.com/"}
    @xmldata:Attribute
    string version?;
|};

@xmldata:Namespace {uri: "http://example.com/"}
public type Address record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup1 sequenceGroup1;
    @xmldata:Namespace {uri: "http://example.com/"}
    @xmldata:Attribute
    string country;
|};

public type SequenceGroup record {|
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string firstName;
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string lastName;
    @xmldata:SequenceOrder {value: 3}
    @xmldata:Element {minOccurs: 0, maxOccurs: 1}
    int age?;
|};

public type SequenceGroup1 record {|
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string street;
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string city;
|};
