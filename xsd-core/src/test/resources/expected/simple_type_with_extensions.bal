import ballerina/data.xmldata;

public type ActiveCurrencyAndAmount_SimpleType record {
    decimal \#content;
};

public type ActiveCurrencyAndAmount record {
    ActiveCurrencyAndAmount_SimpleType ActiveCurrencyAndAmount_SimpleType;
    @xmldata:Attribute
    ActiveCurrencyCode Ccy;
};

public type ActiveCurrencyCode record {
    string \#content;
};
