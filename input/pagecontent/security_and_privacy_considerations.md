Security Labeling is an essential component in a security and privacy framework but is not sufficient to assure all aspects of [FHIR security and privacy](http://hl7.org/fhir/secpriv-module.html). Typically, the information in scope for this IG is [patient sensitive](http://hl7.org/fhir/security.html#Patient), however, this IG may also be profiled for use with non-patient information such as population health or business information.

Since the purpose of security labels is typically to convey a policy safeguarding the confidentiality of labeled information, in most situations, the security label itself is sensitive, and must be protected from unauthorized access. For example, sensitivity labels, or confidentiality labels assigned under a privacy-protective policy, can reveal the nature of the sensitive  information in a resource. Therefore, the `meta.security` portion of a FHIR resource should have the same protection as the labeled information (e.g., encryption in motion and at rest).
 
We recommend using this IG in combination, and as one element within the broader context of a Privacy and Security Framework alongside risk assessment based on the [FHIR Security Module](http://hl7.org/fhir/secpriv-module.html) which provides guidance on [Communications](http://hl7.org/fhir/security.html#http), [Authentication](http://hl7.org/fhir/security.html#authentication), [Authorization](http://hl7.org/fhir/security.html#binding), [Privacy Consent](http://hl7.org/fhir/secpriv-module.html#privacy-consent), [Audit Logging](http://hl7.org/fhir/security.html#audit), [Provenance](http://hl7.org/fhir/provenance.html), 
Security Labels, etc.
 
This IG is policy-agnostic, but any policy-specific profile of this IG should include policy compliance statements relevant to applicable policies and laws.