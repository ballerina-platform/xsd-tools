import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Payment record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption2 choiceOption2;
|};

@xmldata:Name {value: "Payment"}
@xmldata:Namespace {uri: "http://namespace.org/"}
public type Payment1 record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption2 choiceOption2;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type ChoiceOption record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    string applePay?;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    string googlePay?;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type ChoiceOption1 record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    string bankTransfer?;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    string paypal?;
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption choiceOption;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type ChoiceOption2 record {|
    @xmldata:Namespace {uri: "http://namespace.org/"}
    string creditCard?;
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption1 choiceOption1;
    @xmldata:Namespace {uri: "http://namespace.org/"}
    string cash?;
|};
