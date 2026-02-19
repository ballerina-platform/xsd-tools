import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type TPA_Extensions decimal;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type VehicleResRSAdditionalInfoType record {|
    @xmldata:Sequence {minOccurs: 0, maxOccurs: 1}
    SequenceGroup sequenceGroup?;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 0, maxOccurs: 1}
    TPA_Extensions TPA_Extensions;
|};
