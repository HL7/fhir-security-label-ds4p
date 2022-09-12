Note that the details of capability statements, audit profiles, and the ability to programmatically verify security labeling capabilities based on the capability statement are roadmap items for this IG and have not been fully addressed in this version.

### Actors
- Sender: an entity or system in custody of health information, such as an EHR or Personal Health Record (PHR) system, that initiates or responds to a request to share health information with a Receiver.

- Receiver: an entity or system, such as an EHR or PHR that initiates a request to receive, health information, or is the intended recipient of health information.

### Sender-Side Enforcement
#### Assumption
Sender has implemented Security Labeling Service, including: 

- creating a discoverable/shareable Security Labeling Capability Statement, including:
    - listing the security label tags required to convey each applicable policy used by the `sec-label-basis` extension.
    - indicating that the Sender supports `display`, `sec-label-classifier`, and `sec-label-related-artifact` extensions, and
    - posting the discoverable Security Labeling Capability Statements for each supported policy.

- implementing the ability to assign security labels at both Resource- and Bundle-level ([High Water Mark](glossary.html#hwm)).

#### Artifacts
- Discoverable Capability Statement, which includes:
    - Labeling levels supported: Bundle & Resource
    - Supported Extensions
- Appropriately-labeled Bundles and Resources.
#### Pre-Condition
Sender determines applicable security labels to convey applicable policy.

#### Post-Condition
Sender is able to audit Receiver enforcement of disclosed labeled Resource.

Sender is able to determine whether the Receiver reclassified disclosed labeled Resource upon further disclosure by monitoring Resource Provenance chain.

#### Actions

Sender receives Receiver Client Registration request, which includes Receiver Capability Statement.

Sender inspects Receiver's Security Labeling Capability Statements to determine whether Receiver Capabilities exceed, match, or are less than Sender Security Labeling Capabilities.

*Happy Path:* 

- Receiver's Security Labeling Capabilities match Sender Security Labeling Capabilities.

- Sender returns requested Resources with applicable security labels.

*Unhappy Path:*
- Sender determines that the Receiver's Security Labeling Capabilities are not aligned and declines the request. 
- The Sender or Receiver may invoke a trust negotiation to resolve the incompatibilities for future interactions.
 

### Receiver-Side Enforcement 

#### Assumption
Receiver has implemented Security Labeling and Privacy-Preserving Authorization Services, including: 

- creating a discoverable/shareable Security Labeling Capability Statement: 
    - listing the security label tags required to convey each applicable policy used by `sec-label-basis` extension.
    - indicating that the Receiver supports `display`, `sec-label-classifier`, and `sec-label-related-artifact` extensions.
    - posting the discoverable Security Labeling Capability Statements for each supported policy.
- implementing the capabilities required for consuming security labels and enforcing all the policies implied by them at both the Resource- and Bundle-level ([High Water Mark](glossary.html#hwm)).

#### Pre-Condition
Receiver determines applicable security labels to convey applicable policy.

#### Post-Condition
Receiver manages and monitors its adherence to Sender Resource security labels.

Receiver is able to audit downstream Recipient enforcement of disclosed Resource security labels. 

Receiver is able to determine whether a downstream Recipient reclassified disclosed Resource security labels by monitoring Resource Provenance chain.

#### Actions
Receiver discovers and retrieves prospective Sender Security Labeling Capability Statement.

*Happy Path*: 
- Receiver compares Sender Security Labeling Capability Statements with its own and determines that it is able to support security labels for applicable policies.

- Receiver requests Client Registration, thereby agreeing to the Sender Security Labeling Capability Statement.

- Receiver requests Resource with security labels.

- Sender sends Receiver the labeled Resource.

- Receiver consumes labeled Resource and persists associated security labels.

*Unhappy Path:*
- Receiver determines that its Security Labeling Capabilities are not aligned with the Sender's and avoids requesting information from the Sender. 
- The Sender or Receiver may invoke a trust negotiation to resolve the incompatibilities for future interactions.
### Security Labeling Service as a Utility
#### Assumption
- The EHR has established a trust relation with a SLS provider that enables the EHR to access the SLS API.
- The EHR has implemented the integration logic required to connect with the SLS API and to incorporate security labeling into the EHR workflows compliant with policies and requirements.
- The SLS API recognizes and supports the security labeling policies applicable the data in custody of the EHR.
- If the EHR operations in multiple jurisdictions the SLS API allows the EHR  to specify the applicable jurisdictions (that determine the security labeling policies) for a given resource of bundle.
  
#### Pre-Condition
The EHR determines the jurisdiction/context applicable to the resource/bundle.

#### Post-Condition
Resource/bundle, labeled by the SLS, is incorporated back in the EHR workflow.

#### Actions
- Triggered by local workflow events, the EHR system makes an API call to the SLS specifying the resource/bundle that needs to be labeled, alongside, context attributes that could include a range of additional information including jurisdictional, policy, or workflow context.
- Considering all the applicable policies and based on the context attributes, the SLS determine the labels and returns a labeled version of the resource/bundle.
