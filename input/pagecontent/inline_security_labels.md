In FHIR core, any security label that applies to a resource is recorded at the resource level on `Resource.meta.security`. This mechanism works well for cases where either the security label applies to the entire resource, or where tracking the precise part of the resource to which the label applies is not important.
There are some use cases, however, where a security label only applies to an element or portion of a resource, and it is important for the use case to track accurately the precise portions of the resource to which the label applies. Some of these use cases are briefly discussed below.

Inline security labels are defined to enable recording a security label on a portion of a FHIR resource via an extension (`extension-inline-sec-label`). This extension can appear on any element of a resource where an extension is allowed, so, it provides a powerful mechanism to assign security labels at the sub-resources level and at various levels of granularity.

Processing inline labels is more computationally costly for the resource consumer since, instead of simply looking at `Resource.meta.security`, it has to parse and scan the entire resource to look for inline security labels. To assist consumers in this process, the security label `PROCESSINLINELABEL` (from the `ObligationPolicy` value set in [v3-ActCode](http://terminology.hl7.org/CodeSystem/v3-ActCode)) shall be used to indicate whether a resource contains inline security labels. Security labeling service must include this code at the resource level (`meta.security`) on any resource containing inline labels. The consumer of a resource may look for this code to decide whether it should invoke a deep inspection of the resource to look for inline security labels.

As shown in the example below, in case where multiple labels are applicable to the same portion of the resource, these labels are modeled with recurring instances of the extension (in the form of an extension array in JSON or repeated elements in XML).

Inline security labels may be used in conjunction with resource-wide labels. Resource-wide labels specify labels that apply to the entire resource. In some cases resource-wide labels are orthogonal to inline labels; for example, a confidentiality label at the resource level and an inline integrity label for a portion of the resource. Inline labels may also express _additional_ restrictions further to resource-wide labels to provide a more precise and granular assignment of labels; for example, a _very restricted_ label for a portion of the resource, alongside a _restricted_ label at the resource level, indicates that a specific portion of a _restricted_ resource is of a higher level of confidentiality at the _very restricted_ level. 

Resource-wide labels should also be used to record the [High Water Mark (HWM)](glossary.html#hwm) for cases where the sender and receiver follow a High Water Mark rule that requires that the result be assigned the highest classification level when information is combined from several targets. This is important to accommodate clients that are unable to process inline labels so that the client can take the most protective measures for the resource if granular protections at the sub-resource level is not possible.

Details of computing HWM labels is a matter of policy and often depends on the vocabulary. For the [Confidentiality](https://terminology.hl7.org/ValueSet-v3-Confidentiality.html) labels, the highest level of confidentiality should be assigned as the HWM, based on the ordering discussed in the [Conceptual Structure section](security_labeling_conceptual_structure.html#how-to-assign-a-security-label). Note that a more comprehensive discussion on HWM is a roadmap item and future work for this IG.

When both inline and resource-wide labels are present, a consumer must apply the highest level of protection resulting from all the resource-wide as well as inline labels, when processing the labeled portion of the resource. For example, when a resource is labeled with display mark and a portion of the resource is marked with an inline confidentiality label, the labeled portion is subject to the protective measures implied by both of those labels (e.g., masking _and_ display mark when unmasked).
Note that the inline label of a sub-resource may include any of the other extensions that may be used in a resource-wide label.

The following excerpt shows an example of inline labeling. First, the resource is labeled with the `PROCESSINLINELABEL` code in its `meta.security` section to indicate that the resource includes inline security labels and the consumer should scan and process those inline labels. Then, in the `identifier` element, using the `extension-inline-sec-label` extension, one of the identifiers that records the US Social Security Number (SSN) is tagged with a _restricted_ (`R`) confidentiality label. A resource-wide label is also present to indicate a mark. Note that this example leaves out the HWM labels.

```json
{
  "resourceType": "Patient",
  "meta": {
    "security": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
        "code": "PROCESSINLINELABEL"
      },
      {
        "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
        "code": "RedisclosureProhibitionMark"
      }
    ]
  },
  "identifier": [
    {
      "use": "official",
      "system": "http://hl7.org/fhir/sid/us-ssn",
      "value": "111-22-3333",
      "extension": [
        {
          "url": "http://hl7.org/fhir/uv/security-label-ds4p/StructureDefinition/extension-inline-sec-label",
          "valueCoding": {
            "system": "http://terminology.hl7.org/CodeSystem/v3-Confidentiality",
            "code": "R",
            "display": "restricted"
          }
        },
        {
          "url" : "http://hl7.org/fhir/uv/security-label-ds4p/StructureDefinition/extension-inline-sec-label",
          "valueCoding" : {
            "system" : "http://terminology.hl7.org/CodeSystem/v3-ObservationValue",
            "code" : "PATRPT",
            "display" : "patient reported"
          }
       }
      ]
    }
  ]
}
```

### Sample Use Cases

This section briefly discusses some of the use cases where inline labels can be used to address the need for fine-grained labeling at the sub-resource level.

#### Level of Confidence

An inline security label can be used to record the level of trust or verification in a piece of information recorded as part of a resource. For example, a patient identifier recording a driver's license number can indicate, via an inline security label, that this information is not reliable because the driver's license has not been viewed and verified and the number is simply provided by the patient using a web form. Similarly, a patient phone number, or email address can be marked, using an inline security label, as unverified, to indicate that no callback or email verification has taken place to verify this information.

Another example is using an inline label on a reference element that connects a resource (such as an observation) to a patient to reflect the confidence level of the creator of a resource in the association of the resource to the patient. Note that in this case, the producer has confidence in the resource content (for example an observation about patient's health) but since the patient has not been sufficiently authenticated, it needs to reflect the level of reliability in associating that information with a patient resource that pre-exists in the system.

Note that putting these labels at the resource level is of little value since it does not distinguish which piece of information (e.g., which identifier, email, phone number, or address) is unreliable.

#### Confidentiality

An inline confidentiality label can specify the additional sensitivity of a piece of information in a resource. For example, confidential identifiers (such as Social Security Number) can be marked with a confidentiality label to indicate the sensitivity of the identifier. Or as another example, in use cases regarding at-risk individuals (e.g., victims of violence or individuals staying at a shelter), the current address is considered _very restricted_ while old addresses or mailing addresses do not have such sensitivity.

Granular application of security labels using the inline labeling mechanism enables the consumers to apply additional protective measures (such as masking the particular data element on the screen to prevent accidental exposure).
