### Extensions Summary
The following extensions are defined by this IG:
- The `must-display` extension to require the consumer to display a specific mark on any rendering of the resource in print or electronic user interfaces.
- The `sec-label-basis` extension which enables specifying the policy or regulation based on which a label has been assigned.
- The `sec-label-related-artifact` extension which enables recording a pointer to an artifact related to the label, particularly, a consent directive based on which the label has been assigned, or a provenance resource which furhter backs up assigning an integrity lalbel.
- the `sec-label-classifer` extension which enables recording the entity that has assigned or updated the label.

#### `must-display` Extension
The must-display extension is based on the [`Annotation` Data Type](https://www.hl7.org/fhir/datatypes.html#Annotation), which is text note that also contains information about who made the statement and when.

This extension SHOULD be used in the context of `Resource.meta` when codes from the `PrivacyMark` or `SecurityLabelMark`  value sets, e.g., CUI or COPYMark codes, are used on the Resource which indicate that certain information is to be rendered to end users. The `PrivacyMark` or `SecurityLabelMark` code definitions include the information to be displayed. The must-display extension supports inclusion of the Annotation’s author and contact, and markdown for how the information is to be displayed.

The ability to convey renderable `PrivacyMark` or `SecurityLabelMark` security labels, including the author and the markdown role may be required by classification policies within a domain.

#### `sec-label-basis` Extension
The `sec-label-basis` extension is not based on an existing FHIR artifact.
 
This extension SHALL be used on a security label (i.e., in the context of `Resource.meta.security`) if there is only one policy being conveyed by the all of the security label elements in meta.  When more than one policy is conveyed by the security label elements in meta, this extension SHALL be used each security label element used to convey a specific policy. 
 
For example, if a federal agency labels a Resource as 42 CFR Part 2 information, then the Resource would have both Part 2 and CUI security labels in the meta.  As a result, all the Part 2 security labels would have a sec-label-basis extension indicating that the basis for the label is Part 2, and all the CUI security labels would have a sec-label-basis indicating that the basis for the label is CFR 32 Part 2002.
 
The need:  In HCS, the key/value pairs in a Security Label are called Named Tag Sets/Tag Sets and the values are Tags.
A Security Label instance represents applicable policy as a specified set of Named Tag Sets/Tag Sets with applicable Tag values.
This pattern is followed explicitly in HL7 V2.9 and DS4P CDA IG.
In FHIR, there's no differentiation between Named Tag Sets/Tag Sets, so there is no built-in way to delineate the `<security>` elements belonging to a specific policy.
In order to address this in the FHIR DS4P IG, we propose the use of `extension-sec-label-basis` on each `<security>` within a group of `<security>` elements belonging to a specific policy.
 
#### `sec-label-classifier` Extension

The `sec-label-classifier` extension is based on [`Contributor` MetaData Type](http://build.fhir.org/metadatatypes.html#contributor).

This extension SHOULD be used on a security label (i.e., in the context of `Resource.meta.security`) so that the type, name, and contact information for the contributor of a security label can be identified and retrieved. 

For example, the security label codes may originally be assigned by a classifier authority or agent.

Later, the security label code may be reclassified with a different code when the governing policy of a Resource changes.  Use cases for changing security labels include:

Permitting more or less restrictive confidentiality level protection, e.g., in the US, from _normal_ under HIPAA to _moderate_ once released via an Individual Right of Access Directive. For example, if a patient discloses a HIPAA governed Resource to a non-HIPAA covered entity, that Resource is no longer protected at the level of HIPAA, which is the “norm” for protection in the US.  The patient disclosed information would be protected under laws that are different from the norm, and are typically less protective.  So, the confidentiality label would be downgraded from _normal_ to _moderate_.  The entity downgrading the patient disclosed information may or may not be the patient. It could be done by the disclosing Covered Entity or a third party App based on the patient’s Right of Access Directive.

Different, broader, or narrower sensitivity, e.g., access may be to all substance use disorder information rather than limited to opioid use disorder information.

Different, broader, or narrower purposes of use, e.g., from all types of research purposes to disease specific purposes.
When information is aggregated or disaggregated, there may be a need to change classification of the resulting content Declassified, i.e., removing a security label code, e.g., when information is made public with no restrictions on access. 

The ability to convey the authority or agent name, contact, and classification role may be required by classification policies within a domain.

#### `sec-label-related-artifact` Extension

The `sec-label-related-artifact extension` is based on the Related Artifact [`MetaData` Type](http://hl7.org/fhir/R4/metadatatypes.html#RelatedArtifact). The `RelatedArtifact` structure defines resources related to a module such as previous and next versions of documents, documentation, citations, etc. Note that the name resource here is being used in a more general sense than the FHIR-specific Resource. The related resource may be a FHIR resource, or it may be another type of resource, represented using the Attachment data type.

This extension SHOULD be used on a security label code for which justification or documentation can be found in an attached or discoverable information instance.  Examples include a policy security label code, which is justified based on a law, patient consent directive, or organizational policy; a provenance security label, which is documented by a Provenance Resource; a trust security label code, which is documented by a trust accreditation certificate, trust mark,  or a trust agreement such as a DURSA.
