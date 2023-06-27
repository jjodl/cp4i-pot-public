# Overview - Setup enviorment
[Return to main lab page](../../index.md#lab-section)

## Featuring: 
- Setup instuctions for accessing the students needed resources for completing labs

[//]: # (This may be the most platform independent comment)
 
---

<a name="intro"></a>
## 1. Introductions
This guide will provide you with the instructions to access the needed environments to complete the IBM Integration labs.  
The PoT coordinator will send you an email with your student number and links to a VDI Linux desktop and the URL to be used for accessing the CP4I cluster and executing the lab instructions. 


Your attendee email also included a URL to connect to the Red Hat OpenShift cluster where you will execute the labs. The name of the cluster will vary depending on which one has been reserved. The example below shows the Chopper cluster.

You will also receive a userid to use throughout the PoT. Your email will include the name of the cluster and userid. The userids are defined in an LDAP for the cluster. For example if Chopper is the cluster, your email will specify chopper/chopperxx where xx is your student number. If the cluster is chopper, you will receive chopper/chopperxx.

The userid will also be the assigned name of a project (namespace) for you to work in. The project will be yours alone throughout the PoT. No one else will have access to your project and you will not have access to any other student’s project.

For example: User id: chopper14 pw: chopper2021pot

Important - “Cluster chopper and Project chopper14 were the cluster and the project name used to document this setup. Your assigned cluster and userid/project will be different. Where ever you see chopper or chopperxx in the instructions or screen shots make sure to substitute the ones assigned to you!”


<a name="VDI"></a>
## 2. Connect to your VDI
The Virtual Desktop (VDI) is used to provide you with a common experience for varies labs during the POT.

1.  Open a new browser window on your computer and enter the IP/URL provided by the PoT coordinator for your VDI.   This will open the VNC login screen.  **Click connect.** 
	
	![alt text][pic0]
		
2. Enter the password included in the details then click **Send Password**

	![alt text][pic1]

			
3. The Linux desktop appears. You are now logged in as *student*. You'll notice the toolbar on the left. This is used to control the VNC settings. You will use it mostly for copy/paste from outside the VNC desktop. You can hide the toolbar by clicking the arrow on the side of the toolbar.
	
	![alt text][pic2]

4. Now open the Firefox browser and we will connect to the CP4I cluster which is u.
For the purpose of these instruction we are using the chopper cluster but just make sure to use the URL that is provided for this step.

Ex: Platform Navigator: https://cp-console.apps.chopper.coc-ibm.com/oidc/login.jsp#/homepage 

Copy the URL for the Platform Navigator you received in the email.   We will then paste it into the clipboard of your VDI.  Once you do that you can copy it and paste into the browser you open in the VDI. 

![alt text][pic3]

5. Note: You may get a warning message that your connection is not private. If you get this message, you can add an exception.

To add an exception, click Advanced and then click Proceed to the URL.

![alt text][pic4]


6. All PoT users are set up with techcon LDAP, so choose Enterprise LDAP when logging into Navigator.

![alt text][pic5]

7. Now enter your username and password that was in the email sent by the Pot coordinator.
In this example we are using chopper9

![alt text][pic6]


8. Now open a new browser tab.   We will enter the URL for the lab OCP console that will be used for some labs.This URL is provided in the email you received.  Use the same method as above pasting it to the VDI clipboard and then copy it and paste to the new tab.  


9. Do this one last time to include the url for the POT labs.  Open a new browser tab and paste the url for the lab docs that were provided.  You should now have 3 tabs in your Firefox browsers for the OCP console, Platform Navigator, and labs.  

![alt text][pic7]
   
[Return to main lab page](../../index.md#lab-section)

[pic0]: images/image0.png
[pic1]: images/image1.png
[pic2]: images/image2.png
[pic3]: images/image3.png
[pic4]: images/image4.png
[pic5]: images/image5.png
[pic6]: images/image6.png
[pic7]: images/image7.png

