import ballerina/data.xmldata;

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type Add record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type SequenceGroup record {|
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 1}
    int intA?;
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 2}
    int intB;
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 3}
    int[] intC?;
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 4}
    string[] stringA;
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 5}
    int[] intD?;
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 6}
    string[] stringB;
|};
