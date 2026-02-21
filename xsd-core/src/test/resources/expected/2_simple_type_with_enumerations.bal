import ballerina/data.xmldata;

@xmldata:Namespace {uri: "http://namespace.org/"}
public enum AddressType2Code {
    ADDR, PBOX, HOME, BIZZ, MLTO, DLVY
};

@xmldata:Namespace {uri: "http://namespace.org/"}
public type Address record {|
    string \#content?;
|};
