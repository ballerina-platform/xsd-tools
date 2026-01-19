import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://example.com/schema"}
public type Product record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
    @xmldata:Attribute
    string id;
    @xmldata:Attribute
    string version?;
    @xmldata:Attribute
    string timestamp?;
|};

@xmldata:Namespace {uri: "http://example.com/schema"}
public type Order record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup1 sequenceGroup;
    @xmldata:Attribute
    string id;
    @xmldata:Attribute
    string version?;
    @xmldata:Attribute
    string timestamp?;
    @xmldata:Attribute
    string status?;
|};

@xmldata:Namespace {uri: "http://example.com/schema"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 1}
    string name;
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 2}
    decimal price;
|};

@xmldata:Namespace {uri: "http://example.com/schema"}
public type SequenceGroup1 record {|
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 1}
    string orderNumber;
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 2}
    decimal total;
|};
