import ballerina/data.xmldata;

public type Vehicle record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption2 choiceOption2;
|};

public type ChoiceOption record {|
    string Sedan?;
    string SUV?;
|};

public type Car record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption choiceOption;
|};

public type ChoiceOption1 record {|
    string Mountain?;
    string Road?;
|};

public type Bike record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption1 choiceOption1;
|};

public type ChoiceOption2 record {|
    Car Car?;
    Bike Bike?;
|};
