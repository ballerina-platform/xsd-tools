import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Item record {|
    string \#content?;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Container record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 65535}
    SequenceGroup[] sequenceGroup;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 65535}
    Item[] Item;
|};
