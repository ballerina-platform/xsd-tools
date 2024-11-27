import ballerina/data.xmldata;

public type ActiveCurrencyAndAmount_SimpleType record {
    decimal \#content;
    @xmldata:Attribute
    ActiveCurrencyCode Ccy;
};

public type ActiveCurrencyAndAmount record {
    ActiveCurrencyAndAmount_SimpleType ActiveCurrencyAndAmount_SimpleType;
};

public type ActiveCurrencyCode record {
    string \#content;
};
