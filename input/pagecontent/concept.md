### How to assign a Security Label

Generally, a Security Label is assigned based on a policy specifying sensitive information. If the sensitive information increases the risk of the information target (i.e., a patient) to stigmatization or discrimination (which might in turn deter seeking treatment or other services), then, the need to protect the confidentiality of that information is more stringent than the "normal". Therefore, the confidentiality protections will be heightened beyond the "norm". 

In the US, the norm of confidentiality protections under HIPAA are the baseline policy. Privacy laws that preempt HIPAA by offering more stringent protections  (for example, state laws related to adolescent health or an individual’s HIV-status), which require heightened levels of confidentiality protection are assigned Security Labels with more restrictive Confidentiality Tag, i.e., `R` (restricted).

Information governed by privacy laws, which do not preempt HIPAA, such as protections under FTC, Workers Compensation, or Gramm-Leach-Bliley Act, will be assigned the Confidentiality Tag `M` (moderate).

Information governed by policies addressing ad hoc, extremely sensitive information, such as victim of abuse or a legal hold, are typically assigned `V` (very restricted) by privacy officials.

It is critical that the policy dictating the sensitivity of labeled information be included in Security Label as the single Policy Tag indicating governed sensitive information, the level of confidentiality, other pertinent security categories relevant to the information, access limitations to a "compartment" of end users with a "need to know" such as a Care Team or Research Project.

In addition, the policy should include the need to specify:

-   The integrity, provenance, and trust attributes pertinent to the governed information.  For example, policy may require that only legally-attested information is available to those other than the author; that any syntactic/semantic transformation of the information is known by end users; that the provenance of the information be accessible to end users to determine their level of confidence in the trustworthiness, authenticity, and reliability of the labeled information; and the degree to which the information has been exchanged within a trust framework. 

-   The handling instructions to which Senders and Receivers must comply including:

    -   _Purpose of Use_: Limitations on the contexts and processes in which the information may be collected, accessed, used, and disclosed.
    -   _Obligation Policies_: Mandated Sender and Receiver actions.
    -   _Refrain Policies_: Prohibitions on Sender and Receiver actions.

**Classification**

Classification is the act or process by which information, which is determined to be sensitive or non-sensitive per applicable policy, is assigned a level of confidentiality protection.

Classification is at the discretion of the Authority (Classifier), which controls the classified information, and determines the appropriate level of protection, i.e., the confidentiality of the information. A Classifier may be required to retain the Security Label assigned by a previous Classifier per policy or trading partner agreement.

The appropriate level of confidentiality protection is determined by the Classifier's assessment of the disclosure risks of the information, which usually are identified by the magnitude or type of damage that could be caused by disclosure, such as the risk of harm, discrimination, or safety to an individual. The level of confidentiality protection for a type of sensitive information is set by jurisdictional, organizational, or individual data subject policy. The appropriate level of confidentiality protection for a type of sensitive information is ultimately dictated by jurisdictional, organizational, or individual policy.

**Confidentiality Tags**

According to the [HL7 Healthcare Privacy and Security Classification System (HCS), Release 1](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=345) (HCS), one, and only one, Confidentiality Tag code is assigned by a Custodian (information holder) to a Security Label when "classifying" the information. The Custodian may be the originator of the information to be protected, a Receiver of information from the Custodian, and may further disclose that information to a downstream Recipient. Any Custodian may be permitted to reclassify information per applicable policies and trading partner agreements.

The confidentiality protection afforded sensitive information differs by applicable law. For example, in the US, HIV sensitive information has "normal" (the norm) level of confidentiality if governed by HIPAA. However, if HIV sensitive information is governed under Title 38 Section 7332, 42 CFR Part 2 (as comorbid with substance use disorder), or under some state laws, the level of confidentiality protection is coded as "restricted", because these laws are more protective than HIPAA. 

The criterion for assigning HL7 confidentiality codes is whether applicable policy deems the misuse of information as posing a greater or lesser risk of harm to or stigmatization of the data subject or an organization. The information may be about a sensitive health condition, but not necessarily, for example, it could be Business or Security policy sensitive.

The following HL7 Confidentiality Code criteria are intended to meet a healthcare-specific multi-level security model for access control by stipulating clearly distinguishable levels of protection, which can be specialized by realm:

-   _Normal_: The "normal" confidentiality code applies the "normative" level of protection to sensitive and non-sensitive information within the context of healthcare delivery in a general policy domain (e.g., HIPAA in US, GDPR in EU).
-   _Restricted_: The "restricted" confidentiality code applies when a narrower policy domain preempts the "normative" level of protection in a wider policy domain (e.g., HIPAA in US, GDPR in EU) of sensitive information within the context of healthcare delivery. Examples include State behavioral health, reproductive health, minors' health, and HIV laws; Medicaid Confidentiality; Title 38 Section 7332; and 42 CFR Part 2.
-   _Moderate_: The "moderate" confidentiality code lessens the "normative" level of protection in a policy domain based on a data subject's authorization to disclose for purposes of policy domains outside the context of healthcare delivery, e.g., for research, coverage determination such as Social Security Administration(SSA), personal health record systems/apps, marketing where other privacy laws may apply.
-   _Very Restricted_: The "very restricted" confidentiality code applies to sensitive and non-sensitive information, and raises the level of protection beyond "normal" or "restricted" in ad hoc situations such as legal hold or patient safety.
-   _Low_: The "low" confidentiality code applies to sensitive and non-sensitive information that has been altered in such a way as to minimize the need for confidentiality protections with some residual risks associated with re-linking.
-   _Unrestricted_: The "unrestricted" confidentiality code applies to sensitive and non-sensitive information that has been disclosed with few or no restrictions on its use, which may be stipulated contractually between the data subject and a data user (e.g., via terms of service or data user privacy policies such as disclosure for marketing purposes or on social media).

