Adoption and use of electronic health records and other health information technologies have contributed to the increasing exchange of electronic health information. Many organizations, however, remain hesitant to share certain types of information, including information considered particularly sensitive or information associated with special legal protections.

Lacking mechanisms to appropriately segment this data, organizations often decline to share anything at all. 
Security labeling provides the technical capabilities for segmenting information to enable organizations to appropriately control access to sensitive health information and share with authorized parties.

Concern has been raised that data segmentation results in information blocking and incomplete medical records due to the redaction of sensitive health information in compliance with privacy laws. 
Security labeling in fact improves and protects information sharing. Without security labeling, a sender (an entity requested to disclose or that intends to disclose without a request, i.e., “push”) will not know what information can be shared without manual review or siloing data sent from providers of sensitive healthcare. Security labeling enables senders to automatically determine precisely which information can be shared so that more information is made available.

In the US, as long as security labeling assignment and enforcement is conducted in accordance with privacy policies and is well-documented and consistently applied in a non-discriminatory manner, covered senders may meet [the Information Blocking provisions of the CURES Act regulations](https://www.healthit.gov/topic/information-blocking).

Security labeling technology is used for enforcing more than just privacy policies expressed as an individual’s meaningful choice. It can be used to enforce any type of individual, organizational, or jurisdictional policy to computably determine whether a requester asking to collect, access, use, disclose or receive information should be permitted to do so and what, if any, security controls are required by senders and receivers; for examples  limitation on workflows/contexts in which the information may be used as well as obligations and prohibitions related to handling the information.

In addition, security labeling technology can be used to implement risk-mitigation techniques to ensure that policy priorities prevail when risks must be averted. For example, security labels can be used by a Clinical Decision Support Systems (CDS) to alert clinicians about potential patient safety issue related to filtered health information, about which the clinician might not previously have had a “need to know”, and therefore, had not been provisioned to access.  Based on access to the sensitive information security label, the CDS could trigger an alert about the potential of an adverse drug-drug interaction, and advise the clinician to “break the glass”, i.e., assert an emergency “need to know,” in order to retrieve the redacted information.

Thus, when used properly, security labeling reduces information blocking. Appropriately labeling information allows more restricted information to be shared with authorized recipients. Recipients not authorized to receive the more restricted data may still be able to receive data which does not have more restrictive labels. The net result is that more information can be appropriately shared.

Wide adoption of security labels can help build trust between physicians, patients, and other entities involved in access, use, and exchange of information. Trust is a core component of interoperability. Adding security labels may help increase the exchange of information because the options will no longer be send “all or nothing”.

### Security Labeling FAQ

#### Information Blocking

Does the implementation of security labeling and data segmentation for privacy lead to "information blocking"?

__Information blocking is a matter of policy; security labeling is a policy-neutral technology__

Security labeling is a technological building block which enables fine-grained control over healthcare information by identifying and marking different types of sensitive data. It does not prescribe, per se, whether or not access to any part of the information should be blocked for a requester based on these markings. On the contrary, it can be argued that security labeling enables more data to flow as the data can be tagged for special handling enabled by a Data Use and Reciprocal Support Agreement (DURSA).

Information blocking (i.e. when a provider blocks access to all or parts of a patient’s health information), is a matter of policy and can happen with or without security labels based on the policy decisions made by a provider. Simply because a piece of information is marked with a certain sensitivity or confidentiality label does not mean that the provider must block access to that piece of information.

It is important to delineate the policy-enhancing, yet policy-neutral technological infrastructure, provided by the security labeling system, from different types of policy decisions that may rely, among other factors, on security labels. Particularly, disagreeing with a specific policy which can be implemented based on security labels should not be conflated as an argument against the security labeling technology.

__Security Labels Could be Informative__

Even though some security labels such as confidentiality and sensitivity labels could be used for blocking access to certain information for unauthorized parties, there is more to security labels than that. Some security labels such as handling instructions or integrity labels are informative and assist the recipient with understanding the reliability of the information and how it should be handled.

Enforcement of authorization policies based on law is not information blocking

Information blocking, as defined by Section 4004 of the 21st Century Cures Act (Cures Act) does not include controlling access based on legitimate policies backed by law, or the regulations set by the Secretary of Health and Human Services (HHS). Current laws allow controlling access to certain sensitive information by the patient, therefore, any application of security labeling for enforcing such lawful policies is not information blocking and more particularly, using the security labeling technology to enforce these laws does not constitute information blocking.

__Future laws may require more instances of access control based on the sensitivity of information__

As clinical practices, societal norms, and common-sense expectations of privacy change, future laws at various jurisdictional levels may give patients the control over sharing of new types of sensitive information. Security labeling is the underlying technology which guarantees that enforcement of such laws remains technologically possible.

#### Patient Safety

Can security labeling and data segmentation jeopardize patient safety by enabling patients to hide information from a clinician and thereby impeding the clinician’s ability to make the best decision based on a complete picture?

__Security labeling does not equate to unfettered patient control over all the information__

Security labeling does not enable patients to have complete and unfettered control over sharing their healthcare information. Identifying and marking different type of healthcare information does not automatically grant the patient control over sharing them. What the patient, and other policy makers, get to control, and the extent to which such control is permitted, is a matter of policy determined by applicable laws and regulations. So, the patient’s ability to hide information from certain clinicians is strictly controlled by existing laws and regulations and is not determined by the security labeling technology. Ultimately, any clinician with legitimate treatment relationship with the patient has elevated privileges including the ability to invoke a break-glass access when justified by patient safety concerns.

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

__Security Labeling Service does not have to be implemented within the EHR system__

An essential component in data segmentation for privacy is the Security Labeling Service (SLS), a software service that assigns security labels to data objects based on applicable business rules and policies. The SLS may be implemented as a component in existing EHRs, but it can also be implemented as a separate product integrated with the EHR to apply labels to data objects, either on a per-transaction basis, or in batch mode –or a hybrid of both. Using readily-available SLS products as a service can reduce the net costs of implementing the SLS in an EHR and can create a competitive free marketplace for SLS products working with different EHR systems.

Note that this only applies on the provider side; on the consumer side, proper processing of labeled data requires incorporating security labels into various aspects of the product including (but not limited to) access control system, business workflows, user interfaces, and abiding by the corresponding policies.


__Implementation can be iterative and gradual and not every application needs all the features__

Although the HL7 standards for security labeling is quite thorough and defines a rather comprehensive system, not every implementation or every application area needs to implement all the aspects of this technology. By defining profiles and maturity models for the security labeling system, subsets of the security labeling systems can be selected in a way that is tailored to suit specific application areas and use cases. This creates an incremental roadmap for implementers and enables different systems to adhere to a subset of the security labeling technology sufficient for their application. In other words, instead of an all-or-nothing approach, we can take a more gradual approach to implementing security labeling.

### Use Cases

#### Sender Security Labeling Capability

##### Assumption
Sender has implemented Security Labeling.

##### Pre-Condition
Sender determines applicable security labels to convey applicable policy.

##### Post-Condition
Sender is able to audit Receiver enforcement of disclosed labeled Resource.

Sender is able to determine whether the Receiver reclassified disclosed labeled Resource upon further disclosure by monitoring Resource Provenance chain.

##### Actors & Actions
Sender creates a discoverable/shareable Security Labeling Capability Statement, including:

- Listing the security label tags required to convey each applicable policy, using the `sec-label-basis` extension.
- Indicating that the Sender supports `display`, `sec-label-classifier`, and `sec-label-related-artifact` extensions.

Sender implements ability to assign security labels at both the Bundle (High Water Mark) and `Resource.meta.security`.

Sender posts discoverable Security Labeling Capability Statements for each supported policy.

Sender receives Receiver Client Registration request, which includes Receiver Capability Statement.

Sender inspects Receiver's Security Labeling Capability Statements to determine whether Receiver Capabilities exceed, match, or are less than Sender Security Labeling Capabilities.

(Happy Path) Receiver Security Labeling Capabilities matches Sender Security Labeling Capabilities.

Sender returns requested Resources with applicable security labels.

##### Artifacts
Discoverable Capability Statement, which includes:
- Labeling levels supported: Bundle & Resource
- Supported Extensions

Appropriately labeled Bundles and Resources.

#### Receiver Security Labeling Capability

##### Assumption
Receiver has implemented Security Labeling and Privacy-Preserving Authorization Services.

##### Pre-Condition
Receiver determines applicable security labels to convey applicable policy.

##### Post-Condition
Receiver manages and monitors its adherence to Sender Resource security labels.

Receiver is able to audit downstream Recipient enforcement of disclosed Resource security labels. 

Receiver is able to determine whether a downstream Recipient reclassified disclosed Resource security labels by monitoring Resource Provenance chain.

##### Actors & Actions
Receiver creates a discoverable/shareable Security Labeling Capability Statement: 

- Listing the security label tags required to convey each applicable policy, using the `sec-label-basis` extension.
- Indicating that the Receiver supports `display`, `sec-label-classifier`, and `sec-label-related-artifact` extensions.

Receiver implements the capabilities required for enforcing security labels at both the Resource-, and Bundle-level (High Water Mark).

Receiver posts discoverable Security Labeling Capability Statements for each supported policy.

Receiver discovers and retrieves prospective Sender Security Labeling Capability Statement.

(Happy Path) Receiver compares Sender Security Labeling Capability Statements with Receiver Security Labeling Capability Statements, and determines that it is able to support security labels for applicable policies.

Receiver requests Client Registration, thereby agreeing to the Sender Security Labeling Capability Statement.

Receiver requests Resource with security labels.

Sender sends Receiver the labeled Resource.

Receiver consumes labeled Resource and persists associated security labels.
