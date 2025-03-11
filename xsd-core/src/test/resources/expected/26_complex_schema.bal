import ballerina/data.xmldata;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public enum AddressType2Code {
    ADDR, PBOX, HOME, BIZZ, MLTO, DLVY
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type AddressType3Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption choiceOption;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type AnyBICDec2014Identifier string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type BICFIDec2014Identifier string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type BranchAndFinancialInstitutionIdentification8 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup sequenceGroup;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type BranchData5 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup1 sequenceGroup1;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type Case6 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup2 sequenceGroup2;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type CaseAssignment6 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup3 sequenceGroup3;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type ClearingSystemIdentification2Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption1 choiceOption1;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type ClearingSystemMemberIdentification2 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup4 sequenceGroup4;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type Contact13 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup5 sequenceGroup5;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type CountryCode string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type DateAndPlaceOfBirth1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup6 sequenceGroup6;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type Document record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup7 sequenceGroup7;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type DuplicateV07 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup8 sequenceGroup8;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type Exact4AlphaNumericText string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type ExternalClearingSystemIdentification1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type ExternalFinancialInstitutionIdentification1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type ExternalOrganisationIdentification1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type ExternalPersonIdentification1Code string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type FinancialIdentificationSchemeName1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption2 choiceOption2;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type FinancialInstitutionIdentification23 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup9 sequenceGroup9;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type GenericFinancialIdentification1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup10 sequenceGroup10;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type GenericIdentification30 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup11 sequenceGroup11;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type GenericOrganisationIdentification3 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup12 sequenceGroup12;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type GenericPersonIdentification2 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup13 sequenceGroup13;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type ISODate string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type ISODateTime string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type LEIIdentifier string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type Max128Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type Max140Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type Max16Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type Max2048Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type Max256Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type Max350Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type Max35Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type Max4Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type Max70Text string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public enum NamePrefix2Code {
    DOCT, MADM, MISS, MIST, MIKS
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type OrganisationIdentification39 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup14 sequenceGroup14;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type OrganisationIdentificationSchemeName1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption3 choiceOption3;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type OtherContact1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup15 sequenceGroup15;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type Party50Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption4 choiceOption4;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type Party52Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption5 choiceOption5;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type PartyIdentification272 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup16 sequenceGroup16;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type PersonIdentification18 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup17 sequenceGroup17;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type PersonIdentificationSchemeName1Choice record {|
    @xmldata:Choice {minOccurs: 1, maxOccurs: 1}
    ChoiceOption6 choiceOption6;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type PhoneNumber string;

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type PostalAddress27 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup18 sequenceGroup18;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public enum PreferredContactMethod2Code {
    MAIL, FAXX, LETT, CELL, ONLI, PHON
};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type ProprietaryData6 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup19 sequenceGroup19;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type ProprietaryData7 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup20 sequenceGroup20;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SkipPayload record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup21 sequenceGroup21;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SupplementaryData1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup22 sequenceGroup22;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SupplementaryDataEnvelope1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup23 sequenceGroup23;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type YesNoIndicator boolean;

@xmldata:Name {value: "Document"}
@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type Document1 record {|
    @xmldata:Sequence {minOccurs: 1, maxOccurs: 1}
    SequenceGroup7 sequenceGroup7;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type ChoiceOption record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    AddressType2Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    GenericIdentification30 Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    FinancialInstitutionIdentification23 FinInstnId;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 2}
    BranchData5 BrnchId?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup1 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text Id?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 2}
    LEIIdentifier LEI?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 3}
    Max140Text Nm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 4}
    PostalAddress27 PstlAdr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup2 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text Id;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 2}
    Party50Choice Cretr;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 3}
    YesNoIndicator ReopCaseIndctn?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup3 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text Id;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 2}
    Party50Choice Assgnr;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 3}
    Party50Choice Assgne;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 4}
    ISODateTime CreDtTm;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type ChoiceOption1 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    ExternalClearingSystemIdentification1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup4 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    ClearingSystemIdentification2Choice ClrSysId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text MmbId;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup5 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    NamePrefix2Code NmPrfx?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 2}
    Max140Text Nm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 3}
    PhoneNumber PhneNb?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 4}
    PhoneNumber MobNb?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 5}
    PhoneNumber FaxNb?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 6}
    Max2048Text URLAdr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 7}
    Max256Text EmailAdr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 8}
    Max35Text EmailPurp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 9}
    Max35Text JobTitl?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 10}
    Max35Text Rspnsblty?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 11}
    Max70Text Dept?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 12}
    OtherContact1[] Othr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 13}
    PreferredContactMethod2Code PrefrdMtd?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup6 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    ISODate BirthDt;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text PrvcOfBirth?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 3}
    Max35Text CityOfBirth;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 4}
    CountryCode CtryOfBirth;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup7 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    DuplicateV07 Dplct;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup8 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    CaseAssignment6 Assgnmt;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 2}
    Case6 Case?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 3}
    ProprietaryData7 Dplct;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 4}
    SupplementaryData1[] SplmtryData?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type ChoiceOption2 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    ExternalFinancialInstitutionIdentification1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup9 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    BICFIDec2014Identifier BICFI?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 2}
    ClearingSystemMemberIdentification2 ClrSysMmbId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 3}
    LEIIdentifier LEI?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 4}
    Max140Text Nm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 5}
    PostalAddress27 PstlAdr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 6}
    GenericFinancialIdentification1 Othr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup10 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text Id;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 2}
    FinancialIdentificationSchemeName1Choice SchmeNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 3}
    Max35Text Issr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup11 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Exact4AlphaNumericText Id;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 2}
    Max35Text Issr;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 3}
    Max35Text SchmeNm?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup12 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Max256Text Id;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 2}
    OrganisationIdentificationSchemeName1Choice SchmeNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 3}
    Max35Text Issr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup13 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Max256Text Id;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 2}
    PersonIdentificationSchemeName1Choice SchmeNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 3}
    Max35Text Issr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup14 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    AnyBICDec2014Identifier AnyBIC?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 2}
    LEIIdentifier LEI?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 3}
    GenericOrganisationIdentification3[] Othr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type ChoiceOption3 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    ExternalOrganisationIdentification1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup15 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Max4Text ChanlTp;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 2}
    Max128Text Id?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type ChoiceOption4 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    PartyIdentification272 Pty?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    BranchAndFinancialInstitutionIdentification8 Agt?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type ChoiceOption5 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    OrganisationIdentification39 OrgId?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    PersonIdentification18 PrvtId?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup16 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Max140Text Nm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 2}
    PostalAddress27 PstlAdr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 3}
    Party52Choice Id?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 4}
    CountryCode CtryOfRes?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 5}
    Contact13 CtctDtls?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup17 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    DateAndPlaceOfBirth1 DtAndPlcOfBirth?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 2}
    GenericPersonIdentification2[] Othr?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type ChoiceOption6 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    ExternalPersonIdentification1Code Cd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    Max35Text Prtry?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup18 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    AddressType3Choice AdrTp?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 2}
    Max140Text CareOf?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 3}
    Max70Text Dept?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 4}
    Max70Text SubDept?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 5}
    Max140Text StrtNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 6}
    Max16Text BldgNb?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 7}
    Max140Text BldgNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 8}
    Max70Text Flr?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 9}
    Max16Text UnitNb?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 10}
    Max16Text PstBx?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 11}
    Max70Text Room?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 12}
    Max16Text PstCd?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 13}
    Max140Text TwnNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 14}
    Max140Text TwnLctnNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 15}
    Max140Text DstrctNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 16}
    Max35Text CtrySubDvsn?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 17}
    CountryCode Ctry?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 18}
    Max70Text[] AdrLine?;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup19 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    SkipPayload Any;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup20 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Max35Text Tp;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 2}
    ProprietaryData6 Data;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup21 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    string \#content;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup22 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    Max350Text PlcAndNm?;
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 2}
    SupplementaryDataEnvelope1 Envlp;
|};

@xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
public type SequenceGroup23 record {|
    @xmldata:Namespace {uri: "urn:iso:std:iso:20022:tech:xsd:camt.034.001.07"}
    @xmldata:SequenceOrder {value: 1}
    string \#content;
|};
