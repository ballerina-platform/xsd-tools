import ballerina/data.xmldata;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type AccountIdentification4Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    IBAN2007Identifier IBAN?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    GenericAccountIdentification1 Othr?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type AccountReportingRequestV07 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    GroupHeader117 GrpHdr;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ReportingRequest7[] RptgReq;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    SupplementaryData1[] SplmtryData?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type AccountSchemeName1Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ExternalAccountIdentification1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ActiveOrHistoricCurrencyAndAmount_SimpleType decimal;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ActiveOrHistoricCurrencyAndAmount record {
    decimal \#content;
    @xmldata:Attribute
    ActiveOrHistoricCurrencyCode Ccy;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ActiveOrHistoricCurrencyCode string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public enum AddressType2Code {
    ADDR, PBOX, HOME, BIZZ, MLTO, DLVY
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type AddressType3Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    AddressType2Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    GenericIdentification30 Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type AnyBICDec2014Identifier string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type BICFIDec2014Identifier string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type BalanceSubType1Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ExternalBalanceSubType1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type BalanceType10Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ExternalBalanceType1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type BalanceType13 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    BalanceType10Choice CdOrPrtry;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    BalanceSubType1Choice SubTp?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type BranchAndFinancialInstitutionIdentification8 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    FinancialInstitutionIdentification23 FinInstnId;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    BranchData5 BrnchId?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type BranchData5 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Id?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    LEIIdentifier LEI?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max140Text Nm?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PostalAddress27 PstlAdr?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type CashAccount40 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    AccountIdentification4Choice Id?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CashAccountType2Choice Tp?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ActiveOrHistoricCurrencyCode Ccy?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max70Text Nm?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ProxyAccountIdentification1 Prxy?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type CashAccountType2Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ExternalCashAccountType1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ClearingSystemIdentification2Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ExternalClearingSystemIdentification1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ClearingSystemMemberIdentification2 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ClearingSystemIdentification2Choice ClrSysId?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text MmbId;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Contact13 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    NamePrefix2Code NmPrfx?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max140Text Nm?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PhoneNumber PhneNb?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PhoneNumber MobNb?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PhoneNumber FaxNb?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max2048Text URLAdr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max256Text EmailAdr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text EmailPurp?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text JobTitl?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Rspnsblty?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max70Text Dept?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    OtherContact1[] Othr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PreferredContactMethod2Code PrefrdMtd?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type CountryCode string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public enum CreditDebitCode {
    CRDT, DBIT
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type DateAndPlaceOfBirth1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ISODate BirthDt;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text PrvcOfBirth?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text CityOfBirth;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CountryCode CtryOfBirth;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type DatePeriod3 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ISODate FrDt;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ISODate ToDt?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Document record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    AccountReportingRequestV07 AcctRptgReq;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type EntryStatus1Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ExternalEntryStatus1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Exact4AlphaNumericText string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalAccountIdentification1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalBalanceSubType1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalBalanceType1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalCashAccountType1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalClearingSystemIdentification1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalEntryStatus1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalFinancialInstitutionIdentification1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalOrganisationIdentification1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalPersonIdentification1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalProxyAccountType1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type FinancialIdentificationSchemeName1Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ExternalFinancialInstitutionIdentification1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type FinancialInstitutionIdentification23 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    BICFIDec2014Identifier BICFI?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ClearingSystemMemberIdentification2 ClrSysMmbId?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    LEIIdentifier LEI?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max140Text Nm?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PostalAddress27 PstlAdr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    GenericFinancialIdentification1 Othr?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public enum FloorLimitType1Code {
    CRED, DEBT, BOTH
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type GenericAccountIdentification1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max34Text Id;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    AccountSchemeName1Choice SchmeNm?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Issr?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type GenericFinancialIdentification1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Id;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    FinancialIdentificationSchemeName1Choice SchmeNm?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Issr?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type GenericIdentification30 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Exact4AlphaNumericText Id;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Issr;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text SchmeNm?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type GenericOrganisationIdentification3 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max256Text Id;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    OrganisationIdentificationSchemeName1Choice SchmeNm?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Issr?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type GenericPersonIdentification2 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max256Text Id;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PersonIdentificationSchemeName1Choice SchmeNm?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Issr?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type GroupHeader117 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text MsgId;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ISODateTime CreDtTm;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Party50Choice MsgSndr?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type IBAN2007Identifier string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ISODate string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ISODateTime string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ISOTime string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type LEIIdentifier string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Limit2 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ActiveOrHistoricCurrencyAndAmount Amt;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    FloorLimitType1Code CdtDbtInd;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Max128Text string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Max140Text string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Max16Text string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Max2048Text string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Max256Text string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Max34Text string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Max350Text string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Max35Text string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Max4Text string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Max70Text string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public enum NamePrefix2Code {
    DOCT, MADM, MISS, MIST, MIKS
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type OrganisationIdentification39 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    AnyBICDec2014Identifier AnyBIC?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    LEIIdentifier LEI?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    GenericOrganisationIdentification3[] Othr?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type OrganisationIdentificationSchemeName1Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ExternalOrganisationIdentification1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type OtherContact1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max4Text ChanlTp;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max128Text Id?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Party50Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PartyIdentification272 Pty?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    BranchAndFinancialInstitutionIdentification8 Agt?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Party52Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    OrganisationIdentification39 OrgId?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PersonIdentification18 PrvtId?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type PartyIdentification272 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max140Text Nm?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PostalAddress27 PstlAdr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Party52Choice Id?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CountryCode CtryOfRes?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Contact13 CtctDtls?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type PersonIdentification18 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    DateAndPlaceOfBirth1 DtAndPlcOfBirth?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    GenericPersonIdentification2[] Othr?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type PersonIdentificationSchemeName1Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ExternalPersonIdentification1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type PhoneNumber string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type PostalAddress27 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    AddressType3Choice AdrTp?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max140Text CareOf?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max70Text Dept?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max70Text SubDept?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max140Text StrtNm?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max16Text BldgNb?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max140Text BldgNm?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max70Text Flr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max16Text UnitNb?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max16Text PstBx?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max70Text Room?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max16Text PstCd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max140Text TwnNm?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max140Text TwnLctnNm?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max140Text DstrctNm?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text CtrySubDvsn?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CountryCode Ctry?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max70Text[] AdrLine?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public enum PreferredContactMethod2Code {
    MAIL, FAXX, LETT, CELL, ONLI, PHON
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ProxyAccountIdentification1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ProxyAccountType1Choice Tp?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max2048Text Id;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ProxyAccountType1Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ExternalProxyAccountType1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public enum QueryType3Code {
    ALLL, CHNG, MODF
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ReportingPeriod5 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    DatePeriod3 FrToDt;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    TimePeriodDetails1 FrToTm?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    QueryType3Code Tp;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ReportingRequest7 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Id?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text ReqdMsgNmId;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CashAccount40 Acct?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Party50Choice AcctOwnr;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    BranchAndFinancialInstitutionIdentification8 AcctSvcr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ReportingPeriod5 RptgPrd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    SequenceRange1Choice RptgSeq?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    TransactionType2 ReqdTxTp?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    BalanceType13[] ReqdBalTp?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type SequenceRange1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text FrSeq;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text ToSeq;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type SequenceRange1Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text FrSeq?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text ToSeq?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    SequenceRange1 FrToSeq?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text EQSeq?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text NEQSeq?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type SupplementaryData1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max350Text PlcAndNm?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    SupplementaryDataEnvelope1 Envlp;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type SupplementaryDataEnvelope1 record {
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type TimePeriodDetails1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ISOTime FrTm;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ISOTime ToTm?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type TransactionType2 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    EntryStatus1Choice Sts;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CreditDebitCode CdtDbtInd;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Limit2[] FlrLmt?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Document1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    AccountReportingRequestV07 AcctRptgReq;
};
