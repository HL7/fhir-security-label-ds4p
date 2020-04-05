### Sender Security Labeling (SL) Capability

#### Assumption
Sender has implemented SL.

#### Pre-Condition
Sender determines applicable SLs to convey applicable policy.

#### Post-Condition
Sender is able to audit Receiver enforcement of disclosed Resource SL.

Sender is able to determine whether the Receiver reclassified disclosed Resource SL upon further disclosure by monitoring Resource Provenance chain.

#### Actors & Actions
Sender creates a discoverable/shareable Security Labeling (SL) Capability Statement:

- Listing the SL tags required to convey each applicable policy, using the `sec-label-basis` extension.
- Indicating that the Sender supports `must-display`, `sec-label-classifier`, and `sec-label-related-artifact` extensions.

Sender implements ability to assign SLs at both the Bundle (High Watermark) and `Resource.meta.security`.

Sender posts discoverable SL Capability Statements for each supported policy.

Sender receives Receiver Client Registration request, which includes Receiver Capability Statement.

Sender compares Sender and Receiver SL Capability Statements to determine whether Receiver Capabilities exceed, match, or are less than Sender SL Capabilities.

(Happy Path) Receiver SL Capabilities matches Sender SL Capabilities.

Sender returns requested Resources with applicable SL.

#### Artifacts
Discoverable Capability Statement, which includes:
- Labeling levels supported: Bundle & Resource
- Supported Extensions

Appropriately labeled Bundles and Resources.

### Receiver SL Capabilit

#### Assumption
Receiver has implemented SL and Privacy Preserving Authorization Services.

#### Pre-Condition
Receiver determines applicable SLs to convey applicable policy.

#### Post-Condition
Receiver manages and monitors its adherence to Sender Resource SLs.

Receiver is able to audit downstream Recipient enforcement of disclosed Resource SL. 

Receiver is able to determine whether a downstream Recipient reclassified disclosed Resource SL by monitoring Resource Provenance chain.

#### Actors & Actions
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

#### Artifacts
Discoverable Capability Statement, which includes:
- Labeling levels supported: Bundle & Resource
- Supported Extensions

Verification of persisted and enforced SL.
