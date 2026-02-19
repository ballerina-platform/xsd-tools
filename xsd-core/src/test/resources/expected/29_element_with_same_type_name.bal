import ballerina/data.xmldata;

@xmldata:Name {value: "Document"}
@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pacs.002.001.14"}
public type Document1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pacs.002.001.14"}
public type Document record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pacs.002.001.14"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pacs.002.001.14"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string FIToFIPmtStsRpt;
|};
