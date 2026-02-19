import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://example.com/CalculatorService"}
public type AddRequest record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {uri: "http://example.com/CalculatorService"}
public type AddResponse record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup1 sequenceGroup1;
|};

@xmldata:Namespace {uri: "http://example.com/CalculatorService"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "http://example.com/CalculatorService"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    float a;
    @xmldata:Namespace {uri: "http://example.com/CalculatorService"}
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    float b;
|};

@xmldata:Namespace {uri: "http://example.com/CalculatorService"}
public type SequenceGroup1 record {|
    @xmldata:Namespace {uri: "http://example.com/CalculatorService"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    float result;
|};
