import ballerina/data.xmldata;

public type Decision record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption1 choiceOption1;
|};

public type ChoiceOption record {|
    string OptionA?;
    string OptionB?;
|};

public type Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption choiceOption;
|};

public type ChoiceOption1 record {|
    Choice Choice?;
    string Alternative?;
|};
