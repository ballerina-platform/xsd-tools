import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://example.com/schema"}
public type AddressType record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {uri: "http://example.com/schema"}
public type PhoneNumberType string;

@xmldata:Namespace {uri: "http://example.com/schema"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string street;
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string city;
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 3}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string zipCode;
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 4}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string country;
|};

@xmldata:Namespace {uri: "http://example.com/schema"}
public type Employee record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup1 sequenceGroup1;
|};

@xmldata:Namespace {uri: "http://example.com/schema"}
public type SequenceGroup1 record {|
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string name;
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string email;
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 3}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    AddressType address;
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 4}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    PhoneNumberType phone;
|};
