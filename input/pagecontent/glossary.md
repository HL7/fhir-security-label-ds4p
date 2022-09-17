
These definitions are based on the glossary of the [HL7 Healthcare Privacy and Security Classification System (HCS)](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=345), Release 1, Volume 1.

<a name="access-security-level"></a>

### Access (Security) Level
The combination of a hierarchical security classification and a security category that represents the sensitivity of an object or the security clearance of an individual [[ISO 2382-8](http://www.itu.int/rec/dologin_pub.asp?lang=e&amp;id=T-REC-X.812-199511-I!!PDF-E&amp;type=items)].

A level associated with an individual who may be accessing information (for example, a clearance level) or with the information which may be accessed (for example, a classification level) [[HIPAA Security Glossary](http://aspe.hhs.gov/admnsimp/nprm/seclist.htm)].

<a name="adi"></a>

### Access Control Decision Information (ADI)
The portion (possibly all) of the ACI made available to the ADF in making a particular access control decision [[ISO 10181-3/ITU X.812](http://www.itu.int/rec/T-REC-X.812-199511-I/en)].

<a name="aci"></a>

### Access Control Information (ACI)
Any information used for access control purposes, including contextual information [[ISO 10181-3](http://www.itu.int/rec/T-REC-X.812-199511-I/en)].

<!--
### Access Control Service
A service that provides the basic operational aspects of access control such as making access control decision information (ADI) available to access decision components and performing access control functions. The service also provides security labeling and privacy and security protection functions.The service, known as an Access Control Service (ACS), requires the following information: access policy rules, contextual information needed to interpret ADI, initiator, target, and access request ADI, security labeling rules and vocabulary, and transform rules and services.

ACS generates information made available to other elements includes transformed information response to an information request as well as handling caveats. [[HL7 PASS-Security Labeling Service](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=360)].
-->


<a name="classification"></a>

### Classification
Confidential protection of data elements by segmentation into restricted and specifically controlled categories set by policies [Adapted from [ASTM E1986-98(2005)](https://www.astm.org/e1986-98r05.html)].

<a name="clearance"></a>

### Clearance
Initiator-bound access control information (ACI) that can be compared with security labels of targets [[ISO 10181-3/ITU X.812](http://www.itu.int/rec/T-REC-X.812-199511-I/en)].

Permission granted to an individual to access data or information at or below a particular security level [[ISO/IEC 2382-8:1998](http://www.itu.int/rec/dologin_pub.asp?lang=e&id=T-REC-X.812-199511-I!!PDF-E&type=items)].

<a name="clinical-attribute"></a>

### Clinical Attribute
Any clinical characteristic that binds a health care relevant parameter to a clinical element by a rule. Parameters may include authorship, category of information, terminological characteristics, history of permutations, integrity and provenance, as well as the relationship to and inclusive of associated clinical facts necessary to provide context essential for applying security labels. ([PCAST](http://www.whitehouse.gov/sites/default/files/microsites/ostp/pcast-health-it-report.pdf) discusses attributes that provide context to clinical data elements such as patient demographics).

<a name="clinical-attribute-set"></a>

### Clinical Attribute Set
The complete collection of parameters that in total describe the relevant characteristics of a clinical fact.   These include, clinical attributes, security labels and provenance:    For example, the patient's name and birthdate, diagnosis code, the applicable privacy rules and policies, including any patient's pre-consented privacy choices security label classification and sensitivity codes, and the data source (provider).


<a name="clinical-element"></a>

### Clinical Element
A clinical object that has been disaggregated into the smallest possible data element suitable for use in a healthcare context. ([PCAST](http://www.whitehouse.gov/sites/default/files/microsites/ostp/pcast-health-it-report.pdf) p. 70 description of clinical elements as the smallest clinical data units that make sense to exchange and aggregate.)

<a name="clinical-fact"></a>

### Clinical Fact
A healthcare data IT resource comprised of a clinical element associated or "tagged" with at least one clinical attribute such as a clinical information category, patient information, and provenance. A clinical fact is a type of "tagged data element." ([PCAST](http://www.whitehouse.gov/sites/default/files/microsites/ostp/pcast-health-it-report.pdf) p. 89 "Tagged data element: Data accompanied by metadata describing the data.").

<a name="clinical-rule"></a>

### Clinical Rule
A computational algorithm used for assigning a clinical attribute to a clinical element.

<a name="compartment"></a>

### Compartment
A security label tag that "segments" an IT resource by indicating that access and use is restricted to members of a defined community or project.
A set of categories in a security label [Sandhu].

<a name="compartment-based-policies"></a>

### Compartment-Based Policies
In a compartment-based policy, sets of targets are associated with a named security compartment or category, which isolates them from other targets. Users need to be given a distinct clearance for a compartment to be able to access targets in the compartment [Ford; chapter 6, p.155].

<a name="compartmentalization"></a> 

### Compartmentalization
A division of data into isolated blocks with separate security controls for the purpose of reducing risk [[ISO 7498-2](http://www.itu.int/rec/dologin_pub.asp?lang=e&id=T-REC-X.800-199103-I!!PDF-E&type=items)]. For example, the division of data in a major project into blocks corresponding to sub-projects, each with its own security protection, in order to limit exposure of the overall project.

<a name="confidentiality"></a>

### Confidentiality
Privacy metadata classifying an IT resource (data, information object, service, or system capability) according to its level of sensitivity, which is based on an analysis of applicable privacy policies and the risk of financial, reputational, or other harm to an individual or entity that could result if made available or disclosed to unauthorized individuals, entities, or processes.Usage Notes: Confidentiality codes are used in security labels and privacy markings to classify IT resources based on sensitivity to indicate the custodian or receiver obligation to ensure that the protected resource is not made available or redisclosed to individuals, entities, or processes (security principals) per applicable policies. Confidentiality codes are also used in the clearances of initiators requesting access to protected resources. 

Definition aligns with ISO 7498-2: Confidentiality is the property that information is not made available or disclosed to unauthorized individuals, entities, or processes. (HL7 Confidentiality code system `2.16.840.1.113883.5.25` and value set `2.16.840.1.113883.1.11.10228`).

<a name="cui"></a>

### Controlled Unclassified Information (CUI)
CUI is information the Government creates or possesses, or that an entity creates or possesses for or on behalf of the Government, that a law, regulation, or Government-wide policy requires or permits an agency to handle using safeguarding or dissemination controls. However, CUI does not include classified information (see definition above) or information a non-executive branch entity possesses and maintains in its own systems that did not come from, or was not created or possessed by or for, an executive branch agency or an entity acting for an agency. Law, regulation, or Government-wide policy may require or permit safeguarding or dissemination controls in three ways: Requiring or permitting agencies to control or protect the information but providing no specific controls, which makes the information CUI Basic; requiring or permitting agencies to control or protect the information and providing specific controls for doing so, which makes the information CUI Specified; or requiring or permitting agencies to control the information and specifying only some of those controls, which makes the information CUI Specified, but with CUI Basic controls where the authority does not specify.

<a name="data-segmentation"></a>

### Data Segmentation
Process of sequestering from capture, access, or view certain data elements that are perceived by a legal entity, institution, organization or individual as being undesirable to share [GWU].

<a name="dursa"></a>

### Data Use and Reciprocal Support Agreement (DURSA)
A comprehensive, multi-party trust agreement signed by all eligible entities who wish to exchange data.

<a name="hcs"></a> 

### Healthcare Privacy and Security Classification System (HCS)
A defined scheme for the classification and handling of health care and healthcare related information.

<a name="hwm"></a>

### High Water Mark (HWM)
"Rule that when information is combined from several targets, the result is assigned the highest classification level."
[_Warwick Ford, Computer Communications Security: Principles, Standard Protocols & Techniques 29-30 (1994)_]

"high water mark [is the] maximum potential impact values for each security objective from the information types resident on the acquisition system." [FIPS.199](https://csrc.nist.gov/publications/detail/fips/199/final)
 
"If individual portions are classified at one level, but the compilation is a higher classification, mark each portion with its own classification, and mark the document and pages with the classification of the compilation."
[_DOD Information Security Chapter 5 Marking:  5-206 Identification of Specific Classified Information_]

<a name="it-resource"></a>

### IT Resource
Any data, information object, operation, process, service, or system capability. An IT resource that is assigned a security label is sometimes referred to as a "security object". An IT resource that is represented as a requested security object of an initiator's access request is sometimes referred to as a "target".

<!--
Data, service or system component. [[XACML](#XACML)]

The term resource embraces, e.g., information resources, processing resources, communication resources, and physical resources. [[Ford](#Ford)]

An object that is the target of security controls, including data, information, record, system file, service, or capability). [[HL7 RBAC](#HL7RBAC)].

### Metadata 
Data about other data. [[ISO 14721](#ISO14721)].

Data describing context, content, and structure of records and their management through time. [[ISO 15489-1]](#ISO15489).

Structured information that describes, explains, locates, and otherwise makes it easier to retrieve and use an information resource. ([NISO](#NISO)).

Information that characterizes data, such as contextual information. [[PCAST](http://www.whitehouse.gov/sites/default/files/microsites/ostp/pcast-health-it-report.pdf)].

Security labels are a type of security metadata that is associated with a security object/IT resource and considered a [security attribute](#SecurityAttributeDF).
-->
<a name="named-tag-set"></a>

### Named Tag Set
Field containing a Tag Set Name and its associated set of security tags [[NIST FIPS PUB 188](http://www.itl.nist.gov/fipspubs/fip188.htm)].

<!--
### Object
An object is an entity that contains or receives information. The objects can represent information containers (e.g., files or directories in an operating system, and/or columns, rows, tables, and views within a database management system) or objects can represent exhaustible system resources, such as printers, disk space, and central processing unit (CPU) cycles. [[ANSI RBAC](#HL7RBAC)] Synonymous with [IT resource.](#ITResourceDF). 

### Predicate 
A statement about attributes whose truth can be evaluated. [[XACML](#XACML)].

### Privacy

The claim of individuals, groups or institutions to determine for themselves when, how, and to what extent information about them is communicated to others. [[Westin](#Westin)] This definition is foundational for Privacy Act of 1974 (P.L. 93579; 5 U.S.C. § 552a).

Freedom from intrusion into the private life or affairs of an individual when that intrusion results from undue or illegal gathering and use of data about that individual. [[ISO/IEC 2382-8](#ISOIEC2382Pt8)].

The right of individuals to control or influence what information related to them may be collected and stored and by whom and to whom that information may be disclosed. [[ISO 7498-2](#ISO74982)].

[T]he right to control access to one&#39;s person and information about one&#39;s self. The right to privacy means that individuals get to decide what and how much information to give up, to whom it is given, and for what uses.&quot; June 13, 2002, speech to the Freedom of Information and Protection of Privacy Conference [Privacy Commissioner of Canada June 13, 2002](http://www.tbs-sct.gc.ca/pgol-pged/piatp-pfefvp/course1/mod1/mod1-2-eng.asp)].

Individual&#39;s or organization&#39;s right to determine whether, when, and to whom, personal or organizational information is released. Also, the right of individuals to control or influence information that is related to them, in terms of who may collect or store it, and to whom that information may be disclosed. [[HITSP Glossary](http://www.hitsp.org/Handlers/HitspFileServer.aspx?FileGuid=fbd8c2af-1c67-460c-a1f0-2cd6655d0f2d)].
-->

<a name="privacy-mark"></a>

### Privacy Mark
Human readable security labels, which are rendered in the graphic user interface on accessed electronic information, are called privacy marks. The act of enabling the rendering of a privacy mark is called "privacy marking."

If present, the privacy-mark is not used for access control. The content of the privacy-mark may be defined by the security policy in force (identified by the security-policy-identifier) which may define a list of values to be used. Alternately, the value may be determined by the originator of the security-label [[ISO 22600-3](https://www.iso.org/standard/45376.html) Section A.3.4.3].

<a name="provenance"></a>

### Provenance
The history of the ownership of an object, especially when documented or authenticated.   For example, references to a type of equipment, standard clinical procedure, attestable content author, data source, provider or other clinical facts [[PCAST](http://www.whitehouse.gov/sites/default/files/microsites/ostp/pcast-health-it-report.pdf)].

Information about entities, activities, and people involved in producing a piece of data or thing, which can be used to form assessments about its quality, reliability or trustworthiness [[W3C PROV-Overview](http://www.w3.org/TR/2012/WD-prov-overview-20121211/)].

Provenance of a resource is a record that describes entities and processes involved in producing and delivering or otherwise influencing that resource. Provenance provides a critical foundation for assessing authenticity, enabling trust, and allowing reproducibility. Provenance assertions are a form of contextual metadata and can themselves become important records with their own provenance [[W3C Provenance XG Final Report](http://www.w3.org/2005/Incubator/prov/XGR-prov-20101214/#Importance_of_provenance)].

Data provenance is information that helps determine the derivation history of a data product, starting from its original sources. Data product or dataset refers to data in any form, such as files, tables, and virtual collections. Two important features of the provenance of a data product are the ancestral data products from which this data product evolved, and the process of transformation of these ancestral data product(s), potentially through workflows, that helped derive this data product [Simmhan].

The information that documents the history of the Content Information. This information tells the origin or source of the Content Information, any changes that may have taken place since it was originated, and who has had custody of it since it was originated. The archive is responsible for creating and preserving Provenance Information from the point of Ingest; however, earlier Provenance Information should be provided by the Producer. Provenance Information adds to the evidence to support Authenticity [[ISO 14721](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=24683)].

<a name="security-attribute"></a>

### Security Attribute
A security-related quality of an object. Security attributes may be represented as hierarchical levels, bits in a bit map, or numbers. Compartments, caveats, and release markings are examples of security attributes [[NIST FIPS PUB 188](http://www.itl.nist.gov/fipspubs/fip188.htm)].

Characteristic of a subject, resource, action or environment that may be referenced in a predicate or target [[XACML](http://docs.oasis-open.org/xacml/3.0/xacml-3.0-core-spec-cs-01-en.pdf)].

<a name="security-category"></a>

### Security Category
A non-hierarchical grouping of sensitive information used to control access to data more finely than with hierarchical security classification alone [[ISO 2382-8](http://www.itu.int/rec/dologin_pub.asp?lang=e&amp;id=T-REC-X.812-199511-I!!PDF-E&amp;type=items)].

The characterization of information or an information system based on an assessment of the potential impact that a loss of confidentiality, integrity, or availability of such information or information system would have on organizational operations, organizational assets, or individuals [[FIPS](http://fismapedia.org/index.php?title=Security_category)].

If present, the security categories provide further granularity for the sensitivity of the message. The security policy in force is used to indicate the syntaxes that are allowed to be present in the security-categories. Alternately, the security-categories and their values may be defined by bilateral agreement [[ISO 22600-3](https://www.iso.org/standard/45376.html) Section A.3.4.3].

<a name="security-classification"></a>

### Security Classification
The determination of which specific degree of protection against access the data or information requires, together with a designation of that degree of protection; for example, "Top Secret", "Secret", "Confidential" [[ISO 2382-8](http://www.itu.int/rec/dologin_pub.asp?lang=e&amp;id=T-REC-X.812-199511-I!!PDF-E&amp;type=items)].

<a name="security-clearance"></a>

### Security Clearance
See _Clearance_.

<a name="security-label"></a>

### Security Label
_(In the definitions below, &quot;security label&quot; is defined as both a verb: "means used to associate security attributes" as in "security labeling", and as noun: "the markings bound to a resource." As a noun, the term is sometimes considered synonymous with "security metadata" and "security tag." As a verb, the term is sometimes considered synonymous with "tagging." However, security standards sometimes use the term "security label" for both the classification given to IT resources and the classification level in an initiator's clearance. In addition, some standards use the term "marking bound to a resource" to refer to both computable security labels and the human-readable rendering of security label fields, better known as "privacy markings")._

The means used to associate a set of security attributes with a specific information object as part of the data structure for that object [[ISO 10181-3/ITU X.812](http://www.itu.int/rec/T-REC-X.812-199511-I/en)].

Access control information associated with the attribute values being accessed [[ISO/IEC 9594-2:2008/ITU X.501](http://www.itu.int/rec/dologin_pub.asp?lang=e&amp;id=T-REC-X.501-200508-S!!PDF-E&amp;type=items)].

The marking bound to a resource (which may be a data unit) that names or designates the security attributes of that resource. NOTE - The marking and/or binding may be explicit or implicit [[ISO 7498-2](http://www.itu.int/rec/dologin_pub.asp?lang=e&amp;id=T-REC-X.800-199103-I!!PDF-E&amp;type=items)].

The means used to associate a set of security attributes with a specific information object as part of the data structure for that object [[NIST SP 800-53](http://csrc.nist.gov/publications/nistpubs/800-53-Rev3/sp800-53-rev3-final_updated-errata_05-01-2010.pdf)].

Security labels may be used to associate security-relevant information with attributes within the Directory. Security labels may be assigned to an attribute value in line with the security policy in force for that attribute. The security policy may also define how security labels are to be used to enforce that security policy. A security label comprises a set of elements optionally including a security policy identifier, a security classification, a privacy mark, and a set of security categories. The security label is bound to the attribute value using a digital signature or other integrity mechanism [[ISO/IEC 9594-2:2008/ITU X.501](http://www.itu.int/rec/dologin_pub.asp?lang=e&amp;id=T-REC-X.501-200508-S!!PDF-E&amp;type=items)].

A security label, sometimes referred to as a confidentiality label, is a structured representation of the sensitivity of a piece of information. A security label is used in conjunction with a clearance, a structured representation of what information sensitivities a person (or other entity) is authorized to access and a security policy to control access to each piece of information [[XMPP Core](http://xmpp.org/rfcs/rfc6120.html)].

A security label is a type of [PCAST](http://www.whitehouse.gov/sites/default/files/microsites/ostp/pcast-health-it-report.pdf) metadata tag defined as _information that characterizes data, such as contextual information_.

<a name="security-labeling-policy"></a>

### Security (Labeling) Policy
The definition of which classification and category values are used and how security labels are checked against clearances.

<a name="security-labeling-rule"></a>

### Security Labeling Rule
A computational algorithm used for assigning a security label to an IT resource such as a clinical fact.

<a name="spif"></a>

### Security Policy Information File (SPIF)
A construct that conveys domain-specific security policy information [[ISO/IEC 15816](http://www.itu.int/rec/dologin_pub.asp?lang=e&id=T-REC-X.841-200010-I!!PDF-E&type=items)].

An XML schema, that provides a high level representation of a security labeling policy in a generic and open fashion [[Open XML SPIF](http://www.xmlspif.org/?page_id=51)].

[ISO/IEC 15816:2002 Information technology — Security techniques — Security information objects for access control](https://www.iso.org/standard/29139.html)

The Security Policy Information File contains a sequence of the following:

- `versionInformation` – indicates the version of the ASN.1 syntax and associated semantics of the Security Policy Information File specification.
- `updateInformation` – indicates the currency of the security policy information file data.
- `securityPolicyIdData` – identifies the security policy to which the Security Policy Information File applies.
- `privilegeId` – indicates the OID that identifies the syntax included in the clearance attribute security category of relying certificates used in conjunction with the Security Policy Information File. The syntax indicated by privilegeId must be consistent with that indicated by `rbacId`.
- `securityClassifications` – maps the classification of the security label to a classification in the clearance
attribute, and also provides equivalency mappings.
- `rbacId` – rule based access control object identifier which identifies the syntax included in the securityLabel security category that is used in conjunction with the Security Policy Information File. The syntax indicated by `rbacId` must be consistent with that indicated by privilegeId.
- `securityCategories` – maps the security categories of the security label to the security categories in the clearance attribute, and also provides equivalency mappings.
- `equivalentPolicies` – consolidates all equivalent policies in the SPIF.
- `defaultSecurityPolicyIdData` – identifies the security policy which will apply if data is received without a security label.
- `extensions` – provides a mechanism to include additional capabilities as future requirements are identified.
The Security Policy Information File is a signed object to protect it from unauthorized changes.

<a name="security-tag"></a> 

### Security Tag
Information unit containing a representation of certain security-related information (e.g., a restrictive attribute bit map) [[NIST FIPS PUB 188](http://www.itl.nist.gov/fipspubs/fip188.htm)].

<a name="segmentation"></a>

### Segmentation
The process of sequestering from capture, access or view certain data elements or "datatypes" (clinical information categories) that are perceived by a legal entity, institution, organization, or individual as being undesirable to share.

<a name="sensitivity"></a>

### Sensitivity
The characteristic of a resource which implies its value or importance and may include its vulnerability [[ISO/IEC 7498-2](http://www.itu.int/rec/dologin_pub.asp?lang=e&amp;id=T-REC-X.800-199103-I!!PDF-E&amp;type=items)].

<a name="sensitivity-label"></a>

### Sensitivity Label
Security labels which support data confidentiality models, like the Bell and LaPadula model. The sensitivity label tells the amount of damage that will result from the disclosure of the data and also indicates which measures the data requires for protection from disclosure. The amount of damage that results from unauthorized disclosure depends on who obtains the data; the sensitivity label should reflect the worst case [[IETF RFC 1457](http://www.faqs.org/rfcs/rfc1457.html)].

<a name="share-with-protections"></a>

### Share with Protections
Share with Protections is an information exchange paradigm that refers to an ecosystem where sharing of information is encouraged and enables by: 

- communicating policies and handling instructions via security labels, 
- continuous end-to-end protections, and 
- overarching trust agreements between senders and receivers. 

The core concepts are:
- Senders and receivers establish a broad trust relationship by agreeing on, and ensuring a mutual understanding of machine-readable standards-based security labels,
- Senders use standards-based security labels to shared data to indicate its relative sensitivity and any handling instructions, and
- Recipients honor, retain, and enforce senders’ security labels  (in addition to all other local policy requirements)

See the "Share with Protections" [project page](https://confluence.hl7.org/display/SEC/Share+with+Protections+White+Paper+Project).

<a name="tag-set-name"></a>

### Tag Set Name
Numeric identifier associated with a set of security tags [[NIST FIPS PUB 188](http://www.itl.nist.gov/fipspubs/fip188.htm)].

<a name="target"></a>

### Target
A target is a IT resource subject to access control [Ford].

<!--
The set of decision requests, identified by definitions for resource, subject and action that a rule, policy or policy set is intended to evaluate. [[XACML](#XACML)].

A target is an [IT resource](#ITResourceDF) for which an initiator seeks access.
-->

<a name="target-label"></a>

### Target Label
See _Security Label_.

<a name="trust-contract"></a>

### Trust Contract
Sets of rules followed by the parties involved for achieving interoperability [[ISO 22600-2](https://www.iso.org/standard/62654.html)].

<a name="trust-framework"></a>

### Trust Framework
Policy that rules the behavior of a system. The Trust Framework facilitates trustworthy co-operation between domains by defining a common set of security and privacy policies that applies to all collaborating entities, derived from the relevant domain-specific policies across all of those policy domains [[ISO 22600-2](https://www.iso.org/standard/62654.html)].

<a name="trustmark"></a>

### Trustmark
Trustmarks are a visual indication that a service provider is compliant with a federation’s requirements. Trustmarks comprise a very specific subset of compliance marks. In addition to being electronically verifiable, these logos or seals are backed by rigorous third party validation, assessment, or auditing. Certification of conformance and associated trustmarks may be issued by the assessor, the federation, or a separate certifying body on behalf of the federation. The key point is that certification trustmarks result from independent 3rd- party assessments and both the assessing and the certifying organizations stand behind the certifications with their own brand name and reputation. Therefore, trustmarks serve as a reliable and high assurance means to convey compliance with federation rules [[NISTIR 8149](https://www.nist.gov/privacy-framework/nistir-8149)].

**_References:_**
- [GWU] Mellissa M. Goldstein, JD et al, Data Segmentation in Electronic Health Information Exchange: Policy Considerations and Analysis, George Washington University Medical Center, September 29, 2010.
- [Ford] Warwick Ford, Computer Communications Security, Prentice Hall, ISBN 0-13-799453-2, 1994.
- [Sandhu] Sandhu, Ravi S. (1993). "Lattice-based access control models". IEEE Computer 26 (11): 9–19. doi:10.1109/2.241422
- [Simmhan] Yogesh, L. Simmhan, et al, A survey of data provenance in e-science, Newsletter ACM SIGMOD Record, Volume 34 Issue 3, Pages 31 - 36, ACM New York, NY, USA, September 2005.