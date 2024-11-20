import ballerina/data.xmldata;

public type ActiveCurrencyAndAmount_SimpleType record {
    decimal ActiveCurrencyAndAmount_SimpleType;
    @xmldata:Attribute
    ActiveCurrencyCode Ccy;
};

public type ActiveCurrencyAndAmount record {
    ActiveCurrencyAndAmount_SimpleType ActiveCurrencyAndAmount_SimpleType;
};

public type ActiveCurrencyCode string;
