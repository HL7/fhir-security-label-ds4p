Concern is frequently raised that use of HL7 security labels for data segmentation for privacy results in information blocking in the context of treatment, even where the security labeling technology is used to enforce applicable privacy laws, resulting in "Swiss cheese" medical records. 

Security labeling technology is used for enforcing more than just privacy policies expressed as an individual's meaningful choice as afforded by law.  It is also used to enforce organizational and jurisdictional privacy, security, and business policies primarily to computably determine whether a requester to collect, access, use, disclose or receive information should be permitted to do so and what, if any, security controls are required by senders and receivers such as limitation on workflows/contexts in which the information may be handled, and obligations and prohibitions related to handling the information. 

Security labeling technology also includes risk mitigation techniques to ensure that policy priorities prevail when risks related to security labeling must be averted, such enabling a Clinical Decision Support Systems to alert clinicians about the potential for a patient safety issue related to filtered health information, which the clinician might not have previously had a "need to know".

### Introduction

HL7 has developed standards for segmenting sensitive data for HL7 v2 and CDA using Security Labels in accordance with the [HL7 Healthcare Privacy and Security Classification System (HCS), Release 1](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=345)(HCS).  No such guidance is available for FHIR implementers because the core is agnostic to the HCS syntax requirements.

There is a need to develop FHIR implementation guidance for the use of FHIR `Resource.meta.security` labels to emulate the syntactical structure for security labeling as defined in the HL7 HCS, which is the normative, conceptual model upon which both HL7 v2 and the Data Segmentation for Privacy CDA IG are based. The syntactical structure of security labels dictates how the security tag sets (HL7 security labeling terminology) are used to populate specific fields in a security label with appropriate tags so as to represent a computable policy.  

In addition, there is a need for guidance and examples for how a community can develop consensus security labels for specific policies to minimize variance in policy representations, to ensure uniform enforcement among trading partners.

#### Security Labeling Conceptual Guidance


##### How to assign a Security Label

Generally, a Security Label is assigned based on a policy specifying sensitive information. If the sensitive information increases the risk of the information target (i.e., a patient) to stigmatization or discrimination, which might in turn deter the information target seeking treatment or services for the sensitive information, then the need to protect the confidentiality of that information is more stringent than the "normal" confidentiality protections afforded most health information, so, the Confidentiality protections will be heightened beyond the "norm". 

In the US, the norm of confidentiality protections under HIPAA are the baseline. Privacy laws that preempt HIPAA by offering more stringent protections, which require heightened levels of Confidentiality protection are assigned Security Labels with more restrictive Confidentiality tag, i.e., `R` (restricted).  

Information governed by privacy laws, which do not preempt HIPAA, such as protections under FTC, Workers Compensation, or Gramm-Leach-Bliley Act, will be assigned the Confidentiality tag `M` (moderate).

Information governed by policies addressing ad hoc, extremely sensitive information, such as victim of abuse or a legal hold, are typically assigned `VR` (very restricted) by privacy officials.

It is critical that the policy dictating the sensitivity of labeled information be included in Security Label as the single Policy Tag indicating governed sensitive information, the level of confidentiality, other pertinent security categories relevant to the information, access limitations to a "compartment" of end users with a "need to know" such as a Care Team or Research Project.

In addition, the driving policy may include the need to specify:

-   The integrity, provenance, and trust attributes pertinent to the governed information.  For example, policy may require that only legally-attested information is available to those other than the author; that any syntactic/semantic transformation of the information is known by end users; that the provenance of the information be accessible to end users to determine their level of confidence in the trustworthiness, authenticity, and reliability of the labeled information; and the degree to which the information has been exchanged within a trust framework. 

-   The handling instructions to which Senders and Receivers must comply including:

    -   _Purpose of Use_: Limitations on the contexts and processes in which the information may be collected, accessed, used, and disclosed.
    -   _Obligation Policies_: Mandated Sender and Receiver actions.
    -   _Refrain Policies_: Prohibitions on Sender and Receiver actions.

