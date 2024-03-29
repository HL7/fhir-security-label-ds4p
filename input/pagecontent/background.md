Adoption and use of electronic health records and other health information technologies have contributed to the increasing exchange of electronic health information. Many organizations, however, remain hesitant to share certain types of information, especially information considered particularly sensitive or associated with special legal protections.

Lacking mechanisms to appropriately [segment](glossary.html#data-segmentation) this data, organizations often decline to share anything at all. 
Security labeling provides the underlying capabilities for segmenting information to allow more fine-grained control over the information that needs to be shared. This enables providers to share as much as possible (and leave out precisely what is not authorized for sharing by privacy policies) rather than a blanket refusal to share which could happen in the absence of such fine-grained controls. In other words, by providing more flexibility and fine-grained control, security labeling can increase the exchange of information since the options available to a provider will no longer be "share all" vs. "share nothing”. 

Security labels can also be used as informative tags to convey data handling requirements to the recipient. In this sense, implementing security labeling can increase the sender's confidence that the recipient is able to understand of the sensitivity of the data and handling requirements, and therefore can facilitate and increase sharing. 

Security labeling is used for enforcing more than just restrictions around sensitive health information. It can be used to convey privacy and security-related metadata such as provenance and integrity labels which can be used in various workflow contexts. For example, a clinical workflow may treat information labeled as "patient provided" differently from the information asserted by a clinician.

A common concern about implementing security labels is that data segmentation may result in incomplete medical records due to restricting access to sensitive health information. While data segmentation is only one of the applications of security labeling, this concern is addressed by ensuring that data segmentation is in compliance with privacy laws and regulations and appropriate mechanisms are provided for practitioners to access any information that is needed in matters of patient safety. Security labels can often facilitate such risk-mitigating mechanisms by providing more insight about the health information in the form of security-related metadata. For example, sensitive information withheld from a practitioner can be used by a Clinical Decision Support Systems (CDS) to alert the practitioner about potential patient safety issues. 

This specification is a common platform standard that must be adapted to particular use cases. Some particular use cases are common or important enough to be described as a part of the specification itself. These are published as groups of Structure Definitions (profiles or extensions), which are often found in implementation guides, along with Value Sets and examples.

### Security Labeling FAQ

#### Information Blocking

Does the implementation of data segmentation for privacy and security labeling lead to withholding  health information (e.g., all or part of a patient's health record) from legitimate requesters (known in the US as "information blocking")?

__Information blocking is a matter of policy; security labeling is a policy-neutral technology__

Security labeling is a technological building block which enables fine-grained control over healthcare information by identifying and marking different types of sensitive data. It does not prescribe, per se, whether or not access to any part of the information should be blocked for a requester based on these markings. On the contrary, it can be argued that security labeling enables more data to flow as the data can be tagged to communicate the specific handling requirements, in the context of a trust agreement between the sender and receiver (known in the US as [Data Use and Reciprocal Support Agreement or DURSA](glossary.html#dursa)).

Withholding health information, or as known in the US, "information blocking", is a matter of policy and can happen with or without security labels based on policy decisions made by a provider. Just because a piece of information is marked with a certain security label does not mean that the provider must or will deny access to that piece of information. In the US, as long as security labeling assignment and enforcement is conducted in accordance with privacy policies and is well-documented and consistently applied in a non-discriminatory manner, covered senders may meet [the Information Blocking provisions of the CURES Act regulations](https://www.healthit.gov/topic/information-blocking).

It is important to delineate the policy-enhancing, yet policy-neutral infrastructure, provided by the security labeling system, from different types of policy decisions that may rely, among other factors, on security labels. Particularly, disagreeing with certain policies that can be enforced by utilizing security labels should not be conflated as an argument against the use of security labeling in general.

__Security Labels Could be Informative__

Even though some security labels (e.g.,  confidentiality and sensitivity labels) could be used for denying access to certain information for unauthorized parties, other types of security labels (e.g., handling instructions or integrity labels) are informative and assist the recipient with understanding the reliability of the information and how it should be handled.

__Future laws may require more instances of access control based on the sensitivity of information__

As clinical practices, societal norms, and common-sense expectations of privacy change, future laws at various jurisdictional levels may give patients the control over sharing of new types of sensitive information. Security labeling is the underlying technology which guarantees that enforcement of such laws remains technologically possible.

#### Patient Safety

Can security labeling and data segmentation jeopardize patient safety by enabling patients to hide information from a clinician and thereby impeding the clinician’s ability to make the best decision based on a complete picture?

__Security labeling does not equate to unfettered patient control over all the information__

Identifying and marking different type of healthcare information does not automatically grant the patient control over sharing them, so, security labeling does not enable patients to have complete and unfettered control over sharing their healthcare information. What the patient, and other policy makers, can control, and the extent to which such control is permitted, is a matter of policy, determined by applicable laws and regulations. So, the patient’s ability to hide information from certain clinicians is strictly controlled by existing laws and regulations and is not an automatic result of implementing security labeling. Ultimately, any clinician with legitimate treatment relationship with the patient has elevated privileges including the ability to invoke a break-glass access when justified by patient safety concerns.

__Lack of control over sharing can also jeopardize patient safety__

Fear of privacy violations and lack of control over sharing of sensitive information can equally jeopardize patient’s safety by diminishing patient’s trust in the system and their willingness to confide sensitive information to caregivers and clinicians. Substance abuse, mental health issues, sexual trauma are some obvious examples where patients’ unwillingness to seek treatment due to fear of privacy breach can put patient safety at risk.

Thus, there must be a balance between patient’s confidence in protection of their privacy and sharing a complete picture of health with every caregiver to ensuring the best quality of care. Balancing these concerns and determining their appropriate equilibrium is a matter of policy and is decided by the applicable laws and regulations which currently grant the patient the right to control sharing of certain types of sensitive information.

__Clinicians are not the only users of healthcare information__

As access to healthcare information is becoming more ubiquitous by the emerging applications, (e.g. fitness mobile apps, medical devices, wellness programs), increasingly, clinicians are not the only users of a patient’s health information. Security labeling is an essential technology to ensure patient’s privacy will be protected in the face of many new types of users and burgeoning new applications for health information. Therefore, security labeling has a far broader role in ensuring patient privacy which is not limited to clinicians.

For example, in the US realm, under the HIPAA provisions for an Individual’s Right of Access, a healthcare consumer may disclose health information to a myriad of apps and social media platforms governed under Consumer Protection laws. When exercising the Right of Access, security labeling technology should be made available to healthcare consumers so that they can enforce the consumer’s privacy preferences. Therefore, security labeling has a far broader role in ensuring patient privacy across the entire health information exchange ecosystem.

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

The [HL7 Healthcare Privacy and Security Classification System (HCS), Release 1 (HCS)](https://www.hl7.org/implement/standards/product_brief.cfm?product_id=345) is quite thorough and defines a rather comprehensive system for implementing security labels. But not every implementation or every application area needs to implement all the aspects of this standard. By defining profiles and maturity models, subsets of the security labeling systems can be identified to suit specific application areas and use cases. This creates an incremental roadmap for implementers and enables different systems to adhere to implementing subsets of security labeling capabilities, sufficient for their application, or create a roadmap to implement a security labeling system in an incremental manner, based on the requirements and priorities. For example, the need to protect more sensitive information may call for prioritizing the implementation of a subset of labels that address such requirements.

