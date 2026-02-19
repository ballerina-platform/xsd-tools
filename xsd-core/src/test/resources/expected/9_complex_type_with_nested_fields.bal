import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type World record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup4 sequenceGroup4;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string Landmark;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type City record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup1 record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    City City;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type State record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup1 sequenceGroup1;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup2 record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    State State;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Country record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup2 sequenceGroup2;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup3 record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    Country Country;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Continent record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup3 sequenceGroup3;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup4 record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    Continent Continent;
|};
