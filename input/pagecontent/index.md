### Introduction
This IG provides guidance for applying security labels in FHIR. Security labels  are used in access control systems governing the collection, access, use, and disclosure of the target information, such as FHIR resource(s), as required by applicable organizational, jurisdictional, or personal policies related to privacy, security, and trust.

Using security labels is an essential part of the Share with Protection paradigm  by enabling information to be shared after assigning the security labels specifying how the information can be used and the restrictions to which it may be subject.  Regardless of the content syntax, “Security Labels enable more data to flow as they enable policy fragments to accompany the resource data.” [[FHIR Security Label Module](http://hl7.org/fhir/security-labels.html#6.1.1)].

While stated with respect to FHIR content, this holds for other labeled content as well, “The intent of a security label is that the recipient of resources or bundles with security tags is obligated to enforce the handling caveats of the tags and carry the security labels forward as appropriate.”

This IG describes how to structure FHIR security labels (in `Resource.meta.security` or [inline](inline.html) as defined by this IG) to meet the syntactic and semantic rules of the [HL7 Healthcare Privacy and Security Classification System (HCS), Release 1 (HCS)](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=345), and to convey computable and interoperable privacy, security, and trust policies within a policy domain, which are typically based on trust contracts with binding capability statements including recipient obligations.

HL7 has also developed standards for segmenting sensitive data for HL7 v2 and CDA using Security Labels in accordance with the normative [HL7 Healthcare Privacy and Security Classification System (HCS), Release 1 (HCS)](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=345).  

### The Need for a FHIR Security Labeling Implementation Guide 
Unlike HCS-based security labeling guidance provided by HL7 Version 2.9 and the [HL7 Implementation Guide: Data Segmentation for Privacy (DS4P), Release 1](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=354) and the [HL7 CDA® R2 Implementation Guide: Data Provenance, Release 1 - US Realm](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=420), there is a need for more detailed implementation guidance for FHIR implementers, which is reasonable given that the FHIR core is agnostic to the HCS syntax requirements.

That said, the [FHIR Security Label Module](http://hl7.org/fhir/security-labels.html) does specify several [Core Security Labels](http://hl7.org/fhir/security-labels.html#core), such as purpose of use and confidentiality tags. which all conformant FHIR Applications SHOULD use where appropriate. There are explanations about high water mark requirements, “break the glass”, and references to the HCS and its security label terminology.

Importantly, the Module points out that security labels are intended to convey a policy to which participants in an exchange ecosystem are bound by a trust contract:

“Security labels are only a device to connect specific resources, bundles, or operations to a wider security framework; a full set of policy and consent statements and their consequent obligations is needed to give the labels meaning. Because of this, security labels are most effective in fully trusted environments - that is, where all trading partners have agreed to abide by them in a Mutual Trust Framework. Note also that security labels support policy, and specific tagging of individual resources is not always required to implement policy correctly.”

However, the FHIR Security Label module provides only minimal detail about how to construct a label to convey a specific policy per the HCS or guidance on which security label values should be included to convey any particular privacy, security, or trust policy, particularly, because it does not provide an approach for: 
- Differentiating which set of `Resource.meta.security` elements belongs to which policy in the (not uncommon) case where more than one policy applies to a resource, and

- Granular data segmentation at the sub-resource level known as [inline labeling](inline.html).

An implementer relying on the general documentation of [`Resource.meta.security`](http://build.fhir.org/resource-definitions.html#Resource.meta) would not have the tools for labeling a resource which is, for example, governed under both US 42 CFR Part 2 for substance use disorder confidentiality and under CFR 32 Part 2002 for Control Unclassified Information (CUI), because there are no built-in security label “set” delimiters. To address this need, the FHIR DS4P IG specifies the [`sec-label-basis` extension](StructureDefinition-extension-sec-label-basis.html) which enables an implementer to group relevant  security label tags in `Resource.meta.security` into an HCS-conformant security label to represent each applicable policy as a separate _security label_.

### Technical Overview

This provides guidance in the following areas:

- Use Cases.
- FAQ.
- Conceptual Syntactic Structure.
- Constructing a Security Label to Convey a Policy.
- Assigning and Enforcing Security Labels.

### Informative Sections
The following sections are informative:
•	Glossary
•	FAQ
•	Use Cases

### Assigning Security Labels
The IG describes how to select a security label based on the HL7 Privacy and Security Healthcare Classification System (HCS) label adjudication algorithms, the value in establishing consensus on a default security label for representing policies or consent directives within an exchange ecosystem, and the value of establishing default security labels for information exchanged within the Trust Framework of a policy domain.

#### Consuming Security Labels
The IG describes how an Access Control System can use security labels to adjudicate responses to person- or population-based queries and pushed disclosures that meets the following criteria:

- Authorization Requirements specifying control over whether or not a client’s request for access to person- or population-level FHIR resources will be permitted.
          
- Filtering Requirements specifying, at a more fine-grained level, what resources will appear in the response to a request to access personal or population-level FHIR resources. This includes approaches to filtering for the minimum necessary information based on policy.

- Transformation Requirements specifying the requirements for applying functions or algorithms on the response to a request to access personal or population-level FHIR resources. Such algorithms modify and transform the content of a resource per applicable privacy/security policies and/or data subject's(s') consent directive.

- Provenance Requirements specifying the recording and consumption of provenance information in releasing or receiving personal or population-level FHIR resources.

#### Structure of `Resource.meta.security` and Extensions
The IG describes how to structure `Resource.meta.security` to meet the HL7 Healthcare Privacy and Security Classification System syntactic and semantic rules and convey computable and interoperable policy within a policy domain based on Trust Contracts with binding capability statements.

It also defines a set of extensions to enable specifying: 

- the manner in which "privacy marks" are rendered per Controlled Unclassified Information (CUI) requirements,

- the policy based on which the labels have been assigned (e.g., reference policy, contract, or consent directive instances),

- the related artifacts to that further explain or justify the label such as provenance or patient consent.

- the authority responsible for assigning security label, and whether a label has been upgraded, downgraded, or declassified.

#### Granular Labeling using Inline Security Labels
The IG also defines extension for [Inline Security Labels](inline.html). This enables more fine-grained security labels that only apply to a portion of the resource.

### Walk-Through
The main sections of this IG are:

- [Background](background.html)
- [Security Labeling Conceptual Structure](concept.html)
- [Inline Security Labels](inline.html) 
- [Detailed Specification](spec.html)
- [Artifacts Index](artifacts.html)
- [Security and Privacy Considerations](security.html)
- [Glossary](glossary.html)
- [Downloads](downloads.html)
