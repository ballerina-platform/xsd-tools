import ballerina/data.xmldata;

public type Document123 record {
    Document \#content;
};

public type AccountIdentification4Choice record {
    IBAN2007Identifier IBAN?;
    GenericAccountIdentification1 Othr?;
};

public type AccountReportingRequestV07 record {
    GroupHeader117 GrpHdr;
    ReportingRequest7[] RptgReq;
    SupplementaryData1[] SplmtryData?;
};

public type AccountSchemeName1Choice record {
    ExternalAccountIdentification1Code Cd?;
    Max35Text Prtry?;
};

public type ActiveOrHistoricCurrencyAndAmount_SimpleType record {
    decimal \#content;
};

public type ActiveOrHistoricCurrencyAndAmount record {
    ActiveOrHistoricCurrencyAndAmount_SimpleType ActiveOrHistoricCurrencyAndAmount_SimpleType;
    @xmldata:Attribute
    ActiveOrHistoricCurrencyCode Ccy;
};

public type ActiveOrHistoricCurrencyCode record {
    string \#content;
};

public enum AddressType2Code {
    ADDR, PBOX, HOME, BIZZ, MLTO, DLVY
};

public type AddressType3Choice record {
    AddressType2Code Cd?;
    GenericIdentification30 Prtry?;
};

public type AnyBICDec2014Identifier record {
    string \#content;
};

public type BICFIDec2014Identifier record {
    string \#content;
};

public type BalanceSubType1Choice record {
    ExternalBalanceSubType1Code Cd?;
    Max35Text Prtry?;
};

public type BalanceType10Choice record {
    ExternalBalanceType1Code Cd?;
    Max35Text Prtry?;
};

public type BalanceType13 record {
    BalanceType10Choice CdOrPrtry;
    BalanceSubType1Choice SubTp?;
};

public type BranchAndFinancialInstitutionIdentification8 record {
    FinancialInstitutionIdentification23 FinInstnId;
    BranchData5 BrnchId?;
};

public type BranchData5 record {
    Max35Text Id?;
    LEIIdentifier LEI?;
    Max140Text Nm?;
    PostalAddress27 PstlAdr?;
};

public type CashAccount40 record {
    AccountIdentification4Choice Id?;
    CashAccountType2Choice Tp?;
    ActiveOrHistoricCurrencyCode Ccy?;
    Max70Text Nm?;
    ProxyAccountIdentification1 Prxy?;
};

public type CashAccountType2Choice record {
    ExternalCashAccountType1Code Cd?;
    Max35Text Prtry?;
};

public type ClearingSystemIdentification2Choice record {
    ExternalClearingSystemIdentification1Code Cd?;
    Max35Text Prtry?;
};

public type ClearingSystemMemberIdentification2 record {
    ClearingSystemIdentification2Choice ClrSysId?;
    Max35Text MmbId;
};

public type Contact13 record {
    NamePrefix2Code NmPrfx?;
    Max140Text Nm?;
    PhoneNumber PhneNb?;
    PhoneNumber MobNb?;
    PhoneNumber FaxNb?;
    Max2048Text URLAdr?;
    Max256Text EmailAdr?;
    Max35Text EmailPurp?;
    Max35Text JobTitl?;
    Max35Text Rspnsblty?;
    Max70Text Dept?;
    OtherContact1[] Othr?;
    PreferredContactMethod2Code PrefrdMtd?;
};

public type CountryCode record {
    string \#content;
};

public enum CreditDebitCode {
    CRDT, DBIT
};

public type DateAndPlaceOfBirth1 record {
    ISODate BirthDt;
    Max35Text PrvcOfBirth?;
    Max35Text CityOfBirth;
    CountryCode CtryOfBirth;
};

public type DatePeriod3 record {
    ISODate FrDt;
    ISODate ToDt?;
};

public type Document record {
    AccountReportingRequestV07 AcctRptgReq;
};

public type EntryStatus1Choice record {
    ExternalEntryStatus1Code Cd?;
    Max35Text Prtry?;
};

public type Exact4AlphaNumericText record {
    string \#content;
};

public type ExternalAccountIdentification1Code record {
    string \#content;
};

public type ExternalBalanceSubType1Code record {
    string \#content;
};

public type ExternalBalanceType1Code record {
    string \#content;
};

public type ExternalCashAccountType1Code record {
    string \#content;
};

public type ExternalClearingSystemIdentification1Code record {
    string \#content;
};

public type ExternalEntryStatus1Code record {
    string \#content;
};

public type ExternalFinancialInstitutionIdentification1Code record {
    string \#content;
};

public type ExternalOrganisationIdentification1Code record {
    string \#content;
};

public type ExternalPersonIdentification1Code record {
    string \#content;
};

public type ExternalProxyAccountType1Code record {
    string \#content;
};

public type FinancialIdentificationSchemeName1Choice record {
    ExternalFinancialInstitutionIdentification1Code Cd?;
    Max35Text Prtry?;
};

public type FinancialInstitutionIdentification23 record {
    BICFIDec2014Identifier BICFI?;
    ClearingSystemMemberIdentification2 ClrSysMmbId?;
    LEIIdentifier LEI?;
    Max140Text Nm?;
    PostalAddress27 PstlAdr?;
    GenericFinancialIdentification1 Othr?;
};

public enum FloorLimitType1Code {
    CRED, DEBT, BOTH
};

public type GenericAccountIdentification1 record {
    Max34Text Id;
    AccountSchemeName1Choice SchmeNm?;
    Max35Text Issr?;
};

