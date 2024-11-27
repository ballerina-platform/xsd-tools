import ballerina/data.xmldata;

public type Document123 record {
    Document \#content;
};

public type AccountIdentification4Choice record {
    IBAN2007Identifier IBAN?;
    GenericAccountIdentification1 Othr?;
};

public type AccountSchemeName1Choice record {
    ExternalAccountIdentification1Code Cd?;
    Max35Text Prtry?;
};

public type ActiveOrHistoricCurrencyAndAmount_SimpleType record {
    decimal \#content;
    @xmldata:Attribute
    ActiveOrHistoricCurrencyCode Ccy;
};

public type ActiveOrHistoricCurrencyAndAmount record {
    ActiveOrHistoricCurrencyAndAmount_SimpleType ActiveOrHistoricCurrencyAndAmount_SimpleType;
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

public type AmendmentInformationDetails15 record {
    Max35Text OrgnlMndtId?;
    PartyIdentification272 OrgnlCdtrSchmeId?;
    BranchAndFinancialInstitutionIdentification8 OrgnlCdtrAgt?;
    CashAccount40 OrgnlCdtrAgtAcct?;
    PartyIdentification272 OrgnlDbtr?;
    CashAccount40 OrgnlDbtrAcct?;
    BranchAndFinancialInstitutionIdentification8 OrgnlDbtrAgt?;
    CashAccount40 OrgnlDbtrAgtAcct?;
    ISODate OrgnlFnlColltnDt?;
    Frequency36Choice OrgnlFrqcy?;
    MandateSetupReason1Choice OrgnlRsn?;
    Exact2NumericText OrgnlTrckgDays?;
};

public type AmountType4Choice record {
    ActiveOrHistoricCurrencyAndAmount InstdAmt?;
    EquivalentAmount2 EqvtAmt?;
};

public type AnyBICDec2014Identifier record {
    string \#content;
};

public type BICFIDec2014Identifier record {
    string \#content;
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

public type CancellationReason33Choice record {
    ExternalCancellationReason1Code Cd?;
    Max35Text Prtry?;
};

public type Case6 record {
    Max35Text Id;
    Party50Choice Cretr;
    YesNoIndicator ReopCaseIndctn?;
};

public type CaseAssignment6 record {
    Max35Text Id;
    Party50Choice Assgnr;
    Party50Choice Assgne;
    ISODateTime CreDtTm;
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

public type CategoryPurpose1Choice record {
    ExternalCategoryPurpose1Code Cd?;
    Max35Text Prtry?;
};

public enum ClearingChannel2Code {
    RTGS, RTNS, MPNS, BOOK
};

public type ClearingSystemIdentification2Choice record {
    ExternalClearingSystemIdentification1Code Cd?;
    Max35Text Prtry?;
};

public type ClearingSystemIdentification3Choice record {
    ExternalCashClearingSystem1Code Cd?;
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

public type ControlData1 record {
    Max15NumericText NbOfTxs;
    DecimalNumber CtrlSum?;
};

public type CountryCode record {
    string \#content;
};

public enum CreditDebitCode {
    CRDT, DBIT
};

public type CreditTransferMandateData1 record {
    Max35Text MndtId?;
    MandateTypeInformation2 Tp?;
    ISODate DtOfSgntr?;
    ISODateTime DtOfVrfctn?;
    Max10KBinary ElctrncSgntr?;
    ISODate FrstPmtDt?;
    ISODate FnlPmtDt?;
    Frequency36Choice Frqcy?;
    MandateSetupReason1Choice Rsn?;
};

public type CreditorReferenceInformation3 record {
    CreditorReferenceType3 Tp?;
    Max35Text Ref?;
};

public type CreditorReferenceType2Choice record {
    ExternalCreditorReferenceType1Code Cd?;
    Max35Text Prtry?;
};

public type CreditorReferenceType3 record {
    CreditorReferenceType2Choice CdOrPrtry;
    Max35Text Issr?;
};

public type DateAndDateTime2Choice record {
    ISODate Dt?;
    ISODateTime DtTm?;
};

public type DateAndPlaceOfBirth1 record {
    ISODate BirthDt;
    Max35Text PrvcOfBirth?;
    Max35Text CityOfBirth;
    CountryCode CtryOfBirth;
};

public type DateAndType1 record {
    DateType2Choice Tp;
    ISODate Dt;
};

public type DatePeriod2 record {
    ISODate FrDt;
    ISODate ToDt;
};

public type DateType2Choice record {
    ExternalDateType1Code Cd?;
    Max35Text Prtry?;
};

public type DecimalNumber record {
    decimal \#content;
};

public type Document record {
    FIToFIPaymentCancellationRequestV11 FIToFIPmtCxlReq;
};

public type DocumentAdjustment1 record {
    ActiveOrHistoricCurrencyAndAmount Amt;
    CreditDebitCode CdtDbtInd?;
    Max4Text Rsn?;
    Max140Text AddtlInf?;
};

public type DocumentAmount1 record {
    DocumentAmountType1Choice Tp;
    ActiveOrHistoricCurrencyAndAmount Amt;
};

public type DocumentAmountType1Choice record {
    ExternalDocumentAmountType1Code Cd?;
    Max35Text Prtry?;
};

public type DocumentLineIdentification1 record {
    DocumentLineType1 Tp?;
    Max35Text Nb?;
    ISODate RltdDt?;
};

public type DocumentLineInformation2 record {
    DocumentLineIdentification1[] Id;
    Max2048Text Desc?;
    RemittanceAmount4 Amt?;
};

public type DocumentLineType1 record {
    DocumentLineType1Choice CdOrPrtry;
    Max35Text Issr?;
};

public type DocumentLineType1Choice record {
    ExternalDocumentLineType1Code Cd?;
    Max35Text Prtry?;
};

public type DocumentType1 record {
    DocumentType2Choice CdOrPrtry;
    Max35Text Issr?;
};

public type DocumentType2Choice record {
    ExternalDocumentType1Code Cd?;
    Max35Text Prtry?;
};

public type EquivalentAmount2 record {
    ActiveOrHistoricCurrencyAndAmount Amt;
    ActiveOrHistoricCurrencyCode CcyOfTrf;
};

public type Exact2NumericText record {
    string \#content;
};

public type Exact4AlphaNumericText record {
    string \#content;
};

public type ExternalAccountIdentification1Code record {
    string \#content;
};

public type ExternalCancellationReason1Code record {
    string \#content;
};

public type ExternalCashAccountType1Code record {
    string \#content;
};

public type ExternalCashClearingSystem1Code record {
    string \#content;
};

public type ExternalCategoryPurpose1Code record {
    string \#content;
};

public type ExternalClearingSystemIdentification1Code record {
    string \#content;
};

public type ExternalCreditorReferenceType1Code record {
    string \#content;
};

public type ExternalDateType1Code record {
    string \#content;
};

public type ExternalDocumentAmountType1Code record {
    string \#content;
};

public type ExternalDocumentLineType1Code record {
    string \#content;
};

public type ExternalDocumentType1Code record {
    string \#content;
};

public type ExternalFinancialInstitutionIdentification1Code record {
    string \#content;
};

public type ExternalGarnishmentType1Code record {
    string \#content;
};

public type ExternalLocalInstrument1Code record {
    string \#content;
};

public type ExternalMandateSetupReason1Code record {
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

public type ExternalPurpose1Code record {
    string \#content;
};

public type ExternalServiceLevel1Code record {
    string \#content;
};

public type FIToFIPaymentCancellationRequestV11 record {
    CaseAssignment6 Assgnmt;
    Case6 Case?;
    ControlData1 CtrlData?;
    UnderlyingTransaction34[] Undrlyg;
    SupplementaryData1[] SplmtryData?;
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

public type Frequency36Choice record {
    Frequency6Code Tp?;
    FrequencyPeriod1 Prd?;
    FrequencyAndMoment1 PtInTm?;
};

public enum Frequency6Code {
    YEAR, MNTH, QURT, MIAN, WEEK, DAIL, ADHO, INDA, FRTN
};

public type FrequencyAndMoment1 record {
    Frequency6Code Tp;
    Exact2NumericText PtInTm;
};

public type FrequencyPeriod1 record {
    Frequency6Code Tp;
    DecimalNumber CntPerPrd;
};

public type Garnishment4 record {
    GarnishmentType1 Tp;
    PartyIdentification272 Grnshee?;
    PartyIdentification272 GrnshmtAdmstr?;
    Max140Text RefNb?;
    ISODate Dt?;
    ActiveOrHistoricCurrencyAndAmount RmtdAmt?;
    TrueFalseIndicator FmlyMdclInsrncInd?;
    TrueFalseIndicator MplyeeTermntnInd?;
};

public type GarnishmentType1 record {
    GarnishmentType1Choice CdOrPrtry;
    Max35Text Issr?;
};

public type GarnishmentType1Choice record {
    ExternalGarnishmentType1Code Cd?;
    Max35Text Prtry?;
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

public type GroupCancellationIndicator record {
    boolean \#content;
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

public type ISOYear record {
    string \#content;
};

public type LEIIdentifier record {
    string \#content;
};

public type LocalInstrument2Choice record {
    ExternalLocalInstrument1Code Cd?;
    Max35Text Prtry?;
};

public type MandateClassification1Choice record {
    MandateClassification1Code Cd?;
    Max35Text Prtry?;
};

public enum MandateClassification1Code {
    FIXE, USGB, VARI
};

public type MandateRelatedData3Choice record {
    MandateRelatedInformation16 DrctDbtMndt?;
    CreditTransferMandateData1 CdtTrfMndt?;
};

public type MandateRelatedInformation16 record {
    Max35Text MndtId?;
    ISODate DtOfSgntr?;
    TrueFalseIndicator AmdmntInd?;
    AmendmentInformationDetails15 AmdmntInfDtls?;
    Max1025Text ElctrncSgntr?;
    ISODate FrstColltnDt?;
    ISODate FnlColltnDt?;
    Frequency36Choice Frqcy?;
    MandateSetupReason1Choice Rsn?;
    Exact2NumericText TrckgDays?;
};

public type MandateSetupReason1Choice record {
    ExternalMandateSetupReason1Code Cd?;
    Max70Text Prtry?;
};

public type MandateTypeInformation2 record {
    ServiceLevel8Choice SvcLvl?;
    LocalInstrument2Choice LclInstrm?;
    CategoryPurpose1Choice CtgyPurp?;
    MandateClassification1Choice Clssfctn?;
};

public type Max1025Text record {
    string \#content;
};

public type Max105Text record {
    string \#content;
};

public type Max10KBinary record {
    byte[] \#content;
};

public type Max128Text record {
    string \#content;
};

public type Max140Text record {
    string \#content;
};

public type Max15NumericText record {
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

public type Number record {
    decimal \#content;
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

public type OriginalGroupHeader21 record {
    Max35Text GrpCxlId?;
    Case6 Case?;
    Max35Text OrgnlMsgId;
    Max35Text OrgnlMsgNmId;
    ISODateTime OrgnlCreDtTm?;
    Max15NumericText NbOfTxs?;
    DecimalNumber CtrlSum?;
    GroupCancellationIndicator GrpCxl?;
    PaymentCancellationReason6[] CxlRsnInf?;
};

public type OriginalGroupInformation29 record {
    Max35Text OrgnlMsgId;
    Max35Text OrgnlMsgNmId;
    ISODateTime OrgnlCreDtTm?;
};

public type OriginalTransactionReference42 record {
    ActiveOrHistoricCurrencyAndAmount IntrBkSttlmAmt?;
    AmountType4Choice Amt?;
    ISODate IntrBkSttlmDt?;
    ISODate ReqdColltnDt?;
    DateAndDateTime2Choice ReqdExctnDt?;
    PartyIdentification272 CdtrSchmeId?;
    SettlementInstruction15 SttlmInf?;
    PaymentTypeInformation27 PmtTpInf?;
    PaymentMethod4Code PmtMtd?;
    MandateRelatedData3Choice MndtRltdInf?;
    RemittanceInformation22 RmtInf?;
    Party50Choice UltmtDbtr?;
    Party50Choice Dbtr?;
    CashAccount40 DbtrAcct?;
    BranchAndFinancialInstitutionIdentification8 DbtrAgt?;
    CashAccount40 DbtrAgtAcct?;
    BranchAndFinancialInstitutionIdentification8 CdtrAgt?;
    CashAccount40 CdtrAgtAcct?;
    Party50Choice Cdtr?;
    CashAccount40 CdtrAcct?;
    Party50Choice UltmtCdtr?;
    Purpose2Choice Purp?;
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

public type PaymentCancellationReason6 record {
    PartyIdentification272 Orgtr?;
    CancellationReason33Choice Rsn?;
    Max105Text[] AddtlInf?;
};

public enum PaymentMethod4Code {
    CHK, TRF, DD, TRA
};

public type PaymentTransaction155 record {
    Max35Text CxlId?;
    Case6 Case?;
    OriginalGroupInformation29 OrgnlGrpInf?;
    Max35Text OrgnlInstrId?;
    Max35Text OrgnlEndToEndId?;
    Max35Text OrgnlTxId?;
    UUIDv4Identifier OrgnlUETR?;
    Max35Text OrgnlClrSysRef?;
    ActiveOrHistoricCurrencyAndAmount OrgnlIntrBkSttlmAmt?;
    ISODate OrgnlIntrBkSttlmDt?;
    BranchAndFinancialInstitutionIdentification8 Assgnr?;
    BranchAndFinancialInstitutionIdentification8 Assgne?;
    PaymentCancellationReason6[] CxlRsnInf?;
    OriginalTransactionReference42 OrgnlTxRef?;
    SupplementaryData1[] SplmtryData?;
};

public type PaymentTypeInformation27 record {
    Priority2Code InstrPrty?;
    ClearingChannel2Code ClrChanl?;
    ServiceLevel8Choice[] SvcLvl?;
    LocalInstrument2Choice LclInstrm?;
    SequenceType3Code SeqTp?;
    CategoryPurpose1Choice CtgyPurp?;
};

public type PercentageRate record {
    decimal \#content;
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

public enum Priority2Code {
    HIGH, NORM
};

public type ProxyAccountIdentification1 record {
    ProxyAccountType1Choice Tp?;
    Max2048Text Id;
};

public type ProxyAccountType1Choice record {
    ExternalProxyAccountType1Code Cd?;
    Max35Text Prtry?;
};

public type Purpose2Choice record {
    ExternalPurpose1Code Cd?;
    Max35Text Prtry?;
};

public type ReferredDocumentInformation8 record {
    DocumentType1 Tp?;
    Max35Text Nb?;
    DateAndType1 RltdDt?;
    DocumentLineInformation2[] LineDtls?;
};

public type RemittanceAmount4 record {
    DocumentAmount1[] RmtAmtAndTp?;
    DocumentAdjustment1[] AdjstmntAmtAndRsn?;
};

public type RemittanceInformation22 record {
    Max140Text[] Ustrd?;
    StructuredRemittanceInformation18[] Strd?;
};

public enum SequenceType3Code {
    FRST, RCUR, FNAL, OOFF, RPRE
};

public type ServiceLevel8Choice record {
    ExternalServiceLevel1Code Cd?;
    Max35Text Prtry?;
};

public type SettlementInstruction15 record {
    SettlementMethod1Code SttlmMtd;
    CashAccount40 SttlmAcct?;
    ClearingSystemIdentification3Choice ClrSys?;
    BranchAndFinancialInstitutionIdentification8 InstgRmbrsmntAgt?;
    CashAccount40 InstgRmbrsmntAgtAcct?;
    BranchAndFinancialInstitutionIdentification8 InstdRmbrsmntAgt?;
    CashAccount40 InstdRmbrsmntAgtAcct?;
    BranchAndFinancialInstitutionIdentification8 ThrdRmbrsmntAgt?;
    CashAccount40 ThrdRmbrsmntAgtAcct?;
};

public enum SettlementMethod1Code {
    INDA, INGA, COVE, CLRG
};

public type StructuredRemittanceInformation18 record {
    ReferredDocumentInformation8[] RfrdDocInf?;
    RemittanceAmount4 RfrdDocAmt?;
    CreditorReferenceInformation3 CdtrRefInf?;
    PartyIdentification272 Invcr?;
    PartyIdentification272 Invcee?;
    TaxData1 TaxRmt?;
    Garnishment4 GrnshmtRmt?;
    Max140Text[3] AddtlRmtInf?;
};

public type SupplementaryData1 record {
    Max350Text PlcAndNm?;
    SupplementaryDataEnvelope1 Envlp;
};

public type SupplementaryDataEnvelope1 record {
};

public type TaxAmount3 record {
    PercentageRate Rate?;
    ActiveOrHistoricCurrencyAndAmount TaxblBaseAmt?;
    ActiveOrHistoricCurrencyAndAmount TtlAmt?;
    TaxRecordDetails3[] Dtls?;
};

public type TaxAuthorisation1 record {
    Max35Text Titl?;
    Max140Text Nm?;
};

public type TaxData1 record {
    TaxParty1 Cdtr?;
    TaxParty2 Dbtr?;
    TaxParty2 UltmtDbtr?;
    Max35Text AdmstnZone?;
    Max140Text RefNb?;
    Max35Text Mtd?;
    ActiveOrHistoricCurrencyAndAmount TtlTaxblBaseAmt?;
    ActiveOrHistoricCurrencyAndAmount TtlTaxAmt?;
    ISODate Dt?;
    Number SeqNb?;
    TaxRecord3[] Rcrd?;
};

public type TaxParty1 record {
    Max35Text TaxId?;
    Max35Text RegnId?;
    Max35Text TaxTp?;
};

public type TaxParty2 record {
    Max35Text TaxId?;
    Max35Text RegnId?;
    Max35Text TaxTp?;
    TaxAuthorisation1 Authstn?;
};

public type TaxPeriod3 record {
    ISOYear Yr?;
    TaxRecordPeriod1Code Tp?;
    DatePeriod2 FrToDt?;
};

public type TaxRecord3 record {
    Max35Text Tp?;
    Max35Text Ctgy?;
    Max35Text CtgyDtls?;
    Max35Text DbtrSts?;
    Max35Text CertId?;
    Max35Text FrmsCd?;
    TaxPeriod3 Prd?;
    TaxAmount3 TaxAmt?;
    Max140Text AddtlInf?;
};

public type TaxRecordDetails3 record {
    TaxPeriod3 Prd?;
    ActiveOrHistoricCurrencyAndAmount Amt;
};

public enum TaxRecordPeriod1Code {
    MM01, MM02, MM03, MM04, MM05, MM06, MM07, MM08, MM09, MM10, MM11, MM12, QTR1, QTR2, QTR3, QTR4, HLF1, HLF2
};

public type TrueFalseIndicator record {
    boolean \#content;
};

public type UUIDv4Identifier record {
    string \#content;
};

public type UnderlyingTransaction34 record {
    OriginalGroupHeader21 OrgnlGrpInfAndCxl?;
    PaymentTransaction155[] TxInf?;
};

public type YesNoIndicator record {
    boolean \#content;
};
