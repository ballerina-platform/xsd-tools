import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://namespace.org/"}
public type TokenList record {|
    string \#content;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type EntityRef record {|
    string \#content;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type EntityRefs record {|
    string \#content;
|};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type NameVal record {|
    string \#content;
|};
