import ballerina/data.xmldata;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Vehicle record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption2 choiceOption2;
|};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ChoiceOption record {|
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    string Sedan?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    string SUV?;
|};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Car record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption choiceOption;
|};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ChoiceOption1 record {|
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    string Mountain?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    string Road?;
|};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Bike record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption1 choiceOption1;
|};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ChoiceOption2 record {|
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Car Car?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Bike Bike?;
|};
