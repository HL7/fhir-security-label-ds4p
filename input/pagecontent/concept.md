
### FHIR DS4P IG Goal
The goal of this specification is to develop implementation guidance for the use of security labels based on the syntactical structure for security labeling as defined in the [HL7 Healthcare Privacy and Security Classification System (HCS), Release 1 (HCS)](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=345), in FHIR `Resource.meta.security` as well as the sub-resource level. The HCS is the normative conceptual model upon which  [HL7 Messaging Version 2.9](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=516), the [HL7 Implementation Guide: Data Segmentation for Privacy (DS4P), Release 1](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=354), and the [HL7 CDA® R2 Implementation Guide: Data Provenance, Release 1 - US Realm](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=420) are based. The syntactical structure of security labels dictates how HL7 security labeling terminology is used to populate specific fields or [Named Tag Sets](glossary.html#named-tag-set) in a security label with appropriate "Security Label Tags" in order to represent a computable policy.

In addition, there is a need for guidance and examples for how a community can develop consensus security labels for specific policies to minimize variance in policy representations in order to ensure uniform enforcement among trading partners.

### Security Labeling requires Classification

Classification is the act or process by which information is assigned a level of confidentiality protection. Classification is conducted by a _classifier_, which controls the classified information and has the authority to determine the appropriate level of protection. 
Note that there may be more than one classifier during the lifetime of the information since custodians of the information are sometimes authorized by policy to change the classification. Not every custodian of information is a classifier, however, and some custodians do not have the authority to change the classification. Downstream classifiers may be required by policies to retain security labels assigned by previous classifiers.

The appropriate level of confidentiality protection is determined by the classifier’s assessment of the disclosure risks, usually identified by the magnitude or type of damage caused by disclosure, such as the risk of harm (including reputational harm), discrimination, or safety to an individual. 

The appropriate level of confidentiality protection for a type of sensitive information is  dictated by jurisdictional, organizational, or individual policy. HL7 HCS leverages the security label models from foundational standards as diagrammed at a high level below and available in detail [here](hcs-detail.png).

![HCS](hcs.png)
<br clear="all" />

The HCS designates the following four Named Tag Set fields: 
- Security Classification, 
- Security Category, 
- Security Control (aka Handling Caveat), and 
- Security Trust

A Named Tag Set is a field type within a security label, which has characteristics that indicate what types of elements or [Tag Set Names](glossary.html#tag-set-name) it may contain.

A [Tag Set Name](glossary.html#tag-set-name) is the identifier associated with a set of security tags (aka “privacy tags”). In HL7 terms, this is the name of the value set from which allowable codes may be drawn to populate a Named Tag Set field.

The HCS adopted characteristics for these that follow the allowable types specified in the foundational standards, which are suitable for conveying policies governing access control in healthcare. For example, the Security Classification Label Field is mandatory and only one value from the HL7 Confidentiality code system is permitted (`[1..1]`), because this field is used to determine whether a requester meets the minimum bar for accessing information protected at or below a given level of confidentiality protection. For this reason, the Confidentiality code system is a total range hierarchy of protection levels. In HCS terms, a Confidentiality code is an essential element and the minimum bar for a compliant security label.

Unlike Security Classification, all of the other Named Tag Set fields are non-hierarchical and are not mandatory, i.e., `[0..*]` unless required by a policy. Their characteristics, how they are assigned to convey policy, and how they are used for access control is discussed below.  The following discussion is high level.  For a more complete explanation of the terms, please reference the definitions of the Named Tag Sets and the [Tag Set Names](glossary.html#tag-set-name) included in the [Detailed Specification Value Sets Summary](spec.html#value-sets-summary).

### How to assign a Security Label
Generally, a Security Label is assigned in accordance with a policy, which deems an aspect of a valued information object warrant a level of confidentiality protection. The policy is _based on an assessment of the potential impact that a loss of confidentiality, integrity, or availability of such information or information system would have on organizational operations, organizational assets, or individuals_ (this definition of Security Category is used in a number of NIST publications, which are listed [here](http://fismapedia.org/index.php/Security_Category)).


#### Step 1: Determine the Security Categories indicated by the policy governing the information
To be conveyed as a security label, a policy must categorize the aspects of information that require a specific level of confidentiality protection.  
These aspects are valued as "Tags" in the Security Category portion of a security label using the codes in the value sets associated with the Security Category [Tag Set Names](glossary.html#tag-set-name).

The current HCS-conformant Security Category [Tag Set Names](glossary.html#tag-set-name) are: Sensitivity, Policy, Compartment, Integrity, and Provenance. These value sets are listed in the [Detailed Specification Value Sets Summary](spec.html#value-sets-summary).

##### Assigning Sensitivity Tag `0..*`
Information Sensitivity is the characteristic of an IT resource which implies its value or importance and may include its vulnerability [[ISO 7498-2]](https://www.iso.org/standard/14256.html). Along with any relevant policy, information sensitivity is a strong determinant of the required level of confidentiality protection.

Sensitivity labels are determined based on the information conveyed by the resource, including structured information (such as clinical codes) as well as unstructured information (such as textual notes). A resource may also convey sensitive information indirectly (i.e., by inference) based on its association with other resources or information. For example, an appointment resource at a facility that is known to provides specialized care of a type that is considered sensitive, such as substance use treatment.

Assigning sensitivity labels, therefore, requires a deep analysis of the content of a resource (both explicit and implicit) as well as its links with other resources and entities.

##### Assigning Confidentiality Tag `1..1`
Confidentiality labels are assigned based on the sensitivity of the information contained in the resources. If the sensitive information increases the risk of subjecting the information target (i.e., a patient) to stigmatization or discrimination (which might in turn deter seeking treatment or other services), then, the need to protect the confidentiality of that information is more stringent than the “normal,” and therefore, the confidentiality protections will be heightened beyond the “normal.” 


**Examples from the US:**
In the US, the norm of confidentiality protections under HIPAA are the baseline policy. Privacy laws that preempt HIPAA by offering more stringent protections and heightened levels of confidentiality protection are assigned Security Labels with more restrictive Confidentiality Tag, i.e., `R` (restricted), for example, some state laws related to adolescent health or an individual’s HIV status.

In the US, information governed by privacy laws, which do not preempt HIPAA, such as protections under FTC, Workers Compensation, or Gramm-Leach-Bliley Act, will be assigned the Confidentiality Tag `M` (moderate).

Information governed by policies addressing ad hoc, extremely sensitive information, such as victim of abuse or a legal hold, are typically assigned `V` (very restricted) by privacy officials.

Sensitive information is data that must be protected from unauthorized access and disclosure to safeguard the privacy or security of an individual or organization. 

Sensitivity of information may be dictated by law, for example: 
- A law, such as 42 CFR Part 2, which dictates that information about an individual’s _substance use disorder_ is sensitive; 
- a law dictating that information custodians conduct a risk assessment of information sensitivity; or 
- by an individual with a right to opt-out of sharing behavioral health information through a Health Information Exchange network.

Depending on the policy context, the Authority determining information sensitivity may be a jurisdiction, an organization, or an individual. For example:

- In the US, HIPAA, 42 CFR Part 2, and Title 38 Section 7332 are Federal health privacy laws, which dictate that information relating to the diagnosis, treatment, or referral for specific conditions is deemed sensitive. 
- Many States have health privacy laws that are more stringent than HIPAA Privacy Rule, which is considered the US “norm” for the protection of Protected Health Information (PHI). This PHI is labeled with a Confidentiality Code `N`, meaning that the normal level of confidentiality protection applies. 
- Organizations may determine that some PHI is sensitive, and may therefore assign a higher level of confidentiality such as `R`, meaning that access/use/disclosure of this PHI is restricted. Under certain circumstances, organizations may determine that PHI is especially vulnerable to risk of stigmatization or harm. Such PHI is labeled with a Confidentiality Code `V`, meaning that access/use/disclosure is very restricted.
- Healthcare consumers and patients have discretion under some privacy laws to determine the sensitivity of their information, and may have the information custodian label their PHI with more or less restrictive Confidentiality Codes. For example:
    - Under HIPAA consent provisions, a patient may request that the Covered Entity custodian restrict access/use/disclosure of their PHI, and the Covered Entity may agree to this request by labeling with a Confidentiality Code `R` (restricted).
    - Under HIPAA Authorization for Disclosure, a patient requests that the Covered Entity custodian disclose PHI to a third party, which is not a Covered Entity. Since the third party is not a Covered Entity, the custodian labels the disclosed information, which is no longer PHI, with a Confidentiality Code `M` for moderate confidentiality protections afforded by other applicable laws, such as Worker Compensation privacy laws, or by the privacy policies and terms of service of an entity, which may be governed by Federal Trade Commission privacy laws.

##### Assigning Policy Tag – preferable `1..1`

It is critical that the policy dictating the sensitivity of labeled information be included in Security Label as the single Policy Tag indicating governed sensitive information, the level of confidentiality, other pertinent security categories relevant to the information, access limitations to a “compartment” of end users with a “need to know” such as a Care Team or Research Project.

If more than one policy applies to the information (e.g., the case with consent directives for Health Information Exchanges operating under multiple laws, or for compound research consent directives which combine both a privacy consent to disclose information for research, as well as consent to participate in a clinical study and to donate biospecimen) a best practice for interoperable consumption of labels is to create distinct labels for all aspects of such policies/consent directives.

##### Assigning Other Security Category Tags

Additional Security Category Tag Sets specified by policy may include compartment, integrity, provenance, and trust attributes pertinent to the governed information.  

##### Assigning Compartment `0..*`
A policy may require that the information may only be made available within a specific workflow or project, thereby isolating the information and limiting access to entities provisioned with [clearance](glossary.html#clearance) for that [compartment](glossary.html#compartment) (i.e., members of a group entitled to access). An entity’s access to information in a compartment may be further constrained by privileges based on roles or attributes.

##### Assigning Integrity `0..*` 
A policy may require that information be tagged to indicate confidence in its reliability, its status in being attested to or verified, any data alteration or syntactic/semantic transformation that it may have undergone, and whether it has been protected against any tampering or made non-repudiable. A hierarchical grading of confidence tag may be accompanied with other integrity or with provenance tags to support the assigned confidence level.

##### Assigning Provenance `0..*`
A policy may require that the provenance of the information be accessible to end users to assist with the determination of their level of confidence in the trustworthiness, authenticity, and reliability of the labeled information, and whether or not (or to what extent) the information has been exchanged only within a [trust framework](glossary.html#trust-framework) where exchange partners are bound to maintaining the integrity of the exchanged information. Provenance tags are not a replacement for a provenance record but can be considered a flag indicating that such a record may be important. For example, a patient reporting that a provider asserted the patient’s allergy has a different weight in terms of reliability than a provider asserting a patient reported family history.

#### Step 2: Determine the Security Classification Tag indicated by the Security Categories

##### Assigning Confidentiality Tag `1..1`
A Confidentiality tag indicates the obligation of a custodian or receiver to ensure that the protected resource is not made available or disclosed to individuals, entities, or processes unless authorized per applicable policies. Confidentiality codes may also be used in the clearances of initiators requesting access to protected resources. 

According to the [HL7 Healthcare Privacy and Security Classification System (HCS), Release 1](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=345), one, and only one, Confidentiality Tag code is assigned by a Custodian (information holder) to a Security Label when “classifying” the information. The Custodian may be the originator of the information to be protected, a Receiver of information from the Custodian, and may further disclose that information to a downstream Recipient. Any Custodian may be permitted to reclassify information per applicable policies and trading partner agreements.

The confidentiality protection afforded to sensitive information differs by applicable law. For example, in the US, HIV-sensitive information has “normal” (`N`) level of confidentiality if governed by HIPAA. However, if HIV sensitive information is governed under Title 38 Section 7332, 42 CFR Part 2 (as co-morbid with substance use disorder), or under some state laws, the level of confidentiality protection is coded as “restricted” (`R`), because these laws are more protective than HIPAA. 

The criterion for assigning HL7 confidentiality codes is whether applicable policy deems the misuse of information as posing a greater or lesser risk of harm to or stigmatization of the data subject or an organization. The information may be about a sensitive health condition, but not necessarily so; for example, it could be business- or security-policy- sensitive.

The following HL7 Confidentiality Code criteria are intended to meet a healthcare-specific multi-level security model for access control by stipulating clearly distinguishable levels of protection, which can be specialized by realm:

- _Unrestricted_: The “unrestricted” confidentiality code applies to sensitive and non-sensitive information that has been disclosed with few or no restrictions on its use, which may be stipulated contractually between the data subject and a data user (e.g., via terms of service or data user privacy policies such as disclosure for marketing purposes or on social media).
- _Low_: The “low” confidentiality code applies to sensitive and non-sensitive information that has been altered in such a way as to minimize the need for confidentiality protections with some residual risks associated with re-linking.
- _Moderate_: The “moderate” confidentiality code lessens the “normative” level of protection in a policy domain based on a data subject’s authorization to disclose for purposes of policy domains outside the context of normal healthcare delivery (i.e., Treatment, Payment, and Healthcare Operations); for example, for research, coverage determination such as Social Security Administration(SSA), personal health record systems/apps, or marketing, where other privacy laws may apply.
- _Normal_: The “normal” confidentiality code applies the “normative” level of protection to sensitive and non-sensitive information within the context of healthcare delivery in a general policy domain (e.g., HIPAA in US, GDPR in EU).
- _Restricted_: The “restricted” confidentiality code applies when a narrower policy domain preempts the “normative” level of protection in a wider policy domain (e.g., HIPAA in US, GDPR in EU) of sensitive information within the context of healthcare delivery. Examples in the US include State behavioral health, reproductive health, minors’ health, and HIV laws, Medicaid Confidentiality, [Title 38 Section 7332](https://www.law.cornell.edu/uscode/text/38/7332), [42 CFR Part 2](https://www.law.cornell.edu/cfr/text/42/part-2), and terms and conditions of federal grant programs such as community health centers ([42 CFR 51c.110](https://www.law.cornell.edu/cfr/text/42/51c.110)) and the Title X Program.
- _Very Restricted_: The “very restricted” confidentiality code applies to sensitive and non-sensitive information, and raises the level of protection beyond “normal” or “restricted” in ad hoc situations such as legal hold or patient safety.

The descriptions of Confidentiality Codes are based on variance from “normative” level of protection as a metric for differentiating the total order hierarchical demarcations for this multi-level security model.

This results in the following hierarchy from high to low (a _total order_): _Very Restricted_ (`V`), _Restricted_ (`R`), _Normal_ (`N`), _Moderate_ (`M`), _Low_ (`L`), and _Unrestricted_ (`U`), where _Very Restricted_ is the parent, and each subsequent label _is-a_ lesser protection level than its predecessor with _Unrestricted_ being the lowest protection level:

-   _Unrestricted_ (`U`) is the lowest protection level, less protective than `V`, `R`, `N`, `M`, and `L`.
-   _Low_ (`L`) is less protective than `V`, `R`, `N`, and `M`, but more protective than `U`.
-   _Moderate_ (`M`) is less protective than `V`, `R`, and `N`, but more protective than  `L` and `U`.
-   _Normal_ (`N`) is less protective than `V` and `R`, but more protective than `M`, `L`, and `U`.
-   _Restricted_ (`R`) is less protective than `V`, but more protective than `N`, `M`, `L`, and `U`.
-   _Very Restricted_ (`V`) is the highest protection level, more protective than `R`, `N`, `M`, `L`, and `U`.

#### Step 3: Determine the Security Control Tags indicated by the Security Categories
This is to convey the handling instructions or “caveats” to which senders and receivers must comply to access information labeled with specific Security Category tags (e.g., sensitivity tags). This security label includes `0..*` Security Control Tags, each of which may have `1..*` values.

##### HCS Handling Caveat Description
Handling caveats are instructions about mandatory and prohibited actions (obligations and refrain policies) within a permitted use context or “purpose of use”.

Assign handling caveats as [access control decision information](glossary.html#adi) to an information resource as required by policy to obtain an end-user’s implicit or explicit acceptance of a source rule prior to use or access.

The acceptance of a handling caveat may be implicit (e.g., in an Memorandum of Understanding, Data Use and Reciprocal Support Agreement, or contract) or explicit as in a returned response (e.g. a promise). The pre-established [trust framework](glossary.html#trust-framework) defines specific rules for complying with such handling caveat codes.  

The Security Controls include: 

-	Purpose of Use, which are limitations on what a recipient may do with the information.
-	Obligations and Refrains, operations (specified in a policy) which are to be performed (or not performed) in conjunction with the enforcement of an authorization decision.
-	Privacy Marks, which are mandatory information that must be rendered to end users, such as a marking indicating that the information is a _copy_ or a _draft_.

##### Assigning Purpose of Use Tags `0..*`
Purpose of Use (POU) tags indicates the circumstances under which an authorized receiver is permitted by policy to perform an activity (e.g., create, collect, access, use, or disclose). Information privacy, security, and trust policies typically include the list of permissible actions, to which senders require receivers to limit use. 

The HL7 POU codes were drawn from a number of narrower US and international POU code systems, augmented with new use cases (e.g., research, healthcare payment and operations, quality measures, legal and public health) and organized according to workflows in order to ensure comprehensive coverage for healthcare activities.

##### Assigning Obligation Tags `0..*`
Obligations tags represent explicit mandatory actions which may be required by the policies of custodians, senders, and receivers about how information is to be handled and actions specified to be performed in conjunction with enforcement of an access control decision. For example, instructions to disclose only the minimum necessary and to encrypt while in transit.  

##### Assigning Refrain Tags `0..*`
Refrain tags represent explicitly-prohibited actions which may be required by the policies of custodians, senders, and receivers about how information is not to be handled and actions not to be performed. Examples are constraints on collection, disclosure, routing, and communication path expected to be enforced by access control systems, a prohibition on persisting information for purposes other than explicitly permitted, and no re-disclosure without patient consent.

##### Assigning Privacy Marks `0..*`
Privacy Marks are human-readable security labels on accessed electronic information, such as markings rendered in the user interface or in a printout.

Per [ISO 22600-3 (Section A.3.4.3)](https://www.iso.org/standard/62655.html), privacy marks are not used for access control. _The content of the privacy-mark may be defined by the security policy in force (identified by the security-policy-identifier) which may define a list of values to be used. Alternately, the value may be determined by the originator of the security-label._ 

### Security Label with Example Tags
![HCS](hcs-example.png)
<br clear="all" />
