# Overview - MQ on CP4I PoT
[Return to main lab page](../index.md)

## Featuring: 
- Names for the lab
- Setup instuctions for students
- IBM coordinator instructions
 
---

# Table of Contents 
- [1. Names used in lab](#names)
- [2. Setup instructions](#setup)
	+ [2.1 PoT student instructions](#student)
- [3. IBM only - setup instructions](#ibm)
	+ [3.1 IBM PoT coordinator instructions](#coordinator)
	+ [3.1.1 Provision VDIs](#provision)
	+ [3.1.2 Send URLs to student attendees](#sendurls)

This guide and associated standard Virtual Desktop Instance (VDI) help you get started with IBM MQ on IBM Cloud Pak for Integration (CP4I). This is not a primer for MQ basics. The intent is to show how to create and operate MQ queue managers on IBM Cloud Pak for Integration running on a Red Hat OpenShift cluster.

You will learn how to create a simple queue manager, a multi-instance queue manager for high availability, native high availability queue managers, an MQ cluster using the latest MQ feature Uniform Clusters, and using a Tekton pipeline to make updates to a queue manager for continuous integration.

For the MQ on CP4I PoT, multiple users will create each of the above sharing one CP4I on a single Red Hat OpenShift cluster. 

<a name="names"></a>
## 1. Names used in lab

| student number | QM prefix | Lab 1 QM Name| Lab 2 QM Name| Lab 3 QM Names| Lab 4 QM Name| Lab 5 QM Name |
|:--------------:|:---------:|:------------:|:------------:|:-------------:|:------------:|:-------------:|
| 01             | mq01      | mq01qs       | mq01mi       | mq01a, b, c   | mq01pl       | mq01ha        |
| 02             | mq02      | mq02qs       | mq02mi       | mq02a, b, c   | mq02pl       | mq02ha        |
| 03             | mq03      | mq03qs       | mq03mi       | mq03a, b, c   | mq03pl       | mq03ha        |
| 04             | mq04      | mq04qs       | mq04mi       | mq04a, b, c   | mq04pl       | mq04ha        |
| 05             | mq05      | mq05qs       | mq05mi       | mq05a, b, c   | mq05pl       | mq05ha        |
| xx...          | mqxx...   | mqxxqs...    | mqxxmi...    | mqxxa, b, c...| mqxxpl...    | mqxxha...     |   

<a name="setup"></a>
## 2. Setup instructions

<a name="student"></a>
### 2.1 PoT Student instructions

The PoT coordinator will send you an email with your student number and links to a VDI Linux desktop to be used for accsssing the CP4I cluster and executing the lab instructions. 

Once you have received your email and have the required information navigate to the environment setup: 
[Environment Setup](../envsetup/Readme.md)

<a name="ibm"></a>
## 3. IBM only - setup instructions

<a name="coordinator"></a>
### 3.1 IBM PoT coordinator instructions

If you are an IBM employee setting up an environment for a PoT or creating your own ROKS environment for testing follow the instructions in 
[Environment Setup](../envsetup/Readme.md).

For running a PoT, it is recommended to reserve a Center of Competency (CoC) Red Hat Openshift Container Platform (OCP) cluster. The CoC has pre-provisioned clusters for development, demos, and PoTs. There is no setup to be done for running on the CoC clusters other than making a reservation. You can reserve a cluster online at: [CoC Clusters](https://cmc.coc-ibm.com/int)

Or contact the CoC through Slack channel # coc-support-for-cp4i.
 
<a name="provision"></a>
#### 3.1.1 Provision VDIs 

You can use your own desktop to connect to the OCP. But it would be better to provision a Virtual Desktop Instance (VDI) which has the artifacts for running the MQ on CP4I labs. If you are running a PoT, it will be up to you to provision the VDIs for the students and send them the VDI details in an email.

1. Navigate to [IBM Asset Repo](https://assetrepo.ibm.com/). If not signed-in, sign-in with your IBM ID. Click *Environments*.

	![alt text][pic0]

1. Enter **VDI** in the *Search* field and select *CP4I PoT VDI (Desktop)*.

	![alt text][pic1]

1. Click the desktop icon to move to the *Reserve* page.

	![alt text][pic2]
		
1. Click the *Reserve for later* radio button.

	 ![alt text][pic3]
	 	 
1. The *Create a reservation* page where you will fill out the reservation details. Enter a CRM Opportunity number if you have one. Click the drop-down for *Purpose* and select the appropriate one. Under *Start date and time* and *End date and time*, change the date and time to provide enough time to complete the labs (maximum is two weeks) and click the drop-down to select your time zone. Click the drop-down for Preferred Geography and select one close to your location. Scroll down and click *Submit*.
   
   ![alt text][pic4]
      
1. You are notified that your reservation is successful.

	![alt text][pic5]
	
1. Click *My Reservations* to see the VDIs you have provisioned. is grey until it is complete.

	![alt text][pic6]
		
1. You also will receive an email that your cluster is being provisioned.
	
1. It will take 10 - 15 minutes to provision the VDI. This is why the provisioning must be done prior to the start of the PoT. 

	When the provisioning is complete, you will receive an email that it is ready with the details to connect. The button in the tile will turn green with a *Ready* status. At this time you can click the *Details* button to get the Overview of the cluster. This will include a hyperlink to the VDI with the password for the *student* userid. You can click the URL or the *Open* button on the tile to launch VNC Connect.
	
	![alt text][pic7]
	
1. The VNC window appears. Click connect. 
	
	![alt text][pic8]
		
1. Enter the password included in the details then click *Send Password*.

	![alt text][pic9]

			
1. The Linux desktop appears. You are now logged in as *student*. You'll notice the toolbar on the left. This is used to control the VNC settings. You will use it mostly for copy/paste from outside the VNC desktop. You can hide the toolbar by clicking the arrow on the side of the toolbar.
	
	![alt text][pic10]

<a name="sendurls"></a>
#### 3.1.2 Send URLs to student attendees

1. Once the VDIs are provisioned, you must notify each attendee prior to the start of the PoT. Copy the details of the VDI reservation and include in an email to the attendee. Below is a sample details page.  

	![alt text][pic11]
	

## 4. End of PoT overview and setup

You are now ready to setup for the labs.   

[Continue to Environment Setup](../envsetup/Readme.md)

[Return MQ CP4I Menu](../index.md)

[pic0]: images/image11a.png
[pic1]: images/image12a.png
[pic2]: images/image12b.png
[pic3]: images/image12c.png
[pic4]: images/image12d.png
[pic5]: images/image13.png
[pic6]: images/image21.png
[pic7]: images/image16.png
[pic8]: images/image17.png
[pic9]: images/image18.png
[pic10]: images/image19.png
[pic11]: images/image20.png