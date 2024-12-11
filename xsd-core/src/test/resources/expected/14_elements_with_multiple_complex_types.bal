import ballerina/data.xmldata;

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type Add record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type AddResponse record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup1 sequenceGroup1;
|};

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type Subtract record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup2 sequenceGroup2;
|};

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type SubtractResponse record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup3 sequenceGroup3;
|};

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type Multiply record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup4 sequenceGroup4;
|};

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type MultiplyResponse record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup5 sequenceGroup5;
|};

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type Divide record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup6 sequenceGroup6;
|};

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type DivideResponse record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup7 sequenceGroup7;
|};

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type SequenceGroup record {|
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 1}
    int intA;
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 2}
    int intB;
|};

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type SequenceGroup1 record {|
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 1}
    int AddResult;
|};

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type SequenceGroup2 record {|
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 1}
    int intA;
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 2}
    int intB;
|};

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type SequenceGroup3 record {|
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 1}
    int SubtractResult;
|};

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type SequenceGroup4 record {|
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 1}
    int intA;
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 2}
    int intB;
|};

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type SequenceGroup5 record {|
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 1}
    int MultiplyResult;
|};

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type SequenceGroup6 record {|
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 1}
    int intA;
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 2}
    int intB;
|};

@xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
public type SequenceGroup7 record {|
    @xmldata:Namespace {prefix: "s", uri: "http://www.w3.org/2001/XMLSchema"}
    @xmldata:SequenceOrder {value: 1}
    int DivideResult?;
|};
