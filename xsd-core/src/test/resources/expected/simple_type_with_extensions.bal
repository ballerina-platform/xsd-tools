import ballerina/data.xmldata;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ActiveCurrencyAndAmount_SimpleType record {
    decimal \#content;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ActiveCurrencyAndAmount record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ActiveCurrencyAndAmount_SimpleType ActiveCurrencyAndAmount_SimpleType;
    @xmldata:Attribute
    ActiveCurrencyCode Ccy;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ActiveCurrencyCode record {
    string \#content;
};
