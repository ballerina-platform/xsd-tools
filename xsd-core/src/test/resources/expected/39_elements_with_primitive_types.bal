import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://example.com/types"}
public type normalizedString record {|
    string \#content;
|};

@xmldata:Namespace {uri: "http://example.com/types"}
public type token record {|
    string \#content;
|};

@xmldata:Namespace {uri: "http://example.com/types"}
public type NCName record {|
    string \#content;
|};

@xmldata:Namespace {uri: "http://example.com/types"}
public type QName record {|
    string \#content;
|};

@xmldata:Namespace {uri: "http://example.com/types"}
public type NOTATION record {|
    string \#content;
|};

@xmldata:Namespace {uri: "http://example.com/types"}
public type gDay record {|
    string \#content;
|};

@xmldata:Namespace {uri: "http://example.com/types"}
public type gMonth record {|
    string \#content;
|};

@xmldata:Namespace {uri: "http://example.com/types"}
public type hexBinary record {|
    string \#content;
|};

@xmldata:Namespace {uri: "http://example.com/types"}
public type booleanValue record {|
    boolean \#content;
|};
