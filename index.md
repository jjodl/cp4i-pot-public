[//]:![](images\image1a.png)

![](images\2022-06-10_21-53-04.jpg)

**What is a Proof of Technology?**

Proof of Technology sessions are complimentary classes to build
understanding of IBM technology and software with practical
presentations and hands-on lab exercises. 

We will cover all the various components that are part of Cloud Pak for Integration. We will also discuss how these components can be used in combination. The following are the varies areas depending on your interest.

*  **IBM App Connect**
*  **IBM API Connect**
*  **IBM DataPower Gateway**
*  **IBM Event Streams**
*  **IBM MQ Advanced**
*  **IBM Aspera High Speed Transfer Server**


**Cloud Pak for Integration is IBM’s hybrid integration platform (HIP) that helps to solve**
- Complexity of integration. Integrating where apps and data that now live in hybrid landscapes including on-prem, and multiple clouds
- Need for speed. Agility in development, architecture, and operations aspects of integration
- Developer sharing and re-use of integration assets
- Unification of integration broad ranging integration technologies – e.g. iPaaS, API management, messaging, events


**Cloud Pak for Integration -- Unique Value and Capabilities**
1.  **Platform navigator and Common UI -** 
    The platform navigator and SSO allow you to work across multiple integration capabilities through the same user interface and security model, enabling a more consistent and intuitive experience, reduced learning curve, and greater productivity.
2.  **Cross Integration Tracing -**
    Tracing Cross integration tracing with Open Tracing enabling faster problem determination and analytics
3.  **Asset Repository -**
    Architects and Developers can find and re-use integration objects and collaborate to speed development.
4.  **Common logging, metering, and monitoring -**
    As your business scales, the number of integrations that you create and manage scale with it. Ensuring that you can quickly and effectively troubleshoot any issues across a large number of integrations helps to minimize disruption and drive efficiency. 
5.  **License simplicity and flexibility -** Rather than working on multiple pricing metrics, you can work with one single VPC metric. With the single VPC metric you can allocate and reallocate your licenses to any component within the Pak. You no longer have to plan the specific usage of each integration component before projects begin, and the proportions can change over time. 
6.	**Operational consistency -** Using Kubernetes, enables a consistent installation, deployment and operational experience across all of the capabilities. This dramatically simplifies automation of installation, deployment pipelines, and management of the environment. 
7.  **Easily portable to other clouds -**
    The Cloud Pak for Integration can run on RedHat OpenShift. This allows you to install and operate the Pak identically across multiple cloud vendors.  



## Lab sections:
## Environment overview and Setup 
Before starting the labs make sure to review the 

* **[Login to Platform Navigator.](Login-pn/index.md)** Steps to login to the Platform Navigator.   

* **[Disable MQ security.](MQ-security/index.md)** Steps to disable MQ security for varies labs.   

* **[Setup Common registry for API Manager.](Login-apic/index.md)** Steps to setup co-authoring for APIC.

* **[VDI overview & instructions.](VDI-overview/index.md)** The following instructions are for accessing the needed resources for completing labs.   We will be using a shared cluster for most labs, but some will also use a common desktop (VDI) that contains the needed software. <br>
**NOTE: The PoT coordinator should have sent you an email with your student number and links to a VDI Linux desktop and the URL to be used to accessing the shared cluster.**
<br><br>

|  Topic                                | Description                                                                
|---------------------------------------|-----------------------------------------------------------------------------|
| **ACE Toolkit Labs**         | This section you will focus on basic as well as advance capabilities using ACE Toolkit to build integrations both API lead as well as Event Driven solutions. <br>**This lab is being worked on.** <br><br>**Environments:** For these labs you will need to use the VDI. 
|---------------------------------------|-----------------------------------------------------------------------------|   
| [Integration Labs](ACE-labs/index.md)         | This section you will explorer key capabilities using both the ACE Toolkit and ACE Designer to build integrations both API lead as well as Event Driven solutions.  When creating APIs you will also import them into APIC.<br><br><b>Environments:</b> For some of these labs you will need to use the VDI.  It is best to login to the Cluster from the VDI. 
|---------------------------------------|-----------------------------------------------------------------------------|     
| [APIC Labs](APIC-labs/ReadMe.md)          | This section you will explore the following key capabilities, Creating an API by importing an OpenAPI definition for an existing REST service, Configuring ClientID/Secret Security endpoints, and proxy to invoke endpoint.  Also testing a REST API in the online developer toolkit and publish an API for developers. <br><br>**Environments:** For these labs you will **NOT** need to use the VDI.  You can login to the Cluster directly from your browser. 
|---------------------------------------|-----------------------------------------------------------------------------|
| [MQ Labs](MQ-labs/index.md)         | Setup MQ within Cloud Pak for Integration.   Will cover varies topics around MQ Uniform Clusters,Native HA, and Tekton pipeline in OpenShift Cluster.<br><br> **Environments:** For these labs you will need to use the VDI.  It is best to login to the Cluster from the VDI.
|---------------------------------------|-----------------------------------------------------------------------------|
| [CP4I Addon](Add-on/index.md)         | This section will show additional Unique Value and Capabilities when using Cloud pak for Integration. Collaboration and Asset Sharing with Cloud Pak for Integration **Asset Catalog**, and also Transaction tracing with Cloud Pak for Integration **Operations Dashboard**<br><br> **Environments:** For these labs you will need to use the VDI.  It is best to login to the Cluster from the VDI.
|---------------------------------------|-----------------------------------------------------------------------------|     
| **Event Endpoint Labs**          | This section you will explore Event Endpoint Async APIs.<br>**This lab is being worked on.** <br><br> **Environments:** For these labs you will need to use the VDI.  It is best to login to the Cluster from the VDI.
|---------------------------------------|-----------------------------------------------------------------------------|     
| **Aspera Labs**          | This section you will explore Aspera file transfer. <br> **This lab is being worked on** <br><br> **Environments:** For these labs you will need to use the VDI.  It is best to login to the Cluster from the VDI.  

<!--- <[ACE Toolkit Labs](ACE-toolkit-labs/index.md) > -->
<!--- <[Event Endpoint Labs](Event_EndPoint/index.md) > -->
<!--- <[Aspera Labs](Aspera/index.md) > -->
