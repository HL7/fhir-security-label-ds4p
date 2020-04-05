Concern is frequently raised that use of HL7 security labels for data segmentation for privacy results in information blocking in the context of treatment, even where the security labeling technology is used to enforce applicable privacy laws, resulting in "Swiss cheese" medical records. 

Security labeling technology is used for enforcing more than just privacy policies expressed as an individual's meaningful choice as afforded by law.  It is also used to enforce organizational and jurisdictional privacy, security, and business policies primarily to computably determine whether a requester to collect, access, use, disclose or receive information should be permitted to do so and what, if any, security controls are required by senders and receivers such as limitation on workflows/contexts in which the information may be handled, and obligations and prohibitions related to handling the information. 

Security labeling technology also includes risk mitigation techniques to ensure that policy priorities prevail when risks related to security labeling must be averted, such enabling a Clinical Decision Support Systems to alert clinicians about the potential for a patient safety issue related to filtered health information, which the clinician might not have previously had a "need to know".
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

#### Receiver SL Capabilit

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

Even though some security labels such as confidentiality and sensitivity labels could be used for blocking access to certain information for unauthorized parties, there is more to security labels than that. Some security labels such as handling instructions or integrity labels are informative and assist the recipient with understanding how the information should be handled or how much it can be reliable.

Enforcement of authorization policies based on law is not information blocking

Information blocking, as defined by Section 4004 of the 21st Century Cures Act (Cures Act) does not include controlling access based on legitimate policies backed by law, or the regulations set by the Secretary of Health and Human Services (HHS). Current laws allow controlling access to certain sensitive information by the patient, therefore, any application of security labeling for enforcing such lawful policies is not information blocking and more particularly, using the security labeling technology to enforce these laws does not constitute information blocking.

__Future laws may require more instances of access control based on the sensitivity of information__

As clinical practices, societal norms, and common-sense expectations of privacy change, future laws at various jurisdictional levels may give patients the control over sharing of new types of sensitive information. Security labeling is the underlying technology which guarantees that enforcement of such laws remains technologically possible.

#### Patient Safety

Can security labeling and data segmentation jeopardize patient safety by enabling patients to hide information from a clinician and thereby impeding the clinician’s ability to make the best decision based on a complete picture?

__Security labeling does not equate unfettered patient control over all the information__

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
