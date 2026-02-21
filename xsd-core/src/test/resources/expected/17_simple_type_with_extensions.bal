import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type ActiveCurrencyAndAmount_SimpleType decimal;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type ActiveCurrencyAndAmount record {|
    decimal \#content?;
    @xmldata:Attribute
    ActiveCurrencyCode Ccy;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type ActiveCurrencyCode string;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Root record {|
    @xmldata:Attribute
    ActiveCurrencyCode Ccy;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Root2 record {|
    @xmldata:Attribute
    ActiveCurrencyCode Ccy;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type SimpleType boolean;
