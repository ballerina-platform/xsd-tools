import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://example.com/schema"}
public type Employee record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {uri: "http://example.com/schema"}
public type AddressType record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup1 sequenceGroup;
|};

@xmldata:Namespace {uri: "http://example.com/schema"}
public type PhoneNumberType string;

@xmldata:Namespace {uri: "http://example.com/schema"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 1}
    string name;
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 2}
    string email;
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 3}
    AddressType address;
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 4}
    PhoneNumberType phone;
|};

@xmldata:Namespace {uri: "http://example.com/schema"}
public type SequenceGroup1 record {|
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 1}
    string street;
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 2}
    string city;
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 3}
    string zipCode;
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 4}
    string country;
|};
