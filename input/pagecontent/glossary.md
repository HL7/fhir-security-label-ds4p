
These defintions are based on the glossary of the [HL7 Healthcare Privacy and Security Classification System (HCS)](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=345), Release 1, Volume 1.

### Access (Security) Level
The combination of a hierarchical security classification and a security category that represents the sensitivity of an object or the security clearance of an individual. [[ISO 2382-8](#ISO23823)]
A level associated with an individual who may be accessing information (for example, a clearance level) or with the information which may be accessed (for example, a classification level). [[HIPAA Security Glossary](http://aspe.hhs.gov/admnsimp/nprm/seclist.htm)].

### Access Control Decision Information (ADI)
The portion (possibly all) of the ACI made available to the ADF in making a particular access control decision. [[ISO 10181-3/ITU X.812](http://www.itu.int/rec/T-REC-X.812-199511-I/en)].


### Access Control Information (ACI) 
Any information used for access control purposes, including contextual information. [[ISO 10181-3/ITU X.812](http://www.itu.int/rec/T-REC-X.812-199511-I/en)].

<!--- 
### Access Control Service
A service that provides the basic operational aspects of access control such as making access control decision information (ADI) available to access decision components and performing access control functions. The service also provides security labeling and privacy and security protection functions.The service, known as an Access Control Service (ACS), requires the following information: access policy rules, contextual information needed to interpret ADI, initiator, target, and access request ADI, security labeling rules and vocabulary, and transform rules and services.

ACS generates information made available to other elements includes transformed information response to an information request as well as handling caveats. [[HL7 PASS-Security Labeling Service](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=360)].
--->

### Classification
Confidential protection of data elements by segmentation into restricted and specifically controlled categories set by policies. [Adapted from [ASTM E-1986](#ASTME1986)]

### Clearance
Initiator-bound access control information (ACI) that can be compared with security labels of targets. [[ISO 10181-3/ITU X.812](http://www.itu.int/rec/T-REC-X.812-199511-I/en)].

Permission granted to an individual to access data or information at or below a particular security level. [[ISO/IEC 2382-8:1998](#ISOIEC2382Pt8)].


### Clinical attribute 
Any clinical characteristic that binds a health care relevant parameter to a clinical element by a rule. Parameters may include authorship, category of information, terminological characteristics, history of permutations, integrity and provenance, as well as the relationship to and inclusive of associated clinical facts necessary to provide context essential for applying security labels. ([PCAST](http://www.whitehouse.gov/sites/default/files/microsites/ostp/pcast-health-it-report.pdf) discusses attributes that provide context to clinical data elements such as patient demographics).

### Clinical Attribute set 
The complete collection of parameters that in total describe the relevant characteristics of a clinical fact.   These include, clinical attributes, security labels and provenance:    For example, the patient's name and birthdate, diagnosis code, the applicable privacy rules and policies, including any patient's pre-consented privacy choices security label classification and sensitivity codes, and the data source (provider).

### Clinical element
A clinical object that has been disaggregated into the smallest possible data element suitable for use in a healthcare context. ([PCAST](http://www.whitehouse.gov/sites/default/files/microsites/ostp/pcast-health-it-report.pdf) p. 70 description of clinical elements as the smallest clinical data units that make sense to exchange and aggregate.)

### Clinical fact
A healthcare data IT resource comprised of a clinical element associated or "tagged" with at least one clinical attribute such as a clinical information category, patient information, and provenance. A clinical fact is a type of "tagged data element." ([PCAST](http://www.whitehouse.gov/sites/default/files/microsites/ostp/pcast-health-it-report.pdf) p. 89 "Tagged data element: Data accompanied by metadata describing the data.").

### Clinical rule 
A computational algorithm used for assigning a clinical attribute to a clinical element.

### Compartment
A security label tag that "segments" an IT resource by indicating that access and use is restricted to members of a defined community or project.
A set of categories in a security label. [[Sandhu](#Sandhu)] 

### Compartment-based policies:
In a compartment-based policy, sets of targets are associated with a named security compartment or category, which isolates them from other targets. Users need to be given a distinct clearance for a compartment to be able to access targets in the compartment. ([Ford](#Ford) Chapter 6 p.155).

### Compartmentalization
A division of data into isolated blocks with separate security controls for the purpose of reducing risk. [[ISO 7498-2](#ISO74982)]
Example: The division of data relative to a major project into blocks corresponding to subprojects, each with its own security protection, in order to limit exposure of the overall project. 

### Confidentiality 
Privacy metadata classifying an IT resource (data, information object, service, or system capability) according to its level of sensitivity, which is based on an analysis of applicable privacy policies and the risk of financial, reputational, or other harm to an individual or entity that could result if made available or disclosed to unauthorized individuals, entities, or processes.Usage Notes: Confidentiality codes are used in security labels and privacy markings to classify IT resources based on sensitivity to indicate the custodian or receiver obligation to ensure that the protected resource is not made available or redisclosed to individuals, entities, or processes (security principals) per applicable policies. Confidentiality codes are also used in the clearances of initiators requesting access to protected resources. 

Definition aligns with ISO 7498-2: Confidentiality is the property that information is not made available or disclosed to unauthorized individuals, entities, or processes. (HL7 Confidentiality code system `2.16.840.1.113883.5.25` and value set `2.16.840.1.113883.1.11.10228`).

### Controlled Unclassified Information (CUI) 
CUI is information the Government creates or possesses, or that an entity creates or possesses for or on behalf of the Government, that a law, regulation, or Government-wide policy requires or permits an agency to handle using safeguarding or dissemination controls. However, CUI does not include classified information (see definition above) or information a non-executive branch entity possesses and maintains in its own systems that did not come from, or was not created or possessed by or for, an executive branch agency or an entity acting for an agency. Law, regulation, or Government-wide policy may require or permit safeguarding or dissemination controls in three ways: Requiring or permitting agencies to control or protect the information but providing no specific controls, which makes the information CUI Basic; requiring or permitting agencies to control or protect the information and providing specific controls for doing so, which makes the information CUI Specified; or requiring or permitting agencies to control the information and specifying only some of those controls, which makes the information CUI Specified, but with CUI Basic controls where the authority does not specify.

### Data Segmentation 

Process of sequestering from capture, access or view certain data elements that are perceived by a legal entity, institution, organization or individual as being undesirable to share. [[Goldstein GWU](#GWU)].

### Healthcare Privacy and Security Classification System (HCS)

A defined scheme for the classification and handling of health care and healthcare related information.

<!---
### IT Resource
Any data, information object, operation, process, service, or system capability. An IT resource that is assigned a security label is sometimes referred to as a "security object". An IT resource that is represented as a requested security object of an initiator's access request is sometimes referred to as a "target".

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

### Named Tag Set
Field containing a Tag Set Name and its associated set of security tags. [[NIST FIPS PUB 188](http://www.itl.nist.gov/fipspubs/fip188.htm)].

<!---
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

### Privacy Mark
Human readable security labels, which are rendered in the graphic user interface on accessed electronic information, are called &quot;privacy marks.&quot; The act of enabling the rendering of a privacy mark is called &quot;privacy marking&quot;.

If present, the privacy-mark is not used for access control. The content of the privacy-mark may be defined by the security policy in force (identified by the security-policy-identifier) which may define a list of values to be used. Alternately, the value may be determined by the originator of the security-label. [[ISO 22600-3](#ISO226003) Section A.3.4.3].

### Provenance
The history of the ownership of an object, especially when documented or authenticated.   For example, references to a type of equipment, standard clinical procedure, attestable content author, data source, provider or other clinical facts. [[PCAST](http://www.whitehouse.gov/sites/default/files/microsites/ostp/pcast-health-it-report.pdf)].

Information about entities, activities, and people involved in producing a piece of data or thing, which can be used to form assessments about its quality, reliability or trustworthiness. [[W3C PROV-Overview](http://www.w3.org/TR/2012/WD-prov-overview-20121211/)].

Provenance of a resource is a record that describes entities and processes involved in producing and delivering or otherwise influencing that resource. Provenance provides a critical foundation for assessing authenticity, enabling trust, and allowing reproducibility. Provenance assertions are a form of contextual metadata and can themselves become important records with their own provenance. [[W3C Provenance XG Final Report](http://www.w3.org/2005/Incubator/prov/XGR-prov-20101214/#Importance_of_provenance)].

Data provenance is information that helps determine the derivation history of a data product, starting from its original sources.  Data product or dataset refers to data in any form, such as files, tables, and virtual collections. […] Two important features of the provenance of a data product are the ancestral data products from which this data product evolved, and the process of transformation of these ancestral data product(s), potentially through workflows, that helped derive this data product. [[Simmhan](#Simmhan)].

The information that documents the history of the Content Information. This information tells the origin or source of the Content Information, any changes that may have taken place since it was originated, and who has had custody of it since it was originated. The archive is responsible for creating and preserving Provenance Information from the point of Ingest; however, earlier Provenance Information should be provided by the Producer. Provenance Information adds to the evidence to support Authenticity. [[ISO 14721](#ISO14721)).

### Security Attribute
A security-related quality of an object. Security attributes may be represented as hierarchical levels, bits in a bit map, or numbers. Compartments, caveats, and release markings are examples of security attributes. [NIST FIPS PUB 188](http://www.itl.nist.gov/fipspubs/fip188.htm).

Characteristic of a subject, resource, action or environment that may be referenced in a predicate or target. [[XACML](#XACML)].

### Security Classification
The determination of which specific degree of protection against access the data or information requires, together with a designation of that degree of protection. Examples: &quot;Top secret&quot;, &quot;secret&quot;, &quot;confidential&quot;. [ISO 2382-8/T-REC-X.812-1995](http://www.itu.int/rec/dologin_pub.asp?lang=e&amp;id=T-REC-X.812-199511-I!!PDF-E&amp;type=items).

### Security Label (synonymous with _Target Label_)

_(Note to Readers: In the definitions below, &quot;security label&quot; is defined as both a verb: &quot;means used to associate_ [_security attributes_](#SecurityAttributeDF)_&quot; as in &quot;security labeling&quot;, and as noun: &quot;the markings bound to a resource&quot;. As a noun, the term is sometimes considered synonymous with &quot;security metadata&quot; and &quot;_[_security tag_](#SecurityTagDF)_.&quot; As a verb, the term is sometimes considered synonymous with &quot;tagging&quot;. However, authoritative security standards sometimes use the term &quot;security label&quot; for both the classification given to IT resources and the classification level in an initiator&#39;s clearance. In addition, some authoritative standards use the term &quot;marking bound to a resource&quot; to refer to both computable security labels and the human readable rendering of security label fields better known as &quot;privacy markings&quot;)._

The means used to associate a set of security attributes with a specific information object as part of the data structure for that object [[ISO 10181-3/ITU X.812](http://www.itu.int/rec/T-REC-X.812-199511-I/en)].

Access control information associated with the attribute values being accessed. [[ISO/IEC 9594-2:2008/ITU X.501](http://www.itu.int/rec/dologin_pub.asp?lang=e&amp;id=T-REC-X.501-200508-S!!PDF-E&amp;type=items)].

The marking bound to a resource (which may be a data unit) that names or designates the security attributes of that resource. NOTE - The marking and/or binding may be explicit or implicit. [[ISO 7498-2/CCITT Rec. X.800](http://www.itu.int/rec/dologin_pub.asp?lang=e&amp;id=T-REC-X.800-199103-I!!PDF-E&amp;type=items)].

The means used to associate a set of security attributes with a specific information object as part of the data structure for that object. [[NIST SP 800-53](http://csrc.nist.gov/publications/nistpubs/800-53-Rev3/sp800-53-rev3-final_updated-errata_05-01-2010.pdf)].

Security labels may be used to associate security-relevant information with attributes within the Directory. Security labels may be assigned to an attribute value in line with the security policy in force for that attribute. The security policy may also define how security labels are to be used to enforce that security policy. A security label comprises a set of elements optionally including a security policy identifier, a security classification, a privacy mark, and a set of security categories. The security label is bound to the attribute value using a digital signature or other integrity mechanism. [[ISO/IEC 9594-2:2008/ITU X.501] ](http://www.itu.int/rec/dologin_pub.asp?lang=e&amp;id=T-REC-X.501-200508-S!!PDF-E&amp;type=items).

Sensitivity labels are security labels which support data confidentiality models, like the Bell and LaPadula model.  The sensitivity label tells the amount of damage that will result from the disclosure of the data and also indicates which measures the data requires for protection from disclosure.  The amount of damage that results from unauthorized disclosure depends on who obtains the data; the sensitivity label should reflect the worst case. [[IETF RFC 1457](http://www.faqs.org/rfcs/rfc1457.html)].

A security label, sometimes referred to as a confidentiality label, is a structured representation of the sensitivity of a piece of information. A security label is used in conjunction with a clearance, a structured representation of what information sensitivities a person (or other entity) is authorized to access and a security policy to control access to each piece of information. [[XMPP Core](#XMPPCore)].

A security label is a type of [PCAST](http://www.whitehouse.gov/sites/default/files/microsites/ostp/pcast-health-it-report.pdf) Metadata Tag defined as &quot;information that characterizes data, such as contextual information.&quot;

### Security (Labeling) Policy
The definition of which classification and category values are used and how security labels are checked against clearances.

### Security label rule 
A computational algorithm used for assigning a security label to an IT resource such as a clinical fact.

### Security Policy Information File (SPIF) 
A construct that conveys domain-specific security policy information. [[ISO/IEC 15816](#ISOIEC2382Pt8)].

An XML schema, that provides a high level representation of a security labeling policy in a generic and open fashion. [[Open XML SPIF](http://www.xmlspif.org/?page_id=51)].

### Security Tag
Information unit containing a representation of certain security-related information (e.g., a restrictive attribute bit map). [[NIST FIPS PUB 188](http://www.itl.nist.gov/fipspubs/fip188.htm)].

### Segmentation 
The process of sequestering from capture, access or view certain data elements or &quot;datatypes&quot; (clinical information categories) that are perceived by a legal entity, institution, organization, or individual as being undesirable to share.

### Sensitivity 
The characteristic of a resource which implies its value or importance and may include its vulnerability. [[ISO/IEC 7498-2:1989/CCITT Rec. X.800](http://www.itu.int/rec/dologin_pub.asp?lang=e&amp;id=T-REC-X.800-199103-I!!PDF-E&amp;type=items)].

### Sensitivity Label 
Security labels which support data confidentiality models, like the Bell and LaPadula model. The sensitivity label tells the amount of damage that will result from the disclosure of the data and also indicates which measures the data requires for protection from disclosure. The amount of damage that results from unauthorized disclosure depends on who obtains the data; the sensitivity label should reflect the worst case. [[IETF RFC 1457](http://www.faqs.org/rfcs/rfc1457.html)].

### Tag Set Name 
Numeric identifier associated with a set of security tags. [[NIST FIPS PUB 188](http://www.itl.nist.gov/fipspubs/fip188.htm)].

<!---
### Target
A target is a resource subject to access control. [[Ford](#Ford)].

The set of decision requests, identified by definitions for resource, subject and action that a rule, policy or policy set is intended to evaluate. [[XACML](#XACML)].

A target is an [IT resource](#ITResourceDF) for which an initiator seeks access.
--->

### Target Label (synonymous with _Security Label_)
A security label can be used as target ACI to protect a target. Access rules define the access permissions (operations) granted given the security label of the initiator and the security label assigned to a target.If the security policy requires that the ACI held in the security label are used for target ACI, then overall flow of data in and out of that target can be controlled. Hence, the overall flow of data in and out of targets may be analyzed for security domains applying the same security policy. Targets can be created within other targets. The security label of the containing target limits the security labels that may be assigned to the contained target under the rules for the appropriate security policy. Examples of targets to which labels may be applied include: OSI n-entities; Directory Service entries; files held in a file store; database entries. [[ISO/IEC 10181-3](#ISO101813) p. 24].