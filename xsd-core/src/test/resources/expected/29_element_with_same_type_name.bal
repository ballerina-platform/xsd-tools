import ballerina/data.xmldata;

@xmldata:Name {value: "Document"}
@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Document1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type Document record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type SequenceGroup record {|
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 1}
    string FIToFIPmtStsRpt;
|};
