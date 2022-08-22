This IG provides guidance for applying security labels in FHIR. Security labels are used in access control systems governing the collection, access, use, and disclosure of the target information to which they are assigned, as required by applicable organizational, jurisdictional, or personal policies related to privacy, security, and trust.

The syntactic and semantic rules of the [HL7 Healthcare Privacy and Security Classification System (HCS), Release 1 (HCS)](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=345) provide a conceptual framework for constructing security labels in order to convey computable and interoperable privacy, security, and trust policies. One of the goals of this IG is to provide guidance on how to map and model HCS concepts in FHIR.

From the outset, FHIR has supported security labels with a dedicated optional element ([`Resource.meta.security`](https://build.fhir.org/resource-definitions.html#Meta.security)) that can appear on any resource (regardless of resource type), therefore, enabling recording and processing of security labels in a unified manner. 
### Terminology Caveats
In FHIR, a security label is defined as a simple value of type [`Coding`](https://build.fhir.org/datatypes.html#Coding) which is composed of (among other details), a `code` and the identifier of the `system` in which the code is defined, together with a human readable `display` name for the `code`. For example, the following data structure represents a FHIR security label for _restricted_ confidentiality as defined by HL7 terminology: 

```json
{ 
  "system" : "http://terminology.hl7.org/CodeSystem/v3-Confidentiality",
  "code" : "R",
  "display" : "restricted"
 }
```

The HCS, however, defines Security Label as a different, more complex structure based on the concept of [Named Tag Set](glossary.html#named-tag-set). As implied by the title, a _Named Tag Set_ is a collection of _Tags_ together with a _Tag Set Name_. Each _Tag_ is a simple code and the _Tag Set Name_ assigns a name to the collection. Conceptually, this is equivalent to the following abstract object (note that this is not valid FHIR JSON and is presented only for conceptual clarity):
```json
{ 
  "TagSetName" : "some name",
  "Tags" : ["tag 1", "tag 2", "tag 3"],
 }
```

In HCS, A Security Label is defined as a composite structure of four _Named Tag Sets_ that record  _security classification_, _security category_, _security control_ (also known as _handling caveat_), and _security trust_. Conceptually, this would be equivalent to the following abstract object (note that this is not valid FHIR JSON and is presented only for conceptual clarity):

```json
[ 
  {
    "TagSetName" : "Security Classification",
    "Tags" : ["..."]
  },
  {
    "TagSetName" : "Security Category",
    "Tags" : ["..."]
  },
  {
    "TagSetName" : "Security Control",
    "Tags" : ["..."]
  },
  {
    "TagSetName" : "Security Trust",
    "Tags" : ["..."]
  }
]
```
As one can immediately notice, `TagSetName` is similar (although not quite conceptually identical) to the `system` attribute in a `Coding` data structure for a FHIR security label. Part of the contribution of this IG is to provide guidance on how to map the abstract structures defined by the HCS to FHIR. This is further discussed in detail in the section on [Security Labeling Conceptual Structure](concept.html), but it is important to bear in mind that the term "security label" refers to different concepts in HCS and in FHIR.

Another terminology caveat is the difference between _Tags_ in HCS and in FHIR. In FHIR, `meta.tag` is a data structure for capturing general metadata and observations about a resource and is a collection of objects of type [`Coding`](https://build.fhir.org/datatypes.html#Coding). _Tags_ in HCS, however, are opaque values (equivalent to the `code` in a `Coding` data structure).

### The Need for a FHIR DS4P Implementation Guide
The [FHIR Security Labels Module](http://hl7.org/fhir/security-labels.html) defines the core mechanism for assigning security labels to a FHIR resource and specifies some [Core Security Labels](http://hl7.org/fhir/security-labels.html#core), such as _purpose of use_ and _confidentiality_ tag sets. This IG expands on the baseline provided by [FHIR Security Labels Module](http://hl7.org/fhir/security-labels.html), particularly in the following areas:

- Differentiating which set of `Resource.meta.security` elements belongs to which policy in the (not uncommon) case where more than one policy applies to a resource, 

- Designating the entity responsible for classifying the content with the assigned security label, 

- Referencing related artifacts that are the basis for the policy being conveyed by the label, such as a patient privacy consent directive, the [trust contract](glossary.html#trust-contract) (which specifies agreed-upon system capabilities between the sender and the receiver), or the source of one or more provenance labels (e.g., FHIR Provenance resources),

- Requiring that a _privacy mark_ be displayed to end users, and

- Granular data segmentation at the sub-resource level, known as [inline labeling](inline.html).

### Trust and Enforcement
The [FHIR Security Label Module](http://hl7.org/fhir/security-labels.html) points out that security labels are intended to convey a policy to which participants in an exchange ecosystem are bound by a [trust contract](glossary.html#trust-contract):

_"Security labels are only a device to connect specific resources, bundles, or operations to a wider security framework; a full set of policy and consent statements and their consequent obligations is needed to give the labels meaning. Because of this, security labels are most effective in fully trusted environments - that is, where all trading partners have agreed to abide by them in a Mutual Trust Framework. Note also that security labels support policy, and specific tagging of individual resources is not always required to implement policy correctly."_

The [FHIR Security Label Module](http://hl7.org/fhir/security-labels.html) also notes that the recipient must implement and abide by the policies conveyed or implied by security labels: 

_"The intent of a security label is that the recipient of resources or bundles with security tags is obligated to enforce the handling caveats of the tags and carry the security labels forward as appropriate."_

These policies represented by security labels may be stipulated by laws and/or agreed to in contracts (e.g., [Data Use Reciprocal Service Agreements (DURSA)](glossary.html#dursa)). While such agreements are typically documented in the form of legal documents, they may also be established computably through [trust contracts](glossary.html#trust-contract) with system capability statements that are binding for the sender and receiver and describe: 

- how policy-specific security labels will be assigned, consumed, and persisted,
- reclassification rules, and
- any information-handling restrictions and obligations. 

The manner in which computable trust agreements may be negotiated, established, discovered, and shared in a federated ecosystem is described in the [HL7 Privacy and Security Architecture Framework, Volumes 1 & 2, Trust Framework for Federated Authorization Conceptual and Behavioral Models](http://www.hl7.org/implement/standards/la.cfm?file=/documentcenter/private/standards/HL7_V3_PSAF_R1_2020JUL_supplement.zip), which could be leveraged for trust agreements between senders and receivers of labeled HL7 content such as FHIR resources. This IG sets the groundwork for doing so in future iterations of this guide –as discussed in the Roadmap section below.

### Related Work 
HL7 has already developed HL7 Version 2 (V2) and Clinical Document Architecture (CDA) platform specific syntactical standards for segmenting information using security labels in accordance with the normative, platform independent [HL7 Healthcare Privacy and Security Classification System (HCS), Release 1 (HCS)](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=345) conceptual model.

The HL7 V2 security label guidance is incorporated in HL7 Version 2.9, Chapter 3, Patient Administration [Access Control Restriction Value Segment (ARV)](http://www.hl7.eu/refactored/segARV.html), and the Chapter 2 Control description of the [Batch Header Segment (BHS)](http://www.hl7.eu/refactored/segBHS.html), the [File Header Segment (FHS)](http://www.hl7.eu/refactored/segFHS.html), and the [Message Header Segment (MSH)](http://www.hl7.eu/refactored/segMSH.html). 

The [HL7 Implementation Guide: Data Segmentation for Privacy (DS4P) [for CDA], Release 1](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=354) specifies the use of security labeling at the CDA Header, Section and Entry levels.

In V2 and CDA, the HCS security label semantics are conveyed by assigning codes from normative HL7 security label value sets to the respective security label elements. This IG uses the same value sets as detailed in the [Value Set Summary](spec.html#value-sets-summary).

Note that the DS4P CDA IG is constrained to the "Basic Confidentiality" value set, a subset of the full Confidentiality code system, although this constraint does not apply to this IG. Therefore, the DS4P CDA IG will not be able to support security labels with Confidentiality codes `U` (unrestricted), `L` (low), and `M` (moderate).

In the US: 
- implementation of the CDA DS4P IG at the Header Level was included as an optional Certified EHR Certification criteria in the original 2015 Edition Health Information Technology (Health IT) Certification Criteria,  
[45 CFR § 170.315 - 2015 Edition Health IT Certification Criteria](https://www.law.cornell.edu/cfr/text/45/170.315) and ONC Health IT Certification Program Modifications ([Final Rule – October 16, 2015](https://www.federalregister.gov/articles/2015/10/16/2015-25597/2015-edition-health-information-technology-certification-criteria-2015-edition-base-electronic)).

- In [21st Century Cures Act: Interoperability, Information Blocking, and the ONC Health IT Certification Program](https://www.federalregister.gov/documents/2020/05/01/2020-07419/21st-century-cures-act-interoperability-information-blocking-and-the-onc-health-it-certification), the ONC revised the security tag certification criteria in [45 CFR § 170.315 - 2015 Edition health IT certification criteria](https://www.law.cornell.edu/cfr/text/45/170.315) at [(b)(7)](https://www.federalregister.gov/d/2020-07419/p-3368) and [(b)(8)](https://www.federalregister.gov/d/2020-07419/p-3371) by requiring certification at the more granular Section and Entry levels after December 31, 2022.

- According to the ONC [Certified HIT Product List (CHLP)](https://chpl.healthit.gov/#/search), 64 EHR Products are certified to meet segmentation at the Header level, which requires appropriately valuing the Clinical Document confidentiality element with a confidentiality code from the CDA Basic Confidentiality value set.  Two EHR Products have been certified to granular DS4P criteria updated in the 2020 CURES Rule.

- The [HL7 CDA® R2 Implementation Guide: Data Provenance, Release 1 - US Realm](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=420) provides more detailed description about all tags available for use in security labels, and how provenance capabilities in CDA can be used to persist a chain of security labels so as to, for example, record when a label was reclassified by a previous CDA author or custodian.

- Using security labels is an essential part of the [Share with Protections paradigm](glossary.html#share-with-protections) by enabling information to be shared after assigning the security labels specifying how the information can be used and the restrictions to which it may be subject.

### Intended Applications
This IG is policy agnostic. It provides a foundation for a variety of security labeling capabilities that systems may find useful for communicating policies governing information conveyed by FHIR Resources.
 
Generally, this guide is intended to be implemented as a tool to enable development of use-case-specific security labels. More specific implementation guides to address the requirements of specific use cases can be derived from this IG. It is necessary for solutions to be designed with a policy use case in mind to ensure that there's affirmation of technical support between systems, and a shared understanding of business obligations and policies represented by security labeled resources.

### Roadmap 
FHIR DS4P IG is an evolving specification that will encompass more capabilities in future ballots. Anticipated enhancements on the roadmap for the upcoming ballot cycles include:

- How security labels are used in Attribute Based Access Control (ABAC) 
- Use cases for security labels representing [trust contracts](glossary.html#trust-contract) and inclusion of trust tags in security labels generally to convey expectations of senders and receivers such as persisting labels and whether labels can be reclassified or removed
- Using Structured Definitions and Capability Statements as Security Policy Information Files (SPIF) to establish rules for constructing and interpreting shared security labels, which can be negotiated, executed, and registered in a discoverable manner
- Use of [Clinical Quality Language (CQL)](https://cql.hl7.org) to specify [security labeling rules](glossary.html#security-labeling-rule).
- Use of Business Process Modeling Notation (BPMN) to describe shared workflows in which labeled content is collected, accessed, used or disclosed.  Purpose of use labels are not sufficient to convey the activities that a policy may permit or deny a recipient to conduct. A security label conveying a FHIR Consent for example, where a patient only permits access and use, but not collection or disclosure of protected health information for treatment purposes in an emergency and inpatient setting needs more than a policy tag with a reference to the specific FHIR consent and a purpose of use tag for treatment.
- The range of use cases and possible algorithms for calculating a [High Water Mark (HWM)](glossary.html#hwm) and approaches for communicating how a HWM is intended to be understood and handled by receivers. See the HL7 FHIR Zulip thread, _[Meaning of Security Labels on Bundles](https://chat.fhir.org/#narrow/stream/179247-Security-and.20Privacy/topic/Meaning.20of.20Security.20Labels.20on.20Bundles)_ for some perspectives on the role of HWMs in FHIR.

### Walk-Through
The main sections of this IG are:

- Guidance
    - [Introduction](index.html)
    - [Background](background.html)
    - [Security Labeling FAQ](background.html#security-labeling-faq)
    - [Use Cases](usecases.html)
    - [Security Labeling Conceptual Structure](concept.html)
- Specification
    - [Detailed Specification](spec.html)
    - [Extensions Summary](spec.html#extensions-summary)
    - [Value Sets Summary](spec.html#value-sets-summary)
    - [Inline Security Labels](inline.html) 
    - [Inline Security Labels Sample Use Cases](inline.html#sample-use-cases)
    - [Security and Privacy Considerations](security.html)
- [Artifacts Index](artifacts.html)
    - [Structures: Extension Definitions](artifacts.html#structures-extension-definitions)
    - [Terminology: Value Sets](artifacts.html#terminology-value-sets)
    - [Examples](artifacts.html#example-example-instances)
- [Glossary](glossary.html)
- [Downloads](downloads.html)
- [Change Log](changes.html)

### Informative Sections
The following sections are informative:
- [Glossary](glossary.html)
- [Security Labeling FAQ](background.html#security-labeling-faq)
- [Use Cases](usecases.html)
- [Road Map](index.html#fhir-ds4p-ig-road-map)
