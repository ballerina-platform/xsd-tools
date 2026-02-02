import ballerina/data.xmldata;

@xmldata:Name {value: "Document"}
@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Document1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup15 sequenceGroup15;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type AccountIdentification4Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption choiceOption;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type AccountSchemeName1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption1 choiceOption1;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ActiveOrHistoricCurrencyAndAmount_SimpleType decimal;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ActiveOrHistoricCurrencyAndAmount record {|
    decimal \#content;
    @xmldata:Attribute
    ActiveOrHistoricCurrencyCode Ccy;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ActiveOrHistoricCurrencyCode string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public enum AddressType2Code {
    ADDR, PBOX, HOME, BIZZ, MLTO, DLVY
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type AddressType3Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption2 choiceOption2;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type AdviceType1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type AdviceType1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption3 choiceOption3;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public enum AdviceType1Code {
    ADWD, ADND
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type AmendmentInformationDetails15 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup1 sequenceGroup1;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type AnyBICDec2014Identifier string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Authorisation1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption4 choiceOption4;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public enum Authorisation1Code {
    AUTH, FDET, FSUM, ILEV
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type BICFIDec2014Identifier string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type BatchBookingIndicator boolean;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type BranchAndFinancialInstitutionIdentification8 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup2 sequenceGroup2;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type BranchData5 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup3 sequenceGroup3;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type CashAccount40 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup4 sequenceGroup4;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type CashAccountType2Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption5 choiceOption5;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type CategoryPurpose1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption6 choiceOption6;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public enum ChargeBearerType1Code {
    DEBT, CRED, SHAR, SLEV
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ClearingSystemIdentification2Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption7 choiceOption7;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ClearingSystemMemberIdentification2 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup5 sequenceGroup5;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Contact13 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup6 sequenceGroup6;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type CountryCode string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public enum CreditDebitCode {
    CRDT, DBIT
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type CreditorReferenceInformation3 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup7 sequenceGroup7;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type CreditorReferenceType2Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption8 choiceOption8;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type CreditorReferenceType3 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup8 sequenceGroup8;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type CustomerDirectDebitInitiationV11 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup9 sequenceGroup9;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type DateAndPlaceOfBirth1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup10 sequenceGroup10;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type DateAndType1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup11 sequenceGroup11;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type DatePeriod2 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup12 sequenceGroup12;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type DateType2Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption9 choiceOption9;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type DecimalNumber decimal;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type DirectDebitTransaction12 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup13 sequenceGroup13;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type DirectDebitTransactionInformation32 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup14 sequenceGroup14;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Document record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup15 sequenceGroup15;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type DocumentAdjustment1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup16 sequenceGroup16;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type DocumentAmount1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup17 sequenceGroup17;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type DocumentAmountType1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption10 choiceOption10;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type DocumentLineIdentification1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup18 sequenceGroup18;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type DocumentLineInformation2 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup19 sequenceGroup19;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type DocumentLineType1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup20 sequenceGroup20;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type DocumentLineType1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption11 choiceOption11;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type DocumentType1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup21 sequenceGroup21;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type DocumentType2Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption12 choiceOption12;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Exact2NumericText string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Exact4AlphaNumericText string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ExternalAccountIdentification1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ExternalCashAccountType1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ExternalCategoryPurpose1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ExternalClearingSystemIdentification1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ExternalCreditorReferenceType1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ExternalDateType1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ExternalDocumentAmountType1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ExternalDocumentLineType1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ExternalDocumentType1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ExternalFinancialInstitutionIdentification1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ExternalGarnishmentType1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ExternalLocalInstrument1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ExternalMandateSetupReason1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ExternalOrganisationIdentification1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ExternalPersonIdentification1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ExternalProxyAccountType1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ExternalPurpose1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ExternalServiceLevel1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type FinancialIdentificationSchemeName1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption13 choiceOption13;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type FinancialInstitutionIdentification23 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup22 sequenceGroup22;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Frequency36Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption14 choiceOption14;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public enum Frequency6Code {
    YEAR, MNTH, QURT, MIAN, WEEK, DAIL, ADHO, INDA, FRTN
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type FrequencyAndMoment1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup23 sequenceGroup23;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type FrequencyPeriod1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup24 sequenceGroup24;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Garnishment4 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup25 sequenceGroup25;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type GarnishmentType1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup26 sequenceGroup26;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type GarnishmentType1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption15 choiceOption15;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type GenericAccountIdentification1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup27 sequenceGroup27;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type GenericFinancialIdentification1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup28 sequenceGroup28;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type GenericIdentification30 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup29 sequenceGroup29;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type GenericOrganisationIdentification3 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup30 sequenceGroup30;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type GenericPersonIdentification2 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup31 sequenceGroup31;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type GroupHeader118 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup32 sequenceGroup32;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type IBAN2007Identifier string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ISODate string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ISODateTime string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ISOYear string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type LEIIdentifier string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type LocalInstrument2Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption16 choiceOption16;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type MandateRelatedInformation16 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup33 sequenceGroup33;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type MandateSetupReason1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption17 choiceOption17;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Max1025Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Max10Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Max128Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Max140Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Max15NumericText string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Max16Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Max2048Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Max256Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Max34Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Max350Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Max35Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Max4Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Max70Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type NameAndAddress18 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup34 sequenceGroup34;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public enum NamePrefix2Code {
    DOCT, MADM, MISS, MIST, MIKS
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Number decimal;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type OrganisationIdentification39 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup35 sequenceGroup35;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type OrganisationIdentificationSchemeName1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption18 choiceOption18;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type OtherContact1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup36 sequenceGroup36;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Party52Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption19 choiceOption19;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type PartyIdentification272 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup37 sequenceGroup37;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type PaymentIdentification6 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup38 sequenceGroup38;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type PaymentInstruction45 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup39 sequenceGroup39;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public enum PaymentMethod2Code {
    DD
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type PaymentTypeInformation29 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup40 sequenceGroup40;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type PercentageRate decimal;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type PersonIdentification18 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup41 sequenceGroup41;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type PersonIdentificationSchemeName1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption20 choiceOption20;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type PhoneNumber string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type PostalAddress27 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup42 sequenceGroup42;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public enum PreferredContactMethod2Code {
    MAIL, FAXX, LETT, CELL, ONLI, PHON
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public enum Priority2Code {
    HIGH, NORM
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ProxyAccountIdentification1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup43 sequenceGroup43;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ProxyAccountType1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption21 choiceOption21;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type Purpose2Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption22 choiceOption22;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ReferredDocumentInformation8 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup44 sequenceGroup44;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type RegulatoryAuthority2 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup45 sequenceGroup45;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type RegulatoryReporting3 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup46 sequenceGroup46;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public enum RegulatoryReportingType1Code {
    CRED, DEBT, BOTH
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type RemittanceAmount4 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup47 sequenceGroup47;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type RemittanceInformation22 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup48 sequenceGroup48;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type RemittanceLocation8 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup49 sequenceGroup49;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type RemittanceLocationData2 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup50 sequenceGroup50;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public enum RemittanceLocationMethod2Code {
    FAXI, EDIC, URID, EMAL, POST, SMSM
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public enum SequenceType3Code {
    FRST, RCUR, FNAL, OOFF, RPRE
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ServiceLevel8Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption23 choiceOption23;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type StructuredRegulatoryReporting3 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup51 sequenceGroup51;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type StructuredRemittanceInformation18 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup52 sequenceGroup52;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SupplementaryData1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup53 sequenceGroup53;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SupplementaryDataEnvelope1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup54 sequenceGroup54;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type TaxAmount3 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup55 sequenceGroup55;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type TaxAuthorisation1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup56 sequenceGroup56;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type TaxData1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup57 sequenceGroup57;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type TaxParty1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup58 sequenceGroup58;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type TaxParty2 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup59 sequenceGroup59;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type TaxPeriod3 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup60 sequenceGroup60;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type TaxRecord3 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup61 sequenceGroup61;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type TaxRecordDetails3 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup62 sequenceGroup62;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public enum TaxRecordPeriod1Code {
    MM01, MM02, MM03, MM04, MM05, MM06, MM07, MM08, MM09, MM10, MM11, MM12, QTR1, QTR2, QTR3, QTR4, HLF1, HLF2
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type TrueFalseIndicator boolean;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type UUIDv4Identifier string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    IBAN2007Identifier IBAN?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    GenericAccountIdentification1 Othr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption1 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    ExternalAccountIdentification1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption2 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    AddressType2Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    GenericIdentification30 Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    AdviceType1Choice CdtAdvc?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    AdviceType1Choice DbtAdvc?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption3 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    AdviceType1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup1 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text OrgnlMndtId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    PartyIdentification272 OrgnlCdtrSchmeId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    BranchAndFinancialInstitutionIdentification8 OrgnlCdtrAgt?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    CashAccount40 OrgnlCdtrAgtAcct?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 5}
    PartyIdentification272 OrgnlDbtr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 6}
    CashAccount40 OrgnlDbtrAcct?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 7}
    BranchAndFinancialInstitutionIdentification8 OrgnlDbtrAgt?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 8}
    CashAccount40 OrgnlDbtrAgtAcct?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 9}
    ISODate OrgnlFnlColltnDt?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 10}
    Frequency36Choice OrgnlFrqcy?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 11}
    MandateSetupReason1Choice OrgnlRsn?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 12}
    Exact2NumericText OrgnlTrckgDays?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption4 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Authorisation1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Max128Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup2 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    FinancialInstitutionIdentification23 FinInstnId;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    BranchData5 BrnchId?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup3 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text Id?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    LEIIdentifier LEI?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    Max140Text Nm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    PostalAddress27 PstlAdr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup4 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    AccountIdentification4Choice Id?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    CashAccountType2Choice Tp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    ActiveOrHistoricCurrencyCode Ccy?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    Max70Text Nm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 5}
    ProxyAccountIdentification1 Prxy?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption5 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    ExternalCashAccountType1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption6 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    ExternalCategoryPurpose1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption7 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    ExternalClearingSystemIdentification1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup5 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    ClearingSystemIdentification2Choice ClrSysId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text MmbId;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup6 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    NamePrefix2Code NmPrfx?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Max140Text Nm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    PhoneNumber PhneNb?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    PhoneNumber MobNb?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 5}
    PhoneNumber FaxNb?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 6}
    Max2048Text URLAdr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 7}
    Max256Text EmailAdr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 8}
    Max35Text EmailPurp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 9}
    Max35Text JobTitl?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 10}
    Max35Text Rspnsblty?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 11}
    Max70Text Dept?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 12}
    OtherContact1[] Othr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 13}
    PreferredContactMethod2Code PrefrdMtd?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup7 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    CreditorReferenceType3 Tp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text Ref?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption8 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    ExternalCreditorReferenceType1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup8 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    CreditorReferenceType2Choice CdOrPrtry;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text Issr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup9 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    GroupHeader118 GrpHdr;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    PaymentInstruction45[] PmtInf;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    SupplementaryData1[] SplmtryData?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup10 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    ISODate BirthDt;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text PrvcOfBirth?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    Max35Text CityOfBirth;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    CountryCode CtryOfBirth;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup11 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    DateType2Choice Tp;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    ISODate Dt;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup12 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    ISODate FrDt;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    ISODate ToDt;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption9 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    ExternalDateType1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup13 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    MandateRelatedInformation16 MndtRltdInf?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    PartyIdentification272 CdtrSchmeId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    Max35Text PreNtfctnId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    ISODate PreNtfctnDt?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup14 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    PaymentIdentification6 PmtId;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    PaymentTypeInformation29 PmtTpInf?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    ActiveOrHistoricCurrencyAndAmount InstdAmt;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    ChargeBearerType1Code ChrgBr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 5}
    DirectDebitTransaction12 DrctDbtTx?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 6}
    PartyIdentification272 UltmtCdtr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 7}
    BranchAndFinancialInstitutionIdentification8 DbtrAgt;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 8}
    CashAccount40 DbtrAgtAcct?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 9}
    PartyIdentification272 Dbtr;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 10}
    CashAccount40 DbtrAcct;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 11}
    PartyIdentification272 UltmtDbtr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 12}
    Max140Text InstrForCdtrAgt?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 13}
    Purpose2Choice Purp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 14}
    RegulatoryReporting3[] RgltryRptg?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 15}
    TaxData1 Tax?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 16}
    RemittanceLocation8[] RltdRmtInf?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 17}
    RemittanceInformation22 RmtInf?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 18}
    SupplementaryData1[] SplmtryData?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup15 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    CustomerDirectDebitInitiationV11 CstmrDrctDbtInitn;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup16 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    ActiveOrHistoricCurrencyAndAmount Amt;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    CreditDebitCode CdtDbtInd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    Max4Text Rsn?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    Max140Text AddtlInf?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup17 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    DocumentAmountType1Choice Tp;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    ActiveOrHistoricCurrencyAndAmount Amt;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption10 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    ExternalDocumentAmountType1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup18 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    DocumentLineType1 Tp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text Nb?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    ISODate RltdDt?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup19 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    DocumentLineIdentification1[] Id;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Max2048Text Desc?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    RemittanceAmount4 Amt?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup20 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    DocumentLineType1Choice CdOrPrtry;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text Issr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption11 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    ExternalDocumentLineType1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup21 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    DocumentType2Choice CdOrPrtry;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text Issr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption12 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    ExternalDocumentType1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption13 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    ExternalFinancialInstitutionIdentification1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup22 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    BICFIDec2014Identifier BICFI?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    ClearingSystemMemberIdentification2 ClrSysMmbId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    LEIIdentifier LEI?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    Max140Text Nm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 5}
    PostalAddress27 PstlAdr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 6}
    GenericFinancialIdentification1 Othr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption14 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Frequency6Code Tp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    FrequencyPeriod1 Prd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    FrequencyAndMoment1 PtInTm?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup23 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Frequency6Code Tp;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Exact2NumericText PtInTm;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup24 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Frequency6Code Tp;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    DecimalNumber CntPerPrd;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup25 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    GarnishmentType1 Tp;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    PartyIdentification272 Grnshee?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    PartyIdentification272 GrnshmtAdmstr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    Max140Text RefNb?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 5}
    ISODate Dt?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 6}
    ActiveOrHistoricCurrencyAndAmount RmtdAmt?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 7}
    TrueFalseIndicator FmlyMdclInsrncInd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 8}
    TrueFalseIndicator MplyeeTermntnInd?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup26 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    GarnishmentType1Choice CdOrPrtry;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text Issr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption15 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    ExternalGarnishmentType1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup27 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max34Text Id;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    AccountSchemeName1Choice SchmeNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    Max35Text Issr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup28 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text Id;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    FinancialIdentificationSchemeName1Choice SchmeNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    Max35Text Issr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup29 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Exact4AlphaNumericText Id;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text Issr;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    Max35Text SchmeNm?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup30 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max256Text Id;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    OrganisationIdentificationSchemeName1Choice SchmeNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    Max35Text Issr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup31 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max256Text Id;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    PersonIdentificationSchemeName1Choice SchmeNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    Max35Text Issr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup32 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text MsgId;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    ISODateTime CreDtTm;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    Authorisation1Choice[] Authstn?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    Max15NumericText NbOfTxs;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 5}
    DecimalNumber CtrlSum?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 6}
    PartyIdentification272 InitgPty;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 7}
    BranchAndFinancialInstitutionIdentification8 FwdgAgt?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption16 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    ExternalLocalInstrument1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup33 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text MndtId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    ISODate DtOfSgntr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    TrueFalseIndicator AmdmntInd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    AmendmentInformationDetails15 AmdmntInfDtls?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 5}
    Max1025Text ElctrncSgntr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 6}
    ISODate FrstColltnDt?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 7}
    ISODate FnlColltnDt?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 8}
    Frequency36Choice Frqcy?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 9}
    MandateSetupReason1Choice Rsn?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 10}
    Exact2NumericText TrckgDays?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption17 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    ExternalMandateSetupReason1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Max70Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup34 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max140Text Nm;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    PostalAddress27 Adr;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup35 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    AnyBICDec2014Identifier AnyBIC?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    LEIIdentifier LEI?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    GenericOrganisationIdentification3[] Othr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption18 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    ExternalOrganisationIdentification1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup36 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max4Text ChanlTp;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Max128Text Id?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption19 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    OrganisationIdentification39 OrgId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    PersonIdentification18 PrvtId?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup37 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max140Text Nm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    PostalAddress27 PstlAdr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    Party52Choice Id?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    CountryCode CtryOfRes?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 5}
    Contact13 CtctDtls?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup38 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text InstrId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text EndToEndId;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    UUIDv4Identifier UETR?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup39 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text PmtInfId;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    PaymentMethod2Code PmtMtd;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    AdviceType1 ReqdAdvcTp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    BatchBookingIndicator BtchBookg?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 5}
    Max15NumericText NbOfTxs?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 6}
    DecimalNumber CtrlSum?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 7}
    PaymentTypeInformation29 PmtTpInf?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 8}
    ISODate ReqdColltnDt;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 9}
    PartyIdentification272 Cdtr;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 10}
    CashAccount40 CdtrAcct;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 11}
    BranchAndFinancialInstitutionIdentification8 CdtrAgt;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 12}
    CashAccount40 CdtrAgtAcct?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 13}
    PartyIdentification272 UltmtCdtr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 14}
    ChargeBearerType1Code ChrgBr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 15}
    CashAccount40 ChrgsAcct?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 16}
    BranchAndFinancialInstitutionIdentification8 ChrgsAcctAgt?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 17}
    PartyIdentification272 CdtrSchmeId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 18}
    DirectDebitTransactionInformation32[] DrctDbtTxInf;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup40 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Priority2Code InstrPrty?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    ServiceLevel8Choice[] SvcLvl?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    LocalInstrument2Choice LclInstrm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    SequenceType3Code SeqTp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 5}
    CategoryPurpose1Choice CtgyPurp?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup41 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    DateAndPlaceOfBirth1 DtAndPlcOfBirth?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    GenericPersonIdentification2[] Othr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption20 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    ExternalPersonIdentification1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup42 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    AddressType3Choice AdrTp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Max140Text CareOf?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    Max70Text Dept?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    Max70Text SubDept?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 5}
    Max140Text StrtNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 6}
    Max16Text BldgNb?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 7}
    Max140Text BldgNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 8}
    Max70Text Flr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 9}
    Max16Text UnitNb?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 10}
    Max16Text PstBx?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 11}
    Max70Text Room?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 12}
    Max16Text PstCd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 13}
    Max140Text TwnNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 14}
    Max140Text TwnLctnNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 15}
    Max140Text DstrctNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 16}
    Max35Text CtrySubDvsn?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 17}
    CountryCode Ctry?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 18}
    Max70Text[] AdrLine?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup43 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    ProxyAccountType1Choice Tp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Max2048Text Id;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption21 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    ExternalProxyAccountType1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption22 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    ExternalPurpose1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup44 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    DocumentType1 Tp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text Nb?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    DateAndType1 RltdDt?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    DocumentLineInformation2[] LineDtls?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup45 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max140Text Nm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    CountryCode Ctry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup46 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    RegulatoryReportingType1Code DbtCdtRptgInd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    RegulatoryAuthority2 Authrty?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    StructuredRegulatoryReporting3[] Dtls?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup47 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    DocumentAmount1[] RmtAmtAndTp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    DocumentAdjustment1[] AdjstmntAmtAndRsn?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup48 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max140Text[] Ustrd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    StructuredRemittanceInformation18[] Strd?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup49 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text RmtId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    RemittanceLocationData2[] RmtLctnDtls?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup50 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    RemittanceLocationMethod2Code Mtd;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Max2048Text ElctrncAdr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    NameAndAddress18 PstlAdr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type ChoiceOption23 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    ExternalServiceLevel1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup51 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text Tp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    ISODate Dt?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    CountryCode Ctry?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    Max10Text Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 5}
    ActiveOrHistoricCurrencyAndAmount Amt?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 6}
    Max35Text[] Inf?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup52 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    ReferredDocumentInformation8[] RfrdDocInf?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    RemittanceAmount4 RfrdDocAmt?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    CreditorReferenceInformation3 CdtrRefInf?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    PartyIdentification272 Invcr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 5}
    PartyIdentification272 Invcee?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 6}
    TaxData1 TaxRmt?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 7}
    Garnishment4 GrnshmtRmt?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 8}
    Max140Text[] AddtlRmtInf?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup53 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max350Text PlcAndNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    SupplementaryDataEnvelope1 Envlp;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup54 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    @xmldata:Any
    anydata? anyElement;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup55 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    PercentageRate Rate?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    ActiveOrHistoricCurrencyAndAmount TaxblBaseAmt?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    ActiveOrHistoricCurrencyAndAmount TtlAmt?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    TaxRecordDetails3[] Dtls?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup56 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text Titl?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Max140Text Nm?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup57 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    TaxParty1 Cdtr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    TaxParty2 Dbtr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    TaxParty2 UltmtDbtr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    Max35Text AdmstnZone?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 5}
    Max140Text RefNb?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 6}
    Max35Text Mtd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 7}
    ActiveOrHistoricCurrencyAndAmount TtlTaxblBaseAmt?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 8}
    ActiveOrHistoricCurrencyAndAmount TtlTaxAmt?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 9}
    ISODate Dt?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 10}
    Number SeqNb?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 11}
    TaxRecord3[] Rcrd?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup58 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text TaxId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text RegnId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    Max35Text TaxTp?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup59 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text TaxId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text RegnId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    Max35Text TaxTp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    TaxAuthorisation1 Authstn?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup60 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    ISOYear Yr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    TaxRecordPeriod1Code Tp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    DatePeriod2 FrToDt?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup61 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text Tp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text Ctgy?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 3}
    Max35Text CtgyDtls?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 4}
    Max35Text DbtrSts?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 5}
    Max35Text CertId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 6}
    Max35Text FrmsCd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 7}
    TaxPeriod3 Prd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 8}
    TaxAmount3 TaxAmt?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 9}
    Max140Text AddtlInf?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
public type SequenceGroup62 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 1}
    TaxPeriod3 Prd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:pain.008.001.11"}
    @xmldata:SequenceOrder {value: 2}
    ActiveOrHistoricCurrencyAndAmount Amt;
|};
