import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://www.opentravel.org/OTA/2003/05"}
public type POS_Type record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {uri: "http://www.opentravel.org/OTA/2003/05"}
public type HotelReservationType record {|
    @xmldata:Sequence {minOccurs: 0, maxOccurs: 1}
    SequenceGroup1 sequenceGroup1?;
|};

@xmldata:Namespace {uri: "http://www.opentravel.org/OTA/2003/05"}
public type HotelReservationsType record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 65535}
    SequenceGroup2[] sequenceGroup2;
|};

@xmldata:Name {value: "OTA_HotelResNotifRQ"}
@xmldata:Namespace {uri: "http://www.opentravel.org/OTA/2003/05"}
public type OTA_HotelResNotifRQ1 record {|
    @xmldata:Sequence {minOccurs: 0, maxOccurs: 1}
    SequenceGroup3 sequenceGroup3?;
|};

@xmldata:Namespace {uri: "http://www.opentravel.org/OTA/2003/05"}
public type OTA_HotelResNotifRQ record {|
    @xmldata:Sequence {minOccurs: 0, maxOccurs: 1}
    SequenceGroup3 sequenceGroup3?;
|};

@xmldata:Namespace {uri: "http://www.opentravel.org/OTA/2003/05"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "http://www.opentravel.org/OTA/2003/05"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 1}
    string Source;
|};

@xmldata:Namespace {uri: "http://www.opentravel.org/OTA/2003/05"}
public type SequenceGroup1 record {|
    @xmldata:Namespace {uri: "http://www.opentravel.org/OTA/2003/05"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 0, maxOccurs: 1}
    string ResGlobalInfo?;
|};

@xmldata:Namespace {uri: "http://www.opentravel.org/OTA/2003/05"}
public type SequenceGroup2 record {|
    @xmldata:Namespace {uri: "http://www.opentravel.org/OTA/2003/05"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 1, maxOccurs: 65535}
    HotelReservationType[] HotelReservation;
|};

@xmldata:Namespace {uri: "http://www.opentravel.org/OTA/2003/05"}
public type SequenceGroup3 record {|
    @xmldata:Namespace {uri: "http://www.opentravel.org/OTA/2003/05"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Element {minOccurs: 0, maxOccurs: 1}
    POS_Type POS?;
    @xmldata:Namespace {uri: "http://www.opentravel.org/OTA/2003/05"}
    @xmldata:SequenceOrder {value: 2}
    @xmldata:Element {minOccurs: 0, maxOccurs: 1}
    HotelReservationsType HotelReservations?;
|};