public type GenericFinancialIdentification1 record {
    Max35Text Id;
    FinancialIdentificationSchemeName1Choice SchmeNm?;
    Max35Text Issr?;
};

public type GenericIdentification30 record {
    Exact4AlphaNumericText Id;
    Max35Text Issr;
    Max35Text SchmeNm?;
};

public type GenericOrganisationIdentification3 record {
    Max256Text Id;
    OrganisationIdentificationSchemeName1Choice SchmeNm?;
    Max35Text Issr?;
};

public type GenericPersonIdentification2 record {
    Max256Text Id;
    PersonIdentificationSchemeName1Choice SchmeNm?;
    Max35Text Issr?;
};

public type GroupHeader117 record {
    Max35Text MsgId;
    ISODateTime CreDtTm;
    Party50Choice MsgSndr?;
};

public type IBAN2007Identifier record {
    string \#content;
};

public type ISODate record {
    string \#content;
};

public type ISODateTime record {
    string \#content;
};

public type ISOTime record {
    string \#content;
};

public type LEIIdentifier record {
    string \#content;
};

public type Limit2 record {
    ActiveOrHistoricCurrencyAndAmount Amt;
    FloorLimitType1Code CdtDbtInd;
};

public type Max128Text record {
    string \#content;
};

public type Max140Text record {
    string \#content;
};

public type Max16Text record {
    string \#content;
};

public type Max2048Text record {
    string \#content;
};

public type Max256Text record {
    string \#content;
};

public type Max34Text record {
    string \#content;
};

public type Max350Text record {
    string \#content;
};

public type Max35Text record {
    string \#content;
};

public type Max4Text record {
    string \#content;
};

public type Max70Text record {
    string \#content;
};

public enum NamePrefix2Code {
    DOCT, MADM, MISS, MIST, MIKS
};

public type OrganisationIdentification39 record {
    AnyBICDec2014Identifier AnyBIC?;
    LEIIdentifier LEI?;
    GenericOrganisationIdentification3[] Othr?;
};

public type OrganisationIdentificationSchemeName1Choice record {
    ExternalOrganisationIdentification1Code Cd?;
    Max35Text Prtry?;
};

public type OtherContact1 record {
    Max4Text ChanlTp;
    Max128Text Id?;
};

public type Party50Choice record {
    PartyIdentification272 Pty?;
    BranchAndFinancialInstitutionIdentification8 Agt?;
};

public type Party52Choice record {
    OrganisationIdentification39 OrgId?;
    PersonIdentification18 PrvtId?;
};

public type PartyIdentification272 record {
    Max140Text Nm?;
    PostalAddress27 PstlAdr?;
    Party52Choice Id?;
    CountryCode CtryOfRes?;
    Contact13 CtctDtls?;
};

public type PersonIdentification18 record {
    DateAndPlaceOfBirth1 DtAndPlcOfBirth?;
    GenericPersonIdentification2[] Othr?;
};

public type PersonIdentificationSchemeName1Choice record {
    ExternalPersonIdentification1Code Cd?;
    Max35Text Prtry?;
};

public type PhoneNumber record {
    string \#content;
};

public type PostalAddress27 record {
    AddressType3Choice AdrTp?;
    Max140Text CareOf?;
    Max70Text Dept?;
    Max70Text SubDept?;
    Max140Text StrtNm?;
    Max16Text BldgNb?;
    Max140Text BldgNm?;
    Max70Text Flr?;
    Max16Text UnitNb?;
    Max16Text PstBx?;
    Max70Text Room?;
    Max16Text PstCd?;
    Max140Text TwnNm?;
    Max140Text TwnLctnNm?;
    Max140Text DstrctNm?;
    Max35Text CtrySubDvsn?;
    CountryCode Ctry?;
    Max70Text[7] AdrLine?;
};

public enum PreferredContactMethod2Code {
    MAIL, FAXX, LETT, CELL, ONLI, PHON
};

public type ProxyAccountIdentification1 record {
    ProxyAccountType1Choice Tp?;
    Max2048Text Id;
};

public type ProxyAccountType1Choice record {
    ExternalProxyAccountType1Code Cd?;
    Max35Text Prtry?;
};

public enum QueryType3Code {
    ALLL, CHNG, MODF
};

public type ReportingPeriod5 record {
    DatePeriod3 FrToDt;
    TimePeriodDetails1 FrToTm?;
    QueryType3Code Tp;
};

public type ReportingRequest7 record {
    Max35Text Id?;
    Max35Text ReqdMsgNmId;
    CashAccount40 Acct?;
    Party50Choice AcctOwnr;
    BranchAndFinancialInstitutionIdentification8 AcctSvcr?;
    ReportingPeriod5 RptgPrd?;
    SequenceRange1Choice RptgSeq?;
    TransactionType2 ReqdTxTp?;
    BalanceType13[] ReqdBalTp?;
};

public type SequenceRange1 record {
    Max35Text FrSeq;
    Max35Text ToSeq;
};

public type SequenceRange1Choice record {
    Max35Text FrSeq?;
    Max35Text ToSeq?;
    SequenceRange1 FrToSeq?;
    Max35Text EQSeq?;
    Max35Text NEQSeq?;
};

public type SupplementaryData1 record {
    Max350Text PlcAndNm?;
    SupplementaryDataEnvelope1 Envlp;
};

public type SupplementaryDataEnvelope1 record {
};

public type TimePeriodDetails1 record {
    ISOTime FrTm;
    ISOTime ToTm?;
};

public type TransactionType2 record {
    EntryStatus1Choice Sts;
    CreditDebitCode CdtDbtInd;
    Limit2[] FlrLmt?;
};
