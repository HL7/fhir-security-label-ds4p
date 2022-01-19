### Introduction
This IG provides guidance for applying security labels in FHIR. Security labels are used in access control systems governing the collection, access, use, and disclosure of the target information to which they are assigned, as required by applicable organizational, jurisdictional, or personal policies related to privacy, security, and trust.

Using security labels is an essential part of [the Share with Protection paradigm](https://confluence.hl7.org/display/SEC/Share+with+Protections+White+Paper+Project) by enabling information to be shared after assigning the security labels specifying how the information can be used and the restrictions to which it may be subject.

The syntactic and semantic rules of the [HL7 Healthcare Privacy and Security Classification System (HCS), Release 1 (HCS)](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=345) specify conceptually how to construct security labels in order to convey computable and interoperable privacy, security, and trust policies within a policy domain.

As quoted above from the [FHIR Security Label Module](http://hl7.org/fhir/security-labels.html), the caveat that the recipient must implement and enforce policies holds for labeled content: _The intent of a security label is that the recipient of resources or bundles with security tags is obligated to enforce the handling caveats of the tags and carry the security labels forward as appropriate._

These policies represented by security labels may be stipulated by laws and/or agreed to in contracts, such as Data Use Reciprocal Service Agreements (DURSA).  While such agreements are typically documented in hard-copy media, they may also be established computably through trust contracts with binding sender and receiver system capability statements about how policy specific security labels will be assigned, consumed, persisted, reclassification rules, and any information handling restrictions and obligations.  The manner in which computable trust agreements may be negotiated, established, discovered and shared in a federated ecosystem is described in the [HL7 Privacy and Security Architecture Framework](http://www.hl7.org/implement/standards/la.cfm?file=/documentcenter/private/standards/HL7_V3_PSAF_R1_2020JUL_supplement.zip) Volumes 1 & 2 Trust Framework for Federated Authorization Conceptual and Behavioral Models, which could be leveraged for trust agreements between senders and receivers of labeled HL7 content. This IG sets the groundwork for doing so in future iterations of this guide as discussed in the Roadmap section below.

HL7 has already developed HL7 Version 2 (V2) and Clinical Document Architecture (CDA) platform specific syntactical standards for segmenting information using security labels in accordance with the normative, platform independent [HL7 Healthcare Privacy and Security Classification System (HCS), Release 1 (HCS)](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=345) conceptual model.

The HL7 V2 security label guidance is incorporated in HL7 Version 2.9, Chapter 3, Patient Administration [Access Control Restriction Value Segment (ARV)](http://www.hl7.eu/refactored/segARV.html), and the Chapter 2 Control description of the [Batch Header Segment (BHS)](http://www.hl7.eu/refactored/segBHS.html), the [File Header Segment (FHS)](http://www.hl7.eu/refactored/segFHS.html), and the [Message Header Segment (MSH)](http://www.hl7.eu/refactored/segMSH.html). 

The [HL7 Implementation Guide: Data Segmentation for Privacy (DS4P) [for CDA], Release 1](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=354) specifies the use of security labeling at the CDA Header, Section and Entry levels.

Implementation of the CDA DS4P IG at the Header Level was included as an optional Certified EHR Certification criteria in the original 2015 Edition Health Information Technology (Health IT) Certification Criteria, 2015 Edition Base Electronic Health Record (EHR) Definition, and ONC Health IT Certification Program Modifications [[1]](index.html#end-notes) ([Final Rule – October 16, 2015](https://www.federalregister.gov/articles/2015/10/16/2015-25597/2015-edition-health-information-technology-certification-criteria-2015-edition-base-electronic)).

In the [21st Century Cures Act: Interoperability, Information Blocking, and the ONC Health IT Certification Program](https://www.federalregister.gov/documents/2020/05/01/2020-07419/21st-century-cures-act-interoperability-information-blocking-and-the-onc-health-it-certification), ONC revised the security tag certification criteria in [45 CFR § 170.315 - 2015 Edition health IT certification criteria](https://www.law.cornell.edu/cfr/text/45/170.315) at [(b)(7)](https://www.federalregister.gov/d/2020-07419/p-3368) and [(b)(8)](https://www.federalregister.gov/d/2020-07419/p-3371) by requiring certification at the more granular Section and Entry levels after December 31, 2022.

According to the ONC [Certified HIT Product List (CHLP)](https://chpl.healthit.gov/#/search), 64 EHR Products are certified to meet segmentation at the Header level, which requires appropriately valuing the Clinical Document confidentiality element with a confidentiality code from the CDA Basic Confidentiality value set.  Two EHR Products have been certified to granular DS4P criteria updated in the 2020 CURES Rule.

The [HL7 CDA® R2 Implementation Guide: Data Provenance, Release 1 - US Realm](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=420) provides more detailed description about all tags available for use in security labels, and how provenance capabilities in CDA can be used to persist a chain of security labels so as to, for example, record when a label was reclassified by a previous CDA author or custodian. 

The HCS security label semantics are conveyed in V2 and CDA content by valuing the security label tag elements within their security label syntactic structures with codes from normative HL7 security label value sets. The FHIR DS4P IG binding to the same value sets as specified in the [Value Set Summary](spec.html#value-sets-summary).

### The Need for a FHIR DS4P Implementation Guide
Unlike HCS-based security labeling guidance provided by HL7 Version 2.9, the  [CDA Data Segmentation for Privacy (DS4P) Implementation Guide](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=354), and the [CDA Data Provenance IG](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=420), the [FHIR Security Label Module](http://hl7.org/fhir/security-labels.html#6.1.1) does not provide detailed implementation guidance for FHIR implementers, because the FHIR core is agnostic to the HCS syntax requirements (although this guidance will likely be updated to reflect this IG’s specifications to some extent.)

The [FHIR Security Label Module](http://hl7.org/fhir/security-labels.html) specifies several [Core Security Labels](http://hl7.org/fhir/security-labels.html#core), such as purpose of use and confidentiality tags, which all conformant FHIR Applications SHOULD use where appropriate. There are explanations about high-water mark requirements, “break the glass”, and references to the HCS and its security label terminology.

Importantly, the [FHIR Security Label Module](http://hl7.org/fhir/security-labels.html) points out that security labels are intended to convey a policy to which participants in an exchange ecosystem are bound by a trust contract:

_“Security labels are only a device to connect specific resources, bundles, or operations to a wider security framework; a full set of policy and consent statements and their consequent obligations is needed to give the labels meaning. Because of this, security labels are most effective in fully trusted environments - that is, where all trading partners have agreed to abide by them in a Mutual Trust Framework. Note also that security labels support policy, and specific tagging of individual resources is not always required to implement policy correctly.”_

However, the FHIR Security Label module provides only some minimal details about how to construct a label to convey a specific policy per the HCS or guidance on which security label values should be included to convey any particular privacy, security, or trust policy, particularly because it does not provide an approach for: 
- Differentiating which set of `Resource.meta.security` elements belongs to which policy in the (not uncommon) case where more than one policy applies to a resource, 

- Designating the entity responsible for classifying the content with the assigned security label 

- Referencing related artifacts that are the basis for the policy being conveyed by the label, such as a patient privacy consent directive, the trust contract, which specifies agreed to  sender and receiver system capabilities, or the source of one or more provenance label tags, e.g., FHIR Provenance Resource(s)

- Requiring that a Privacy Mark tag be displayed to end users

- Granular data segmentation at the sub-resource level known as [inline labeling](inline.html).

An implementer relying on the general documentation of [`Resource.meta.security`](http://build.fhir.org/resource-definitions.html#Resource.meta) would not have the tools for labeling a resource which is, for example, governed under both US 42 CFR Part 2 for _substance use disorder_ confidentiality and under CFR 32 Part 2002 for _Controlled Unclassified Information (CUI)_, because there are no built-in security label “set” delimiters. To address this need, the FHIR DS4P IG specifies the [`sec-label-basis` extension](StructureDefinition-extension-sec-label-basis.html) which enables an implementer to group relevant  security label tags in `Resource.meta.security` into an HCS-conformant security label to represent each applicable policy as a separate _security label_.

Likewise, the [FHIR Security Label Module](http://hl7.org/fhir/security-labels.html) does not currently support an approach for the other capabilities listed above.  However, the additional capabilities for using labels to segment FHIR content to represent policies is not necessarily a short-coming. There may be use cases for labeling that are not policy driven, e.g., for general content management purposes. Another use case that might form the basis for a different FHIR Security IG could be labeling for access control and traceability of content creation and modifications such as a multiparty research or commercial development project.

While stated with respect to FHIR content, this [FHIR Security Label Module](http://hl7.org/fhir/security-labels.html) caveat holds for other labeled content as well: “The intent of a security label is that the recipient of resources or bundles with security tags is obligated to enforce the handling caveats of the tags and carry the security labels forward as appropriate.” And, regardless of the content syntax, “Security Labels enable more data to flow as they enable policy fragments to accompany the resource data.”

### Intended Applications

This guide provides a foundation for a variety of security labeling capabilities that systems may find useful to communicate the policy governing  information conveyed by concrete Resources. This IG is policy-agnostic.
 
Generally, this guide is not intended or expected to be implemented except as a tool to enable development of use case specific security labels.
 
The main utility of this IG is to enable the development of  privacy, security, provenance, or trust policy specific security label implementation guides to address use case requirements.
 
It is necessary for solutions to be designed with a policy use case in mind to ensure that there's affirmation of technical support between systems, and a shared understanding of business obligations required by the policy represented by security labeled resources.

### FHIR DS4P IG Road Map 
FHIR DS4P IG is an evolving specification that will encompass increasing capabilities in future ballots. Anticipated enhancements on the roadmap for the 2022 ballot cycles include clean up and additions to the label tag value sets as well as exploration of more new capabilities such as:
- How security labels are used in Attribute Based Access Control (ABAC) 
- Use cases for security labels representing trust contracts and inclusion of trust tags in security labels generally to convey expectations of senders and receivers such as persisting labels and whether labels can be reclassified or removed
- Using Structured Definitions and Capability Statements as Security Policy Information Files (SPIF) to establish rules for constructing and interpreting shared security labels, which can be negotiated, executed, and registered in a discoverable manner
- Use of [Clinical Quality Language (CQL)](https://cql.hl7.org) to specify the access control rules for enforcing security labels 
- Use of Business Process Modeling Notation (BPMN) to describe shared workflows in which labeled content is collected, accessed, used or disclosed.  Purpose of use labels are not sufficient to convey the activities that a policy may permit or deny a recipient to conduct. A security label conveying a FHIR Consent for example, where a patient only permits access and use, but not collection or disclosure of protected health information for treatment purposes in an emergency and inpatient setting needs more than a policy tag with a reference to the specific FHIR consent and a purpose of use tag for treatment.
- The range of use cases and possible algorithms for calculating a High Water Mark (HWM) and approaches for communicating how a HWM is intended to be understood and handled by receivers.  See the HL7 FHIR Zulip thread, _[Meaning of Security Labels on Bundles](https://chat.fhir.org/#narrow/stream/179247-Security-and.20Privacy/topic/Meaning.20of.20Security.20Labels.20on.20Bundles)_ for some perspectives on the role of HWMs in FHIR.

### Walk-Through
The main sections of this IG are:

- Guidance
    - [Introduction](index.html)
    - [Background](background.html)
    - [Security Labeling FAQ](background.html#security-labeling-faq)
    - [Use Cases](background.html#use-cases)
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

### Informative Sections
The following sections are informative:
- [Glossary](glossary.html)
- [Security Labeling FAQ](background.html#security-labeling-faq)
- [Use Cases](background.html#use-cases)
- [Road Map](index.html#fhir-ds4p-ig-road-map)

### End Notes

[1] [45 CFR § 170.315 - 2015 Edition health IT certification criteria](https://www.law.cornell.edu/cfr/text/45/170.315)

_(7) Security tags - summary of care - send._

Enable a user to create a summary record formatted in accordance with the standard adopted in § 170.205(a)(4) that is tagged as restricted and subject to restrictions on re-disclosure according to the standard adopted in § 170.205(o)(1) at the:  
(i)Document, section, and entry (data element) level; or 
(ii)Document level for the period before December 31, 2022. 

_(8) Security tags - summary of care - receive._

(i) Enable a user to receive a summary record that is formatted in accordance with the standard adopted in § 170.205(a)(4) that is tagged as restricted and subject to restrictions on re-disclosure according to the standard adopted in § 170.205(o)(1) at the:  
(A) Document, section, and entry (data element) level; or 
(B)Document level for the period before December 31, 2022; and  
(ii)Preserve privacy markings to ensure fidelity to the tagging based on consent and with respect to sharing and re-disclosure restrictions.
