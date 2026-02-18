import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type PersonBase record {|
    @xmldata:Sequence {minOccurs: 0, maxOccurs: 1}
    SequenceGroup3 sequenceGroup3?;
    @xmldata:Attribute
    int id;
    @xmldata:Attribute
    string name;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Employee record {|
    @xmldata:Sequence {minOccurs: 0, maxOccurs: 1}
    SequenceGroup3 sequenceGroup3?;
    @xmldata:Attribute
    int id;
    @xmldata:Attribute
    string name;
    @xmldata:Attribute
    int age?;
    @xmldata:Attribute
    string position?;
|};

@xmldata:Name {value: "Employee"}
@xmldata:Namespace {uri: "http://namespace.org/"}
public type Employee1 record {|
    @xmldata:Attribute
    int age?;
    @xmldata:Attribute
    string position?;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    string Street?;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 2}
    string City?;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 3}
    string State?;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 4}
    string PostalCode?;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Address record {|
    @xmldata:Sequence {minOccurs: 0, maxOccurs: 1}
    SequenceGroup sequenceGroup?;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup1 record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    Address Address?;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 2}
    string Phone?;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 3}
    string Email?;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type ContactInfo record {|
    @xmldata:Sequence {minOccurs: 0, maxOccurs: 1}
    SequenceGroup1 sequenceGroup1?;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup2 record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    string Name?;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 2}
    string Relation?;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 3}
    string Phone?;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type EmergencyContact record {|
    @xmldata:Sequence {minOccurs: 0, maxOccurs: 1}
    SequenceGroup2 sequenceGroup2?;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup3 record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    ContactInfo ContactInfo?;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 2}
    EmergencyContact EmergencyContact?;
|};
