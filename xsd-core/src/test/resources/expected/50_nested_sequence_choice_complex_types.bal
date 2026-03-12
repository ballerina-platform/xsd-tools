import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Address record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type ContactInfo record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup2 sequenceGroup2;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Order record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup4 sequenceGroup4;
|};

@xmldata:Name {value: "Order"}
@xmldata:Namespace {uri: "http://namespace.org/"}
public type Order1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup4 sequenceGroup4;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string street;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string city;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 3}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string zipCode;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup1 record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string email;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string phone;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup2 record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup1 sequenceGroup1;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    Address address;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup3 record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string itemName;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    int quantity;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 3}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    decimal price;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup4 record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string orderId;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    ContactInfo customer;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 3}
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup3 sequenceGroup3;
|};
