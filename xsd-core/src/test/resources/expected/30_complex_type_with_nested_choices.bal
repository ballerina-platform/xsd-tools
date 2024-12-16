import ballerina/data.xmldata;

@xmldata:Namespace {uri: ""}
public type Vehicle record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption2 choiceOption2;
|};

@xmldata:Namespace {uri: ""}
public type ChoiceOption record {|
    @xmldata:Namespace {uri: ""}
    string Sedan?;
    @xmldata:Namespace {uri: ""}
    string SUV?;
|};

@xmldata:Namespace {uri: ""}
public type Car record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption choiceOption;
|};

@xmldata:Namespace {uri: ""}
public type ChoiceOption1 record {|
    @xmldata:Namespace {uri: ""}
    string Mountain?;
    @xmldata:Namespace {uri: ""}
    string Road?;
|};

@xmldata:Namespace {uri: ""}
public type Bike record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption1 choiceOption1;
|};

@xmldata:Namespace {uri: ""}
public type ChoiceOption2 record {|
    @xmldata:Namespace {uri: ""}
    Car Car?;
    @xmldata:Namespace {uri: ""}
    Bike Bike?;
|};
