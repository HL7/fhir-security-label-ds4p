Instance: P001
InstanceOf: Patient
Description: "A simple example showing how to use the display extension to require the consumer to display a US-realm Controlled Unclassified Information (CUI) mark."
Usage: #example

* meta.extension[0].url = "http://hl7.org/fhir/uv/security-label-ds4p/StructureDefinition/extension-display"
* meta.extension[0].valueAnnotation.authorReference.type = "Organization"
* meta.extension[0].valueAnnotation.authorReference.display = "Veteran Health Administration"
* meta.extension[0].valueAnnotation.text = "**CUI//SP-HLTH/HLTH/PRVCY**\r\n\r\n ([Veterans Health Administration, Washington, DC 20420](http://example.fhir.org/Organization/vha))"

* active = true


Instance: example-extension-display
InstanceOf: Observation
Description: "A simple example showing how to use the display extension to require the consumer to display a US-realm Controlled Unclassified Information (CUI) mark."
Usage: #example

* meta.extension[0].url = "http://hl7.org/fhir/uv/security-label-ds4p/StructureDefinition/extension-display"
* meta.extension[0].valueAnnotation.authorReference.type = "Organization"
* meta.extension[0].valueAnnotation.authorReference.display = "Veteran Health Administration"
* meta.extension[0].valueAnnotation.text = "**CUI//SP-HLTH/HLTH/PRVCY**\r\n\r\n ([Veterans Health Administration, Washington, DC 20420](http://example.fhir.org/Organization/vha))"

* status = #preliminary

* code.coding[0].system = "http://loinc.org"
* code.coding[0].code = #600-7
* code.coding[0].display = "Bacteria identified in Blood by Culture"

* subject = Reference(Patient/P001)
