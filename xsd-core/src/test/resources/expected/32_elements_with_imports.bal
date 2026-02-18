import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://htng.org/PWSWG/2007/02/AsyncHeaders"}
public type Address record {|
    string \#content?;
|};

@xmldata:Namespace {uri: "http://htng.org/PWSWG/2007/02/AsyncHeaders"}
public type CorrelationID record {|
    string \#content?;
|};

@xmldata:Namespace {uri: "http://htng.org/PWSWG/2007/02/AsyncHeaders"}
public type RelatesToCorrelationID record {|
    string \#content?;
|};

@xmldata:Name {value: "ReplyTo"}
@xmldata:Namespace {uri: "http://htng.org/PWSWG/2007/02/AsyncHeaders"}
public type ReplyTo1 record {|
    @xmldata:Sequence {minOccurs: 0, maxOccurs: 1}
    SequenceGroup sequenceGroup?;
|};

@xmldata:Namespace {uri: "http://htng.org/PWSWG/2007/02/AsyncHeaders"}
public type ReplyTo record {|
    @xmldata:Sequence {minOccurs: 0, maxOccurs: 1}
    SequenceGroup sequenceGroup?;
|};

@xmldata:Namespace {uri: "http://htng.org/PWSWG/2007/02/AsyncHeaders"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "http://htng.org/PWSWG/2007/02/AsyncHeaders"}
    @xmldata:SequenceOrder {value: 1}
    Address Address;
|};
