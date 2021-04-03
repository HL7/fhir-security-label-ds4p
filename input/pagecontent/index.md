### Introduction
This IG provides guidance for applying security labels in FHIR. Security labels are used in access control systems governing the collection, access, use, and disclosure of the target FHIR Resource(s) as required by applicable organizational, jurisdictional, or personal policies. Using security labels is an essential part of the _share with protection_ paradigm by enabling sharing information after assigning the security labels that specify how the information can be used and subject to what restrictions.

### Technical Overview

This provides guidance in the following areas:

#### Assigning Security Labels
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
- [Inline Security Labels](inline.html) 
- [Detailed Specification](spec.html)
- [Security and Privacy Considerations](security.html)
- [Downloads](downloads.html)
