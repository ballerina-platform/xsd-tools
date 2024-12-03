import ballerina/data.xmldata;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Document1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CustomerDirectDebitInitiationV11 CstmrDrctDbtInitn;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type AccountIdentification4Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    IBAN2007Identifier IBAN?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    GenericAccountIdentification1 Othr?;
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
public type AdviceType1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    AdviceType1Choice CdtAdvc?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    AdviceType1Choice DbtAdvc?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type AdviceType1Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    AdviceType1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public enum AdviceType1Code {
    ADWD, ADND
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type AmendmentInformationDetails15 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text OrgnlMndtId?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PartyIdentification272 OrgnlCdtrSchmeId?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    BranchAndFinancialInstitutionIdentification8 OrgnlCdtrAgt?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CashAccount40 OrgnlCdtrAgtAcct?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PartyIdentification272 OrgnlDbtr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CashAccount40 OrgnlDbtrAcct?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    BranchAndFinancialInstitutionIdentification8 OrgnlDbtrAgt?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CashAccount40 OrgnlDbtrAgtAcct?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ISODate OrgnlFnlColltnDt?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Frequency36Choice OrgnlFrqcy?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    MandateSetupReason1Choice OrgnlRsn?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Exact2NumericText OrgnlTrckgDays?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type AnyBICDec2014Identifier string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Authorisation1Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Authorisation1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max128Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public enum Authorisation1Code {
    AUTH, FDET, FSUM, ILEV
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type BICFIDec2014Identifier string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type BatchBookingIndicator boolean;

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
public type CategoryPurpose1Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ExternalCategoryPurpose1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public enum ChargeBearerType1Code {
    DEBT, CRED, SHAR, SLEV
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
public type CreditorReferenceInformation3 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CreditorReferenceType3 Tp?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Ref?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type CreditorReferenceType2Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ExternalCreditorReferenceType1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type CreditorReferenceType3 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CreditorReferenceType2Choice CdOrPrtry;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Issr?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type CustomerDirectDebitInitiationV11 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    GroupHeader118 GrpHdr;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PaymentInstruction45[] PmtInf;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    SupplementaryData1[] SplmtryData?;
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
public type DateAndType1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    DateType2Choice Tp;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ISODate Dt;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type DatePeriod2 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ISODate FrDt;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ISODate ToDt;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type DateType2Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ExternalDateType1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type DecimalNumber decimal;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type DirectDebitTransaction12 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    MandateRelatedInformation16 MndtRltdInf?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PartyIdentification272 CdtrSchmeId?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text PreNtfctnId?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ISODate PreNtfctnDt?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type DirectDebitTransactionInformation32 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PaymentIdentification6 PmtId;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PaymentTypeInformation29 PmtTpInf?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ActiveOrHistoricCurrencyAndAmount InstdAmt;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ChargeBearerType1Code ChrgBr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    DirectDebitTransaction12 DrctDbtTx?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PartyIdentification272 UltmtCdtr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    BranchAndFinancialInstitutionIdentification8 DbtrAgt;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CashAccount40 DbtrAgtAcct?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PartyIdentification272 Dbtr;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CashAccount40 DbtrAcct;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PartyIdentification272 UltmtDbtr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max140Text InstrForCdtrAgt?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Purpose2Choice Purp?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    RegulatoryReporting3[] RgltryRptg?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    TaxData1 Tax?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    RemittanceLocation8[] RltdRmtInf?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    RemittanceInformation22 RmtInf?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    SupplementaryData1[] SplmtryData?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Document record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CustomerDirectDebitInitiationV11 CstmrDrctDbtInitn;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type DocumentAdjustment1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ActiveOrHistoricCurrencyAndAmount Amt;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CreditDebitCode CdtDbtInd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max4Text Rsn?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max140Text AddtlInf?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type DocumentAmount1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    DocumentAmountType1Choice Tp;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ActiveOrHistoricCurrencyAndAmount Amt;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type DocumentAmountType1Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ExternalDocumentAmountType1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type DocumentLineIdentification1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    DocumentLineType1 Tp?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Nb?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ISODate RltdDt?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type DocumentLineInformation2 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    DocumentLineIdentification1[] Id;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max2048Text Desc?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    RemittanceAmount4 Amt?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type DocumentLineType1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    DocumentLineType1Choice CdOrPrtry;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Issr?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type DocumentLineType1Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ExternalDocumentLineType1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type DocumentType1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    DocumentType2Choice CdOrPrtry;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Issr?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type DocumentType2Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ExternalDocumentType1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Exact2NumericText string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Exact4AlphaNumericText string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalAccountIdentification1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalCashAccountType1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalCategoryPurpose1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalClearingSystemIdentification1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalCreditorReferenceType1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalDateType1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalDocumentAmountType1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalDocumentLineType1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalDocumentType1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalFinancialInstitutionIdentification1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalGarnishmentType1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalLocalInstrument1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalMandateSetupReason1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalOrganisationIdentification1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalPersonIdentification1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalProxyAccountType1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalPurpose1Code string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ExternalServiceLevel1Code string;

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
public type Frequency36Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Frequency6Code Tp?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    FrequencyPeriod1 Prd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    FrequencyAndMoment1 PtInTm?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public enum Frequency6Code {
    YEAR, MNTH, QURT, MIAN, WEEK, DAIL, ADHO, INDA, FRTN
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type FrequencyAndMoment1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Frequency6Code Tp;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Exact2NumericText PtInTm;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type FrequencyPeriod1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Frequency6Code Tp;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    DecimalNumber CntPerPrd;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Garnishment4 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    GarnishmentType1 Tp;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PartyIdentification272 Grnshee?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PartyIdentification272 GrnshmtAdmstr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max140Text RefNb?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ISODate Dt?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ActiveOrHistoricCurrencyAndAmount RmtdAmt?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    TrueFalseIndicator FmlyMdclInsrncInd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    TrueFalseIndicator MplyeeTermntnInd?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type GarnishmentType1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    GarnishmentType1Choice CdOrPrtry;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Issr?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type GarnishmentType1Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ExternalGarnishmentType1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Prtry?;
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
public type GroupHeader118 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text MsgId;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ISODateTime CreDtTm;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Authorisation1Choice[] Authstn?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max15NumericText NbOfTxs;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    DecimalNumber CtrlSum?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PartyIdentification272 InitgPty;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    BranchAndFinancialInstitutionIdentification8 FwdgAgt?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type IBAN2007Identifier string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ISODate string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ISODateTime string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ISOYear string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type LEIIdentifier string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type LocalInstrument2Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ExternalLocalInstrument1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type MandateRelatedInformation16 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text MndtId?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ISODate DtOfSgntr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    TrueFalseIndicator AmdmntInd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    AmendmentInformationDetails15 AmdmntInfDtls?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max1025Text ElctrncSgntr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ISODate FrstColltnDt?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ISODate FnlColltnDt?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Frequency36Choice Frqcy?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    MandateSetupReason1Choice Rsn?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Exact2NumericText TrckgDays?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type MandateSetupReason1Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ExternalMandateSetupReason1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max70Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Max1025Text string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Max10Text string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Max128Text string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Max140Text string;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Max15NumericText string;

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
public type NameAndAddress18 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max140Text Nm;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PostalAddress27 Adr;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public enum NamePrefix2Code {
    DOCT, MADM, MISS, MIST, MIKS
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type Number decimal;

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
public type PaymentIdentification6 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text InstrId?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text EndToEndId;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    UUIDv4Identifier UETR?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type PaymentInstruction45 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text PmtInfId;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PaymentMethod2Code PmtMtd;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    AdviceType1 ReqdAdvcTp?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    BatchBookingIndicator BtchBookg?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max15NumericText NbOfTxs?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    DecimalNumber CtrlSum?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PaymentTypeInformation29 PmtTpInf?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ISODate ReqdColltnDt;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PartyIdentification272 Cdtr;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CashAccount40 CdtrAcct;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    BranchAndFinancialInstitutionIdentification8 CdtrAgt;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CashAccount40 CdtrAgtAcct?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PartyIdentification272 UltmtCdtr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ChargeBearerType1Code ChrgBr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CashAccount40 ChrgsAcct?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    BranchAndFinancialInstitutionIdentification8 ChrgsAcctAgt?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PartyIdentification272 CdtrSchmeId?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    DirectDebitTransactionInformation32[] DrctDbtTxInf;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public enum PaymentMethod2Code {
    DD
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type PaymentTypeInformation29 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Priority2Code InstrPrty?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ServiceLevel8Choice[] SvcLvl?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    LocalInstrument2Choice LclInstrm?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    SequenceType3Code SeqTp?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CategoryPurpose1Choice CtgyPurp?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type PercentageRate decimal;

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
public enum Priority2Code {
    HIGH, NORM
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
public type Purpose2Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ExternalPurpose1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ReferredDocumentInformation8 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    DocumentType1 Tp?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Nb?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    DateAndType1 RltdDt?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    DocumentLineInformation2[] LineDtls?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type RegulatoryAuthority2 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max140Text Nm?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CountryCode Ctry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type RegulatoryReporting3 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    RegulatoryReportingType1Code DbtCdtRptgInd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    RegulatoryAuthority2 Authrty?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    StructuredRegulatoryReporting3[] Dtls?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public enum RegulatoryReportingType1Code {
    CRED, DEBT, BOTH
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type RemittanceAmount4 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    DocumentAmount1[] RmtAmtAndTp?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    DocumentAdjustment1[] AdjstmntAmtAndRsn?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type RemittanceInformation22 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max140Text[] Ustrd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    StructuredRemittanceInformation18[] Strd?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type RemittanceLocation8 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text RmtId?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    RemittanceLocationData2[] RmtLctnDtls?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type RemittanceLocationData2 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    RemittanceLocationMethod2Code Mtd;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max2048Text ElctrncAdr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    NameAndAddress18 PstlAdr?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public enum RemittanceLocationMethod2Code {
    FAXI, EDIC, URID, EMAL, POST, SMSM
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public enum SequenceType3Code {
    FRST, RCUR, FNAL, OOFF, RPRE
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type ServiceLevel8Choice record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ExternalServiceLevel1Code Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Prtry?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type StructuredRegulatoryReporting3 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Tp?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ISODate Dt?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CountryCode Ctry?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max10Text Cd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ActiveOrHistoricCurrencyAndAmount Amt?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text[] Inf?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type StructuredRemittanceInformation18 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ReferredDocumentInformation8[] RfrdDocInf?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    RemittanceAmount4 RfrdDocAmt?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    CreditorReferenceInformation3 CdtrRefInf?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PartyIdentification272 Invcr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PartyIdentification272 Invcee?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    TaxData1 TaxRmt?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Garnishment4 GrnshmtRmt?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max140Text[] AddtlRmtInf?;
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
public type TaxAmount3 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    PercentageRate Rate?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ActiveOrHistoricCurrencyAndAmount TaxblBaseAmt?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ActiveOrHistoricCurrencyAndAmount TtlAmt?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    TaxRecordDetails3[] Dtls?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type TaxAuthorisation1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Titl?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max140Text Nm?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type TaxData1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    TaxParty1 Cdtr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    TaxParty2 Dbtr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    TaxParty2 UltmtDbtr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text AdmstnZone?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max140Text RefNb?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Mtd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ActiveOrHistoricCurrencyAndAmount TtlTaxblBaseAmt?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ActiveOrHistoricCurrencyAndAmount TtlTaxAmt?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ISODate Dt?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Number SeqNb?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    TaxRecord3[] Rcrd?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type TaxParty1 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text TaxId?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text RegnId?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text TaxTp?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type TaxParty2 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text TaxId?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text RegnId?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text TaxTp?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    TaxAuthorisation1 Authstn?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type TaxPeriod3 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ISOYear Yr?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    TaxRecordPeriod1Code Tp?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    DatePeriod2 FrToDt?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type TaxRecord3 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Tp?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text Ctgy?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text CtgyDtls?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text DbtrSts?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text CertId?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max35Text FrmsCd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    TaxPeriod3 Prd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    TaxAmount3 TaxAmt?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    Max140Text AddtlInf?;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type TaxRecordDetails3 record {
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    TaxPeriod3 Prd?;
    @xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
    ActiveOrHistoricCurrencyAndAmount Amt;
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public enum TaxRecordPeriod1Code {
    MM01, MM02, MM03, MM04, MM05, MM06, MM07, MM08, MM09, MM10, MM11, MM12, QTR1, QTR2, QTR3, QTR4, HLF1, HLF2
};

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type TrueFalseIndicator boolean;

@xmldata:Namespace {prefix: "xs", uri: "http://www.w3.org/2001/XMLSchema"}
public type UUIDv4Identifier string;
