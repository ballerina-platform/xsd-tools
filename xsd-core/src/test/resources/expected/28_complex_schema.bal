import ballerina/data.xmldata;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type AccountIdentification4Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption choiceOption;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type AccountReportingRequestV07 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type AccountSchemeName1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption1 choiceOption1;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ActiveOrHistoricCurrencyAndAmount_SimpleType decimal;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ActiveOrHistoricCurrencyAndAmount record {|
    decimal \#content;
    @xmldata:Attribute
    ActiveOrHistoricCurrencyCode Ccy;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ActiveOrHistoricCurrencyCode string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public enum AddressType2Code {
    ADDR, PBOX, HOME, BIZZ, MLTO, DLVY
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type AddressType3Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption2 choiceOption2;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type AnyBICDec2014Identifier string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type BICFIDec2014Identifier string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type BalanceSubType1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption3 choiceOption3;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type BalanceType10Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption4 choiceOption4;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type BalanceType13 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup1 sequenceGroup1;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type BranchAndFinancialInstitutionIdentification8 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup2 sequenceGroup2;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type BranchData5 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup3 sequenceGroup3;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type CashAccount40 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup4 sequenceGroup4;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type CashAccountType2Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption5 choiceOption5;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ClearingSystemIdentification2Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption6 choiceOption6;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ClearingSystemMemberIdentification2 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup5 sequenceGroup5;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type Contact13 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup6 sequenceGroup6;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type CountryCode string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public enum CreditDebitCode {
    CRDT, DBIT
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type DateAndPlaceOfBirth1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup7 sequenceGroup7;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type DatePeriod3 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup8 sequenceGroup8;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type Document record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup9 sequenceGroup9;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type EntryStatus1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption7 choiceOption7;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type Exact4AlphaNumericText string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ExternalAccountIdentification1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ExternalBalanceSubType1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ExternalBalanceType1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ExternalCashAccountType1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ExternalClearingSystemIdentification1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ExternalEntryStatus1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ExternalFinancialInstitutionIdentification1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ExternalOrganisationIdentification1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ExternalPersonIdentification1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ExternalProxyAccountType1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type FinancialIdentificationSchemeName1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption8 choiceOption8;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type FinancialInstitutionIdentification23 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup10 sequenceGroup10;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public enum FloorLimitType1Code {
    CRED, DEBT, BOTH
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type GenericAccountIdentification1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup11 sequenceGroup11;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type GenericFinancialIdentification1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup12 sequenceGroup12;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type GenericIdentification30 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup13 sequenceGroup13;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type GenericOrganisationIdentification3 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup14 sequenceGroup14;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type GenericPersonIdentification2 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup15 sequenceGroup15;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type GroupHeader117 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup16 sequenceGroup16;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type IBAN2007Identifier string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ISODate string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ISODateTime string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ISOTime string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type LEIIdentifier string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type Limit2 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup17 sequenceGroup17;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type Max128Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type Max140Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type Max16Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type Max2048Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type Max256Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type Max34Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type Max350Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type Max35Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type Max4Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type Max70Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public enum NamePrefix2Code {
    DOCT, MADM, MISS, MIST, MIKS
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type OrganisationIdentification39 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup18 sequenceGroup18;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type OrganisationIdentificationSchemeName1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption9 choiceOption9;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type OtherContact1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup19 sequenceGroup19;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type Party50Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption10 choiceOption10;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type Party52Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption11 choiceOption11;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type PartyIdentification272 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup20 sequenceGroup20;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type PersonIdentification18 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup21 sequenceGroup21;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type PersonIdentificationSchemeName1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption12 choiceOption12;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type PhoneNumber string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type PostalAddress27 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup22 sequenceGroup22;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public enum PreferredContactMethod2Code {
    MAIL, FAXX, LETT, CELL, ONLI, PHON
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ProxyAccountIdentification1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup23 sequenceGroup23;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ProxyAccountType1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption13 choiceOption13;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public enum QueryType3Code {
    ALLL, CHNG, MODF
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ReportingPeriod5 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup24 sequenceGroup24;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ReportingRequest7 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup25 sequenceGroup25;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceRange1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup26 sequenceGroup26;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceRange1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption14 choiceOption14;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SupplementaryData1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup27 sequenceGroup27;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SupplementaryDataEnvelope1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup28 sequenceGroup28;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type TimePeriodDetails1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup29 sequenceGroup29;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type TransactionType2 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup30 sequenceGroup30;
|};

@xmldata:Name {value: "Document"}
@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type Document1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup9 sequenceGroup9;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ChoiceOption record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    IBAN2007Identifier IBAN?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    GenericAccountIdentification1 Othr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    GroupHeader117 GrpHdr;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    ReportingRequest7[] RptgReq;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 3}
    SupplementaryData1[] SplmtryData?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ChoiceOption1 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    ExternalAccountIdentification1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ChoiceOption2 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    AddressType2Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    GenericIdentification30 Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ChoiceOption3 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    ExternalBalanceSubType1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ChoiceOption4 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    ExternalBalanceType1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup1 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    BalanceType10Choice CdOrPrtry;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    BalanceSubType1Choice SubTp?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup2 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    FinancialInstitutionIdentification23 FinInstnId;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    BranchData5 BrnchId?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup3 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text Id?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    LEIIdentifier LEI?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 3}
    Max140Text Nm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 4}
    PostalAddress27 PstlAdr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup4 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    AccountIdentification4Choice Id?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    CashAccountType2Choice Tp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 3}
    ActiveOrHistoricCurrencyCode Ccy?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 4}
    Max70Text Nm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 5}
    ProxyAccountIdentification1 Prxy?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ChoiceOption5 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    ExternalCashAccountType1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ChoiceOption6 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    ExternalClearingSystemIdentification1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup5 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    ClearingSystemIdentification2Choice ClrSysId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text MmbId;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup6 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    NamePrefix2Code NmPrfx?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    Max140Text Nm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 3}
    PhoneNumber PhneNb?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 4}
    PhoneNumber MobNb?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 5}
    PhoneNumber FaxNb?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 6}
    Max2048Text URLAdr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 7}
    Max256Text EmailAdr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 8}
    Max35Text EmailPurp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 9}
    Max35Text JobTitl?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 10}
    Max35Text Rspnsblty?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 11}
    Max70Text Dept?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 12}
    OtherContact1[] Othr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 13}
    PreferredContactMethod2Code PrefrdMtd?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup7 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    ISODate BirthDt;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text PrvcOfBirth?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 3}
    Max35Text CityOfBirth;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 4}
    CountryCode CtryOfBirth;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup8 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    ISODate FrDt;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    ISODate ToDt?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup9 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    AccountReportingRequestV07 AcctRptgReq;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ChoiceOption7 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    ExternalEntryStatus1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ChoiceOption8 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    ExternalFinancialInstitutionIdentification1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup10 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    BICFIDec2014Identifier BICFI?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    ClearingSystemMemberIdentification2 ClrSysMmbId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 3}
    LEIIdentifier LEI?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 4}
    Max140Text Nm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 5}
    PostalAddress27 PstlAdr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 6}
    GenericFinancialIdentification1 Othr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup11 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Max34Text Id;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    AccountSchemeName1Choice SchmeNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 3}
    Max35Text Issr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup12 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text Id;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    FinancialIdentificationSchemeName1Choice SchmeNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 3}
    Max35Text Issr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup13 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Exact4AlphaNumericText Id;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text Issr;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 3}
    Max35Text SchmeNm?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup14 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Max256Text Id;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    OrganisationIdentificationSchemeName1Choice SchmeNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 3}
    Max35Text Issr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup15 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Max256Text Id;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    PersonIdentificationSchemeName1Choice SchmeNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 3}
    Max35Text Issr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup16 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text MsgId;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    ISODateTime CreDtTm;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 3}
    Party50Choice MsgSndr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup17 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    ActiveOrHistoricCurrencyAndAmount Amt;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    FloorLimitType1Code CdtDbtInd;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup18 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    AnyBICDec2014Identifier AnyBIC?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    LEIIdentifier LEI?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 3}
    GenericOrganisationIdentification3[] Othr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ChoiceOption9 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    ExternalOrganisationIdentification1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup19 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Max4Text ChanlTp;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    Max128Text Id?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ChoiceOption10 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    PartyIdentification272 Pty?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    BranchAndFinancialInstitutionIdentification8 Agt?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ChoiceOption11 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    OrganisationIdentification39 OrgId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    PersonIdentification18 PrvtId?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup20 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Max140Text Nm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    PostalAddress27 PstlAdr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 3}
    Party52Choice Id?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 4}
    CountryCode CtryOfRes?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 5}
    Contact13 CtctDtls?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup21 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    DateAndPlaceOfBirth1 DtAndPlcOfBirth?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    GenericPersonIdentification2[] Othr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ChoiceOption12 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    ExternalPersonIdentification1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup22 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    AddressType3Choice AdrTp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    Max140Text CareOf?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 3}
    Max70Text Dept?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 4}
    Max70Text SubDept?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 5}
    Max140Text StrtNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 6}
    Max16Text BldgNb?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 7}
    Max140Text BldgNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 8}
    Max70Text Flr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 9}
    Max16Text UnitNb?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 10}
    Max16Text PstBx?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 11}
    Max70Text Room?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 12}
    Max16Text PstCd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 13}
    Max140Text TwnNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 14}
    Max140Text TwnLctnNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 15}
    Max140Text DstrctNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 16}
    Max35Text CtrySubDvsn?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 17}
    CountryCode Ctry?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 18}
    Max70Text[] AdrLine?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup23 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    ProxyAccountType1Choice Tp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    Max2048Text Id;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ChoiceOption13 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    ExternalProxyAccountType1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup24 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    DatePeriod3 FrToDt;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    TimePeriodDetails1 FrToTm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 3}
    QueryType3Code Tp;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup25 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text Id?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text ReqdMsgNmId;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 3}
    CashAccount40 Acct?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 4}
    Party50Choice AcctOwnr;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 5}
    BranchAndFinancialInstitutionIdentification8 AcctSvcr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 6}
    ReportingPeriod5 RptgPrd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 7}
    SequenceRange1Choice RptgSeq?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 8}
    TransactionType2 ReqdTxTp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 9}
    BalanceType13[] ReqdBalTp?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup26 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text FrSeq;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text ToSeq;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type ChoiceOption14 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    Max35Text FrSeq?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    Max35Text ToSeq?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    SequenceRange1 FrToSeq?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    Max35Text EQSeq?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    Max35Text NEQSeq?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup27 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Max350Text PlcAndNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    SupplementaryDataEnvelope1 Envlp;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup28 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    anydata anyElement;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup29 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    ISOTime FrTm;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    ISOTime ToTm?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
public type SequenceGroup30 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 1}
    EntryStatus1Choice Sts;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 2}
    CreditDebitCode CdtDbtInd;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.060.001.07"}
    @xmldata:SequenceOrder {value: 3}
    Limit2[] FlrLmt?;
|};
