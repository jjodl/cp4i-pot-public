# Overview - Setup enviorment
[Return to main lab page](../index.md)

## Featuring: 
- Setup instuctions for accessing the students needed resources for completing labs

[//]: # (This may be the most platform independent comment)
 
---

<a name="intro"></a>
## 1. Introductions
This guide will provide you with the instructions to access the needed enviorments to complete the IBM Cloud Pak for Integration (CP4I) labs.  
The PoT coordinator will send you an email with your student number and links to a VDI Linux desktop and the URL to be used for accsssing the CP4I cluster and executing the lab instructions. 


<a name="VDI"></a>
## 2. Connect to your VDI
The Virtual Desktop (VDI) is used to provide you with a common experience in building Integrations with the ACE toolkit.

1.  Open a new browser window on your computer and enter the IP/URL provided by the PoT coordinator for your VDI.   This will open the VNC login screen.  **Click connect.** 
	
	![alt text][pic0]
		
2. Enter the password included in the details then click **Send Password**

	![alt text][pic1]

			
3. The Linux desktop appears. You are now logged in as *student*. You'll notice the toolbar on the left. This is used to control the VNC settings. You will use it mostly for copy/paste from outside the VNC desktop. You can hide the toolbar by clicking the arrow on the side of the toolbar.
	
	![alt text][pic2]

4. Now open the Firefox browser and we will connect to the CP4I cluster.
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

8. Now open a new browser tab.   We will enter the URL for the lab docs.  This URL is provided in the email you received.  Use the same method as above pasting it to the VDI clipboard and then copy it and paste to the new tab.  


## 3. End of PoT setup

You are now ready to start lab 1.   
[Return to main lab page](../index.md)

[pic0]: images/image0.png
[pic1]: images/image1.png
[pic2]: images/image2.png
[pic3]: images/image3.png
[pic4]: images/image4.png
[pic5]: images/image5.png
[pic6]: images/image6.png
