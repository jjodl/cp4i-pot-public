# Create a connection to the Kafka clusters

There are several labs that use Kafka and we will need to create a connection to access the Kafka cluster when using Smart connectors, Toolkit flows, and Event Endpoint apis. 
You will need to save the details from this section to be used in varies labs. 

**NOTE: You should do this from the VDI since you will need to run varies commands so best to have the cert files saved to the VDI**

[Return to EDA main page](../../index.md)
# 1. Create SCRAM credentials to connect to Event Streams<a name="Setup_connections"></a>

1\. Use the URL to the CP4I cluster that was provided to you from the instructor.   Select the **Enterprise LDAP**.

![alt text][pic0]

2\. When prompted use the username and password provided to you for this lab. In this example, we are using chopper1.

![alt text][pic1]

3\. You will now be on your home page and in the upper left it will show your login name.   Under **Event Streaming** click on the **es-demo** link to take you to the Event Streams Home page.

![alt text][pic2]

4\. Now we will select the **Connect to this Cluster** tile.

 ![alt text][pic3]

5\. Now we will see the Cluster connection screen. Make sure you select **External** and then click the **Generate SCRAM credentials**.

![alt text][pic4]

6\. For the **credentials name** use your userid.  In this example, it is **chopper1** but make sure you use the userid assigned to you.  Make sure the **Produce messages, consume messages and create topics and schemas** button is selected and then click **Next**.

![alt text][pic5]

7\. On the next screen select the **Topics with prefix** and use your userid as the prefix.  Click **Next**.

![alt text][pic6]

8\. Do the Same on this page for the consumer groups.  Click **Next**.

![alt text][pic7]

9\. Select the **Transactional IDs with prefix** and use your userid as the prefix.  Click **Generate credentials**.

![alt text][pic8]

10\. Now that we have the credentials generated use the icon to copy them and save them for use later in other labs. 
* a\. Save the bootstrap URL of the cluster
* b\. Save the SCRAM username 
* c\. Save the SCRAM password 

* Last is to download the PEM certificate. 

![alt text][pic9]

11\. Save the es-cert.pem, this will be used to connect to the Event Stream Cluster. 

![alt text][pic10]

12\. We will also save the PKCS12 password and down load the certificate, this will be used to connect to the Event Stream Cluster when using the toolkit flows. 

![alt text][pic11]

# Summary
We should now have the following saved for use in the Kafka labs. 
* a\. The bootstrap URL of the cluster
* b\. The SCRAM username 
* c\. The SCRAM password 
* d\. The PEM certificate (used in the Designer flows).
* e\. The PKCS12 password (used in the Toolkit flows).
* f\. The PKCS12 certificate (used in the Toolkit flows).

You should have a text file saved on the VDI with this info and the cert files will be in your Downloads directory.  

![alt text][pic12]

[Return to EDA main page](../../index.md)


[pic0]: images/0.png
[pic1]: images/1.png
[pic2]: images/2.png
[pic3]: images/3.png
[pic4]: images/4.png
[pic5]: images/5.png
[pic6]: images/6.png
[pic7]: images/7.png
[pic8]: images/8.png
[pic9]: images/9.png
[pic10]: images/10.png
[pic11]: images/11.png
[pic12]: images/12.png