The descriptions of Confidentiality Codes are based on variance from "normative" level of protection as a metric for differentiating the total order hierarchical demarcations for this multi-level security model.

This results in the following subsumption relationships which form a hierarchy (or *total order*) in which Very Restricted is the parent and each lower child _IS-A_ lesser protection level than its predecessor with Unrestricted being the lowest protection level:

-   _Very Restricted_ (`V`) is the highest protection level and subsumes all other protection levels, i.e. `R`, `N`, `M`, `L`, and `U`.
-   _Restricted_ (`R`) is less protective than `V`, and subsumes all other protection levels, i.e. `N`, `M`, `L`, and `U`.
-   _Normal_ (`N`) is less protective than `V` and `R`, and subsumes all other protection levels, i.e. `M`, `L`, and `U`.
-   _Moderate_ (`M`) is less protective than `V`, `R`, and `N`, and subsumes all other protection levels, i.e. `L` and `U`.
-   _Low_ (`L`) is less protective than `V`, `R`, `N`, and `M`, and subsumes `U`.
-   _Unrestricted_ (`U`) is less protective than `V`, `R`, `N`, `M`, and `L`, and is the lowest protection levels.

**Sensitivity Tags**

Information Sensitivity is the characteristic of an IT resource which implies its value or importance and may include its vulnerability (ISO 7492-2). This label captures privacy metadata for information perceived as undesirable to share (HL7 Healthcare Classification System).

Sensitive information is data that must be protected from unauthorized access and disclosure to safeguard the privacy or security of an individual or organization. 

Sensitivity of information may be dictated by law, for example: A law, such as 42 CFR Part 2, which dictates that information about an individual's substance use disorder is sensitive; a law dictating that information custodians conduct a risk assessment of information sensitivity; or by an individual with a right to opt-out of sharing behavioral health information through a Health Information Exchange network.

Depending on the policy context, the Authority determining information sensitivity may be a jurisdiction, an organization, or an individual.

-   For example, in the US, HIPAA, 42 CFR Part 2, and Title 38 Section 7332 are Federal health privacy laws, which dictate that information relating to the diagnosis, treatment, or referral for specific conditions is deemed sensitive. 
-   Many States have health privacy laws that are more stringent than HIPAA Privacy Rule, which is considered the US "norm" for the protection of Protected Health Information (PHI). This PHI is labeled with a Confidentiality Code `N`, meaning that the normal level of confidentiality protection applies. 
-   Organizations may determine that some PHI is sensitive, and may therefore assign a higher level of confidentiality such as `R`, meaning that access/use/disclosure of this PHI is restricted. Under certain circumstances, organizations may determine that PHI is especially vulnerable to risk of stigmatization or harm.  This PHI is labeled with a Confidentiality Code `V`, meaning that access/use/disclosure is very restricted.
-   Healthcare consumers and patients have discretion under some privacy laws to determine the sensitivity of their information, and may have the information custodian label their PHI with more or less restrictive Confidentiality Codes. For example:

    -   Under HIPAA consent provisions, a patient may request that the Covered Entity custodian restrict access/use/disclosure of their PHI, and the Covered Entity may agree to this request by labeling with a Confidentiality Code `R` (restricted).
    -   Under HIPAA Authorization for Disclosure, a patient requests that the Covered Entity custodian disclose PHI to a third party, which is not a Covered Entity. Since the third party is not a Covered Entity, the custodian labels the disclosed information, which is no longer PHI, with a Confidentiality Code `M` for moderate confidentiality protections afforded by other applicable laws, such as Worker Compensation privacy laws, or by the privacy policies and terms of service of an entity, which may be governed by Federal Trade Commission privacy laws.

**Purpose of Use**

Purpose of Use codes are part of the Healthcare Privacy and Security Classification System (HCS) vocabulary, which have been adopted in HL7 Version 3, and are available for use in HL7 Version 2, CDA, and FHIR. A convenient place to find these online is in the FHIR Value Set [PurposeOfUse](http://build.fhir.org/v3/PurposeOfUse/vs.html).

POU codes indicate the circumstances under which an authorized recipient is permitted to perform a permitted activity such as create, collect, access, use, or disclose.

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


##### Artifacts
Discoverable Capability Statement, which includes:
- Labeling levels supported: Bundle & Resource
- Supported Extensions

Verification of persisted and enforced SL.
  