**Classification**

Classification is the act or process by which information, which is determined to be sensitive or non-sensitive per applicable policy, is assigned a level of Confidentiality protection.

Classification is at the discretion of the Authority (Classifier), which controls the classified information, and determines the appropriate level of protection, i.e., the confidentiality of the information. A Classifier may be required to retain the Security Label assigned by a previous Classifier per policy or trading partner agreement.

The appropriate level of confidentiality protection is determined by the Classifier's assessment of the disclosure risks of the information, which usually are identified by the magnitude, amount or kind of damage that could be caused by disclosure, such as the risk of harm, discrimination, or safety to an individual.  The level of confidentiality protection for a type of sensitive information is set by jurisdictional, organizational, or individual data subject policy.

**Confidentiality Tags**

According to the [HL7 Healthcare Privacy and Security Classification System (HCS), Release 1](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=345) (HCS), one, and only one, Confidentiality Tag code is assigned by a Custodian (information holder) to a Security Label when "classifying" the information. The Custodian may be the originator of the information to be protected, a Receiver of information from the Custodian, and may further disclose that information to a downstream Recipient. Any Custodian may be permitted to reclassify information per applicable policies and trading partner agreements.

The confidentiality protection afforded sensitive information differs by applicable law. For example, in the US, HIV sensitive information has "normal" (the norm) level of confidentiality if governed by HIPAA. However, if HIV sensitive information is governed under Title 38 Section 7332, 42 CFR Part 2 (as comorbid with substance use disorder), or under some state laws, the level of confidentiality protection is coded as "restricted", because these laws are more protective than HIPAA. 

The criterion for assigning HL7 confidentiality codes is whether applicable policy deems the misuse of information as posing a greater or lesser risk of harm to or stigmatization of the data subject or an organization. The information may be about a sensitive health condition, but not necessarily, for example, it could be Business or Security policy sensitive.

The following HL7 Confidentiality code criteria are intended to meet a healthcare-specific multi-level security model for access control by stipulating clearly distinguishable levels of protection, which can be specialized by realm:

-   _Normal_: The "normal" confidentiality code applies the "normative" level of protection to sensitive and non-sensitive information within the context of healthcare delivery in a general policy domain (e.g., HIPAA in US, GDPR in EU).
-   _Restricted_: The "restricted" confidentiality code applies when a narrower policy domain preempts the "normative" level of protection in a wider policy domain (e.g., HIPAA in US, GDPR in EU) of sensitive information within the context of healthcare delivery. Examples include State behavioral health, reproductive health, minors' health, and HIV laws; Medicaid Confidentiality; Title 38 Section 7332; and 42 CFR Part 2.
-   _Moderate_: The "moderate" confidentiality code lessens the "normative" level of protection in a policy domain based on a data subject's authorization to disclose for purposes of policy domains outside the context of healthcare delivery, e.g., for research, coverage determination such as Social Security Administration(SSA), personal health record systems/apps, marketing where other privacy laws may apply.
-   _Very Restricted_: The "very restricted" confidentiality code applies to sensitive and non-sensitive information, and raises the level of protection beyond "normal" or "restricted" in ad hoc situations such as legal hold or patient safety.
-   _Low_: The "low" confidentiality code applies to sensitive and non-sensitive information that has been altered in such a way as to minimize the need for confidentiality protections with some residual risks associated with re-linking.
-   _Unrestricted_: The "unrestricted" confidentiality code applies to sensitive and non-sensitive information that has been disclosed with few or no restrictions on its use, which may be stipulated contractually between the data subject and a data user (e.g., via terms of service or data user privacy policies such as disclosure for marketing purposes or on social media).

The descriptions of Confidentiality codes are based on variance from "normative" level of protection as a metric for differentiating the total order hierarchical demarcations for this multi-level security model.

This results in the following subsumption relationships which form a hierarchy (or *total order*) in which Very Restricted is the parent and each lower child _IS-A_ lesser protection level than its predecessor with Unrestricted being the lowest protection level:

