This section provides some notes on implementing a Security Labeling System (SLS). These notes are informative and are provided as general guidance and examples; implementers are encouraged to design custom models that are tailored to their workflows and use cases. 

### Security Labeling Service
The SLS is a software service that determines and assigns security labels to FHIR resources (and in general other types of data objects) based on different types of applicable _Labeling Rules_ that stipulate how data should be labelled. Labeling rules could be rooted in clinical knowledge (e.g., which clinical codes are indicative of substance use treatment), security and privacy policies (e.g., "any record related to substance use treatment should be labelled as _restricted_"), or other organizational business and workflow rules (e.g., "this information was received from a substance use treatment facility"). A Natural Language Processing (NLP) Service is sometimes necessary to determine the clinical codes implied by unstructured text, and therefore assigning security labels.

<img src="sls.png" alt="Security Labeling Service" width="60%"/>
<br clear="all" />

The SLS often provides an Application Programming Interface (API) for assigning labels to FHIR resources. A call to the SLS often includes:
-	a FHIR resource (or a bundle), 
-	other relevant contextual information (e.g., the transaction metadata), and 
-	requested types of labeling. 
In response, the SLS provides a labeled resource to the client.

By specifying the type of security labels in its request, the client can control the level of processing involved in the labeling. For example, the client may specify that it is only interested in assigning sensitivity labels. Or, the client may request that the labeling take into account the unstructured text portions of the resource, which would in turn require invoking the NLP module.

###	Security Labeling Orchestrator
The SLS must often be integrated with the rest of the system workflows in order to ensure correct assignment of security labels at the appropriate time, for example, before resources are accessed locally or shared with external requestors. A Security Labeling Orchestrator is the software component that provided this integration logic. Labeling orchestrators are tightly coupled with the business workflows and provide the following functions: 
- Determining when and at what point in the workflow the SLS should be invoked.
- Determining the resources that must be submitted to be labeled. 
- Replacing the resources with their labeled version in the workflow.

Because of the tight coupling with business workflows, the details of the implementation for labeling orchestrators depend on the use case requirements and the system in which they are integrated. Some of the patterns for implementing the labeling orchestrator are discussed below. Note that most implementations may need a combination of these patterns in order to address all the requirements for their use cases. 

#### Batch Orchestrator
A batch orchestrator submits resources for labeling on an offline basis, either outside of an active transactions, or in the context of an asynchronous transaction such as a bulk data export. A batch orchestrator can tolerate longer processing times and asynchronous responses, therefore, it can accommodate more computationally-heavy components such as natural language processing. 

On the other hand, since the labeling may take place outside the context of a transaction, some transaction-specific information (e.g., the requester's attributes or purpose of use) may not be available at the time of labeling in which case labels that depend on such attributes would not be assignable by this type of orchestrator. 

<img src="sls-batch.png" alt="Batch Orchestrator" width="60%"/>

#### Transaction-Based Orchestrator
Transaction-Based Orchestrators submit resources to the SLS on-the-fly and in the course of a transaction. Since this orchestrator is aware of the transaction context (e.g., the identity of the recipient and the purpose of use), it can submit the transaction context metadata to the SLS to enable assigning transaction-dependent labels such as handling caveats.

<img src="sls-transaction.png" alt="Transaction-Based Labeling Service" width="60%"/>


