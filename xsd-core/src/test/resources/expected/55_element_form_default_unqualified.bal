import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://example.com/library"}
public type BookType record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {uri: "http://example.com/library"}
public type AuthorType record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup1 sequenceGroup1;
|};

@xmldata:Namespace {uri: "http://example.com/library"}
public type LibraryType record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 65535}
    SequenceGroup2[] sequenceGroup2;
|};

@xmldata:Namespace {uri: "http://example.com/library"}
public type Book record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {uri: "http://example.com/library"}
public type Author record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup1 sequenceGroup1;
|};

@xmldata:Namespace {uri: "http://example.com/library"}
public type Library record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 65535}
    SequenceGroup2[] sequenceGroup2;
|};

public type SequenceGroup record {|
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string title;
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string author;
    @xmldata:SequenceOrder {value: 3}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string isbn;
    @xmldata:SequenceOrder {value: 4}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    int year;
    @xmldata:SequenceOrder {value: 5}
    @xmldata:Element {minOccurs: 0, maxOccurs: 1}
    int pages?;
|};

public type SequenceGroup1 record {|
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string firstName;
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string lastName;
    @xmldata:SequenceOrder {value: 3}
    @xmldata:Element {minOccurs: 0, maxOccurs: 1}
    int birthYear?;
|};

public type SequenceGroup2 record {|
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string name;
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 1, maxOccurs: 65535}
    string[] book;
|};
