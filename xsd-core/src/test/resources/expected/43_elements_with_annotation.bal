import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://example.com/schema"}
public type Person record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {uri: "http://example.com/schema"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 1}
    string name;
    @xmldata:Namespace {uri: "http://example.com/schema"}
    @xmldata:SequenceOrder {value: 2}
    int age;
|};

@xmldata:Namespace {uri: "http://example.com/schema"}
public enum Status {
}
