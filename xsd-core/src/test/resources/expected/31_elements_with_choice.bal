import ballerina/data.xmldata;

@xmldata:Namespace {uri: ""}
public type Decision record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption1 choiceOption1;
|};

@xmldata:Namespace {uri: ""}
public type ChoiceOption record {|
    @xmldata:Namespace {uri: ""}
    string OptionA?;
    @xmldata:Namespace {uri: ""}
    string OptionB?;
|};

@xmldata:Namespace {uri: ""}
public type Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption choiceOption;
|};

@xmldata:Namespace {uri: ""}
public type ChoiceOption1 record {|
    @xmldata:Namespace {uri: ""}
    Choice Choice?;
    @xmldata:Namespace {uri: ""}
    string Alternative?;
|};
