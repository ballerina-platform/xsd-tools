import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Document record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup3 sequenceGroup3;
|};

@xmldata:Name {value: "Document"}
@xmldata:Namespace {uri: "http://namespace.org/"}
public type Document1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup3 sequenceGroup3;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string header;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string title;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup1 record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string publisher;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string edition;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup2 record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string author;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string publishedDate;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 3}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    int pageCount;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 4}
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup1 sequenceGroup1;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup3 record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string body;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 3}
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup2 sequenceGroup2;
|};