-   _Very Restricted_ (`V`) is the highest protection level and subsumes all other protection levels, i.e. `R`, `N`, `M`, `L`, and `U`.
-   _Restricted_ (`R`) is less protective than `V`, and subsumes all other protection levels, i.e. `N`, `M`, `L`, and `U`.
-   _Normal_ (`N`) is less protective than `V` and `R`, and subsumes all other protection levels, i.e. `M`, `L`, and `U`.
-   _Moderate_ (`M`) is less protective than `V`, `R`, and `N`, and subsumes all other protection levels, i.e. `L` and `U`.
-   _Low_ (`L`) is less protective than `V`, `R`, `N`, and `M`, and subsumes `U`.
-   _Unrestricted_ (`U`) is less protective than `V`, `R`, `N`, `M`, and `L`, and is the lowest protection levels.

**Sensitivity Tags**

Information Sensitivity is the  characteristic of an IT resource which implies its value or importance and may include its vulnerability (ISO 7492-2).  Privacy metadata for information perceived as undesirable to share (HL7 Healthcare Classification System).

Sensitive information is data that must be protected from unauthorized access and disclosure to safeguard the privacy or security of an individual or organization. 

Sensitivity of information may be dictated by law, for example: A law, such as 42 CFR Part 2, which dictates that information about an individual's substance use disorder is sensitive; a law dictating that information custodians conduct a risk assessment of information sensitivity; or by an individual with a right to opt-out of sharing behavioral health information through a Health Information Exchange network.

Depending on the policy context, the Authority determining information sensitivity may be a jurisdiction, an organization, or an individual.

-   For example, in the US, HIPAA, 42 CFR Part 2, and Title 38 Section 7332 are Federal health privacy laws, which dictate that information relating to the diagnosis, treatment, or referral for specific conditions is deemed sensitive. 
-   Many States have health privacy laws that are more stringent than HIPAA Privacy Rule, which is considered the US "norm" for the protection of Protected Health Information (PHI). This PHI is labeled with a Confidentiality code `N`, meaning that the normal level of confidentiality protection applies. 
-   Organizations may determine that some PHI is sensitive, and may therefore assign a higher level of confidentiality such as `R`, meaning that access/use/disclosure of this PHI is restricted. Under certain circumstances, organizations may determine that PHI is especially vulnerable to risk of stigmatization or harm.  This PHI is labeled with a Confidentiality code `V`, meaning that access/use/disclosure is very restricted.
-   Healthcare consumers and patients have discretion under some privacy laws to determine the sensitivity of their information, and may have the information custodian label their PHI with more or less restrictive Confidentiality codes. For example:

    -   Under HIPAA consent provisions, a patient may request that the Covered Entity custodian restricted access/use/disclosure of their PHI, and the Covered Entity may agree to this request by labeling with a Confidentiality code `R` (restricted).
    -   Under HIPAA Authorization for Disclosure, a patient requests that the Covered Entity custodian disclose PHI to a third party, which is not a Covered Entity. Since the third party is not a Covered Entity, the custodian labels the disclosed information, which is no longer PHI, with a Confidentiality code `M` for moderate confidentiality protections afforded by other applicable laws, such as Worker Compensation privacy laws, or by the privacy policies and terms of service of an entity, which may be governed by Federal Trade Commission privacy laws.

**Purpose of Use**

Purpose of Use codes are part of the Healthcare Privacy and Security Classification System (HCS) vocabulary, which have been adopted in HL7 Version 3, and are available for use in HL7 Version 2, CDA, and FHIR. A convenient place to find these online is in the FHIR Value Set [PurposeOfUse](http://build.fhir.org/v3/PurposeOfUse/vs.html).

POU codes indicate the circumstances under which an authorized recipient is permitted to perform a permitted activity such as create, collect, access, use, or disclose.

##### CUI Mark

Federal health agencies must evaluate their requirements for marking and managing Controlled Unclassified Information (CUI) (based on 32 CFR Part 2002 and Executive Order 13556).

Review of applicable CUI Authorities listed in the [NARA CUI Category List](https://www.archives.gov/cui/registry/category-list) indicates that _General Privacy_ and _Health Information_ categories pertain to Federal HIE key lines of business for HIPAA Covered Transactions, and for HIPAA Authorized Disclosures.

Key Federal healthcare CUI is disseminated with trading partners including:

- Other Federal agencies
- Non-executive branch agencies -- judiciary, research, educational institutions
- Health Oversight agencies
- Contracted providers, payers, intermediaries
- Private sector providers, payers, intermediaries, & HIEs

CUI Recipients of federal health CUI must manage persist, and enforce CUI security controls as well as apply marking to further disclosed CUI.

**Interoperability Issue**

If CUI markings on some HIE content differ, recipients will have difficulty discerning their security control requirements. If each agency adopts a different CUI marking policy, the burden on downstream HIE participants would increase exponentially. Federal Agencies in collaboration with Sequoia are working towards a consensus policy for marking CUI to ensure that the burden on downstream HIE participants is minimized.

**CUI Solutions**

Easing CUI implementation is possible if agencies decide on a consensus CUI marking based on the adoption of standard HL7 CUI codes ensures interoperability across HL7 Version 2, CDA, and FHIR content using syntax specific security labeling.

**CUI Reference Material**
- [Executive Order 13556](https://www.federalregister.gov/articles/2010/11/09/2010-28360/controlled-unclassified-information)
- [Controlled Unclassified Information Executive Order 13556 presentation](https://csrc.nist.gov/csrc/media/projects/forum/documents/feb2014/pviscuso_cui-briefing.pdf) 
- [Information Security Oversight Office (ISOO)](https://csrc.nist.gov/csrc/media/projects/forum/documents/feb2014/pviscuso_cui-briefing.pdf)
- [Protection of Controlled Unclassified Information - CSRC](https://csrc.nist.gov/publications/detail/itl-bulletin/2015/10/protection-of-controlled-unclassified-information/final)
- [Controlled Unclassified Information (CUI) -- NIST](https://csrc.nist.gov/csrc/media/projects/forum/documents/2011/forum-oct2011-cui-briefing_pviscuso.pdf)
- [CUI Rule 32 CFR Part 2002](https://www.federalregister.gov/documents/2016/09/14/2016-21665/controlled-unclassified-information)
- [SP 800-171A](https://doi.org/10.6028/NIST.SP.800-171A)
- [CUI Marking Handbook](https://www.archives.gov/files/cui/20161206-cui-marking-handbook-v1-1.pdf)
- [CUI Registry - Health Information Category](https://www.archives.gov/cui/registry/category-detail/health-info)
- [CUI Registry: Limited Dissemination Controls](https://www.archives.gov/cui/registry/limited-dissemination)
- [CUI Policy and Guidance](https://www.archives.gov/cui/registry/policy-guidance)
- [CUI Glossary](https://www.archives.gov/cui/registry/cui-glossary.html)
- [Compliance Plan Overview for Departments and Agencies](https://www.archives.gov/files/2011-overview-for-compliance-plans.pdf)
- [Executive Order 13556 Overview for Departments and Agencies](https://www.archives.gov/cui/registry/policy-guidance/registry-documents/2010-overview-for-depts-and-agencies-from-ea.pdf)

### Use-Cases

#### Sender Security Labeling (SL) Capability

##### Assumption
Sender has implemented SL.

##### Pre-Condition
Sender determines applicable SLs to convey applicable policy.

##### Post-Condition
Sender is able to audit Receiver enforcement of disclosed Resource SL.

Sender is able to determine whether the Receiver reclassified disclosed Resource SL upon further disclosure by monitoring Resource Provenance chain.

##### Actors & Actions
Sender creates a discoverable/shareable Security Labeling (SL) Capability Statement:

- Listing the SL tags required to convey each applicable policy, using the `sec-label-basis` extension.
- Indicating that the Sender supports `must-display`, `sec-label-classifier`, and `sec-label-related-artifact` extensions.

Sender implements ability to assign SLs at both the Bundle (High Watermark) and `Resource.meta.security`.

Sender posts discoverable SL Capability Statements for each supported policy.

Sender receives Receiver Client Registration request, which includes Receiver Capability Statement.

Sender compares Sender and Receiver SL Capability Statements to determine whether Receiver Capabilities exceed, match, or are less than Sender SL Capabilities.

(Happy Path) Receiver SL Capabilities matches Sender SL Capabilities.

Sender returns requested Resources with applicable SL.

##### Artifacts
Discoverable Capability Statement, which includes:
- Labeling levels supported: Bundle & Resource
- Supported Extensions

Appropriately labeled Bundles and Resources.

#### Receiver SL Capability

##### Assumption
Receiver has implemented SL and Privacy Preserving Authorization Services.

##### Pre-Condition
Receiver determines applicable SLs to convey applicable policy.

##### Post-Condition
Receiver manages and monitors its adherence to Sender Resource SLs.

Receiver is able to audit downstream Recipient enforcement of disclosed Resource SL. 

Receiver is able to determine whether a downstream Recipient reclassified disclosed Resource SL by monitoring Resource Provenance chain.

##### Actors & Actions
Receiver creates a discoverable/shareable Security Labeling (SL) Capability Statement: 

- Listing the SL tags required to convey each applicable policy, using the `sec-label-basis` extension.
- Indicating that the Receiver supports `must-display`, `sec-label-classifier`, and `sec-label-related-artifact` extensions.

Receiver implements ability to assign SLs at both the Bundle (High Watermark) and `Resource.meta.security`.

Receiver posts discoverable SL Capability Statements for each supported policy.

Receiver discovers and retrieves prospective Sender SL Capability Statement.

(Happy Path) Receiver compares Sender SL Capability Statements with Receiver SL Capability Statements, and determines that it is able to support SLs for applicable policies.

Receiver requests Client Registration, thereby agreeing to the Sender SL Capability Statement.

Receiver requests SL Resource.

Sender sends Receiver the SL Resource.

Receiver consumes SL Resource and persists associated SL.

##### Artifacts
Discoverable Capability Statement, which includes:
- Labeling levels supported: Bundle & Resource
- Supported Extensions

Verification of persisted and enforced SL.
  

### Security Labeling FAQ

#### Information Blocking

Does the implementation of security labeling and data segmentation for privacy lead to information blocking?

__Information blocking is a matter of policy; security labeling is a policy-neutral technology__

Security labeling is a technological building block which enables fine-grained control over healthcare information by identifying and marking different types of sensitive data. It does not determine per se whether or not access to any part of the information should be blocked for a requester based on these markings. Information blocking, i.e. whether a provider blocks access to all or parts of a patient’s health information, is a matter of policy that can happen with or without security labels based on the policy decisions made by a provider. Simply because a piece of information is marked with a certain sensitivity or confidentiality label does not mean that the provider must block access to that piece of information.

It is important to delineate the policy-neutral technological infrastructure that is provided by the security labeling system, from different types of policy decisions that may rely, among other factors, on security labels. Particularly, disagreeing with a specific policy which can be implemented based on security labels should not be conflated as an argument against security labeling technology.

__Security Labels Could be Informative__

Even though some security labels such as confidentiality and sensitivity labels could be used for blocking access to certain information for unauthorized parties, there is more to security labels than that. Some security labels such as handling instructions or integrity labels are informative and assist the recipient with understanding the reliability of the information and how it should be handled.

Enforcement of authorization policies based on law is not information blocking

Information blocking, as defined by Section 4004 of the 21st Century Cures Act (Cures Act) does not include controlling access based on legitimate policies backed by law, or the regulations set by the Secretary of Health and Human Services (HHS). Current laws allow controlling access to certain sensitive information by the patient, therefore, any application of security labeling for enforcing such lawful policies is not information blocking and more particularly, using the security labeling technology to enforce these laws does not constitute information blocking.

__Future laws may require more instances of access control based on the sensitivity of information__

As clinical practices, societal norms, and common-sense expectations of privacy change, future laws at various jurisdictional levels may give patients the control over sharing of new types of sensitive information. Security labeling is the underlying technology which guarantees that enforcement of such laws remains technologically possible.

#### Patient Safety

Can security labeling and data segmentation jeopardize patient safety by enabling patients to hide information from a clinician and thereby impeding the clinician’s ability to make the best decision based on a complete picture?

__Security labeling does not equate to unfettered patient control over all the information__

Security labeling does not enable patients to have complete and unfettered control over sharing their healthcare information. Identifying and marking different type of healthcare information does not automatically grant the patient control over sharing them. What the patient, and other policy makers, get to control, and the extent to which such control is permitted, is a matter of policy determined by applicable laws and regulations. So, the patient’s ability to hide information from certain clinicians is strictly controlled by existing laws and regulations and is not determined by the security labeling technology.

__Lack of control over sharing can also jeopardize patient safety__

Fear of privacy violations and lack of control over sharing of sensitive information can equally jeopardize patient’s safety by diminishing patient’s trust in the system and their willingness to confide sensitive information to caregivers and clinicians. Substance abuse, mental health issues, sexual trauma are some obvious examples where patients’ unwillingness to seek treatment due to fear of privacy breach can put patient safety at risk.

Thus, there must be a balance between patient’s confidence in protection of their privacy and sharing a complete picture of health with every caregiver to ensuring the best quality of care. Balancing these concerns and determining their appropriate equilibrium is a matter of policy and is decided by the applicable laws and regulations which currently grant the patient the right to control sharing of certain types of sensitive information.

__Clinicians are not the only users of healthcare information__

As access to healthcare information is becoming more ubiquitous by the emerging applications, (e.g. fitness mobile apps, medical devices, wellness programs), increasingly, clinicians are not the only users of a patient’s health information. Security labeling is an essential technology to ensure patient’s privacy will be protected in the face of many new types of users and burgeoning new applications for health information. Therefore, security labeling has a far broader role in ensuring patient privacy which is not limited to clinicians.

__Clinical Decision Support systems can alert clinicians__

While a clinician may initially not be able to see certain sensitive information based on the patient’s decision to withhold them, this information can still be used by Clinical Decision Support (CDS) systems to assess potential risks to patient safety (e.g. drug-to-drug interactions) and alert the clinician with warnings. Clinicians can request break-the-glass access to override such controls based on reasonable risks to patient safety as a result of warnings from a CDS. Security labeling provides the technological infrastructure which enables such application of the CDS system.

#### Implementation

Is security labeling too costly and complex to implement?

__Security labeling has been implemented and used in other sectors__

Security labeling is a well-established technology in other sectors, e.g. military, and has been implemented and used for decades.

__Some vendors have already implemented this technology__

In the healthcare sector as well, security labeling has already been implanted by some vendors and its usage has been shown in some limited applications.

__Security labeling does not have to be implemented in the EHR system__

While existing EHRs can certainly implement the security labeling service inside their products, this is not the only approach and the labeling service can be implemented as a separate product that interacts with a standard EHR and applies labels to the outgoing information on-the-fly or on the existing information in a batch mode. This reduces the net costs of implementation and creates a competitive free marketplace for security labeling products that can work with different existing EHR systems.

__Implementation can be iterative and gradual and not every application needs all the features__

Although the HL7 standards for security labeling is quite thorough and defines a rather comprehensive system, not every implementation or every application area needs to implement all the aspects of this technology. By defining profiles and maturity models for the security labeling system, subsets of the security labeling systems can be selected in a way that is tailored to suit specific application areas and use-cases. This creates an incremental roadmap for implementers and enables different systems to adhere to a subset of the security labeling technology sufficient for their application. In other words, instead of an all-or-nothing approach, we can take a more gradual approach to implementing security labeling.
