# IBM App Connect Enterprise

## App Connect Kafka Designer Event flow

[Return to main lab page](../index.md)

---

# Table of Contents 
- [1. Introduction](#introduction)
  * [Pre-Lab: Gathering your Salesforce Credentials](#pre_lab)
- [2. Setup connection to Smart connectors for this lab](#Setup_connections)
- [3. Create a Event Stream topic and connect to the Kafka cluster. ](#create_a_topic)
- [4. Create Event Driven flow to listen for events and flow to consume topics.](#create_designer_flow)
- [5. Testing the Event flows](#test_designer_flow)
- [6. Deploying Your Designer Flow to App Connect Dashboard  ](#deploy_a_designer_flow)
    
---

# 1. Introduction <a name="introduction"></a>

React to events in real time to deliver responsive and personalized experiences for applications and customer experience.  Built on open source Apache Kafka, IBM Event Streams is an event-streaming platform that helps you build smart applications that can react to events as they happen.

* The purpose of this LAB is to show how to get Saleforce Leads and then publish the Leads on to the Kafka broker to be consumed by other appliactions that are listening to a topic.  We will create a Salesforce API that will get Leads and then publish them to our topic.  We will also then create an event driven flow that will be listening to the topic and will put the message on to a MQ queue.   

When prompted to log in to CP4I, use the username and password provided to you for this lab.   

## Pre-Lab: Gathering your Salesforce Credentials <a name="pre_lab"></a>

For this lab, you will need to collect your Salesforce account details: Username, Password, Client Secret, and Client ID. You can learn how to obtain these values from this link:

https://developer.ibm.com/integration/docs/app-connect/how-to-guides-for-apps/use-ibm-app-connect-salesforce/ or you can follow the guide [here](../SF-Pre-Lab/SF-Pre-Lab.md).


# 2. Setup connection to Smart connectors for this lab.<a name="Setup_connections"></a>

In this section, we use App Connect Designer to create a flow that is triggered when an event occurs on Salesforce records.

1\. Use the URL that was provided to you for the cluster you will be using.   Select the **Enterprise LDAP**.

![alt text][pic0]

2\. When prompted use the username and password provided to you for this lab. In this example, we are using wedge15.

![alt text][pic1]

3\. You will now be on your home page and in the upper left it will show your login name.   Under **Integrations** click on the **App Connect Designer** link to take you to the designer dashboard.

![alt text][pic2]

4\. In the upper left, always make sure you are in the correct namespace.  Select the tab on the left to open the **Catalog** screen.

![alt text][pic3]

5\. Now scroll down to the Salesforce connector and click on the **Connect** button.
* Or you can enter salesforce in the search field which will take you to the connector.  
* We are setting up our Salesforce connector here first but this also can be done with in the flow as you are building it. 
* **Note:** if you already have a Account connected for Salesforce skip to step 8

![alt text][pic4]

6\. Fill in the Salesforce connection info that you have from the pre-lab section at the beginning of this lab. 

![alt text][pic5]

7\. You will see the events and actions available with this connector. Also you can change the Account Name to something more meaningful to you by clicking on the 3 dots next to the Account name. 

![alt text][pic6]

* **NOTE:** If you have already setup your connection to your MQ Qmgr go to step 13 to create your new Queue.

8\. For the this lab, we will use MQ as one of our target applications.  We will need to log in to the OCP console with your user id to set up the connection and security for the MQ QMgr.  
* **Note:** In this example we are using the wedge cluster and wedge15 id.  Make sure you use the url and sign on info provided to you.
* This is the OCP URL for the wedge cluster --> https://console-openshift-console.apps.wedge.coc-ibm.com/ 

![alt text][pic6a]

9\. Now we will select **Pods** under **Workloads**.   Make sure you select the correct Project in the top menu. In this example, we are logged in as wedge15 so we select the wedge15 Project.  Scroll down to find your qmgr pod running and click on it. 

 ![alt text][pic6b]

10\. In the Pod Details screen, you will see the Pod name.  Make sure to save the highlighted part since that is the service name and will be used to create the hostname.   Next click on the **Terminal** tab.

![alt text][pic6c]

11\. We now have a terminal window open into the pod that is running our QMgr.  Enter the command **runmqsc** .  This will sign you into the default QMgr. 

![alt text][pic6d]

12\. Now we will run the following commands to disable security on the QMgr.

* ALTER QMGR CHLAUTH (DISABLED)
* ALTER AUTHINFO(SYSTEM.DEFAULT.AUTHINFO.IDPWOS)  AUTHTYPE(IDPWOS) CHCKCLNT(NONE)
* REFRESH SECURITY TYPE(CONNAUTH)

![alt text][pic6e]

13\. Now go back to the tab where you signed into CP4I and click on the top **IBM Automation** to get to the home page.   Then right click your qmgr and open in a new tab.  

![alt text][pic6f]

14\. Now click on the tile to open that Qmgr dashboard.

![alt text][pic6g]

15\. Save the name of your QMgr and then we will create a new Queue to use in our flow

![alt text][pic6h]

16\. We will be creating a new Local queue.  

![alt text][pic6i]

17\. Enter the name for the Queue.  In the example we used **SF.MYTOPIC.EVENT** then click **Create**.  

![alt text][pic6j]

16\. Now go back to the tab with the **App Connect Designer** and select the **Catalog** on the left menu. Scroll down to **IBM MQ** and click on **Connect**.
* The form will be display, fill in the connection info and then click **Connect**.

* Enter the QMgr name
* For the QMgr host we will use the \<service\>.\<namespace\>.svc  
*                                     example for wedge15 user: qmgr15-ibm-mq.wedge15.svc
* Port is 1414
* Channel SYSTEM.DEF.SVRCONN

![alt text][pic6k]

[pic0]: images/0.png
[pic1]: images/1.png
[pic2]: images/2.png
[pic3]: images/3.png
[pic4]: images/4.png
[pic5]: images/5.png
[pic6]: images/6.png
[pic6a]: images/6a.png
[pic6b]: images/6b.png
[pic6c]: images/6c.png
[pic6d]: images/6d.png
[pic6e]: images/6e.png
[pic6f]: images/6f.png
[pic6g]: images/6g.png
[pic6h]: images/6h.png
[pic6i]: images/6i.png
[pic6j]: images/6j.png
[pic6k]: images/6k.png

# 3. Create a Event Stream topic and connect to the Kafka cluster. <a name="create_a_topic"></a>
We will now create a Kafka topic and create the connection to the Kafka broker for using the smart connectors. 

1\. Click on the **IBM Automation** in the upper left corner and to go back to the home page.

![alt text][pic30]

2\. Click on the **es-demo** to go to the Event Streams main page.  If requested, use your userid and password to login.

![alt text][pic31]

3\. First thing we will do is to create a topic and connect to the Kafka cluster. Click on the **Create a topic** tile. 

![alt text][pic32]

4\. Now enter the name of your topic.  Since this is a shared Kafka broker, use your userid as part of the topic name.  In this example, we are logged in as wedge14 so the topic name is **wedge14.mytopic**.  Click **Next**.

![alt text][pic33]

5\. Leave the partitions at 1 and click **Next**.

![alt text][pic34]


6\. Since this is for a lab, change the Message retention to **A day** and click **Next**.

![alt text][pic35]

7\. For the Replicas, we will change the **Minimum in-sync replicas** to **1** and select **Replication factor:1**.  Note:  Make sure that the radial button next to Replication factor:1 is selected before clicking **Create topic**.

![alt text][pic36]

8\. Now you will be back on the Topics screen.  You may see other users topics in the list but make sure you see your topic.  In this example, we just created the **wedge14.mytopic** topic.  In the upper right, click on **Connect to this cluster**. 

![alt text][pic37]

9\. Now for the Cluster connection, make sure you select **External** and then click the **Generate SCRAM credentials**.

![alt text][pic38]

10\. For the **credentials name** use your userid.  In this example, it is wedge14.  Make sure the **Produce messages, consume messages and create topics and schemas** button is selected and then click **Next**.

![alt text][pic39]

11\. Select the **Topics with prefix** and use your userid as the prefix.  In this example, we created a topic wedge14.mytopic so we will only access topics with the prefix of wedge14.  Click **Next**.

![alt text][pic40]

12\. Do the Same on this page for the consumer groups.  Click **Next**.

![alt text][pic41]

13\. Select the **Transactional IDs with prefix** and use your userid as the prefix.  Click **Generate credentials**.

![alt text][pic42]

14\. Now that we have the credentials generated use the icon to copy them and save them. 
* a\. Save the bootstrap URL of the cluster
* b\. Save the SCRAM username 
* c\. Save the SCRAM password 

* Last is to download the PEM certificate. 

![alt text][pic43]

15\. Save the es-cert.pem, this will be used to connect the Smart connector to the Event Stream Cluster. 

![alt text][pic44]

16\. Now we will go to App Connect Designer to setup conection to Event Steams.  In the upper left, click on **IBM Automation** to take you back to the home page. 

![alt text][pic30]

17\. Select the **ace-desXX** link, where XX reflects the numbers is your userid.  

![alt text][pic2]

18\. On the left menu, click on the **Catalog** link in App Connect Designer.

![alt text][pic3]

19\. Now we can scroll down or start typing kafka in the search box. If you already have an Account connected, you can skip to **Step 22**. 

![alt text][pic45a]

If not, click on **Connect**.

![alt text][pic45]

20\. For the Authorization method, make sure to select **\(SASL_SSL\)** from the dropdown.  Click **Continue**. 

![alt text][pic46]

21\. Now fiil in the fields.  We will use the SCRAM credentials we saved earlier.  
* a\. Kafka broker list: bootstrap URL of the cluster
* b\. username: SCRAM username 
* c\. password: SCRAM password 

* For the Security mechaniam: make sure to select the **512**
* Open the es-cert.pem file we downloaded.  Copy the whole thing and paste in the CA certiticate.  Click **Connect**.

![alt text][pic47]

22\. We now have connections setup for Salesfoce, IBM MQ, and Event Streams.  On the left menu, click the App Connect Dashboard and we will move to the section to start buidling the flows.

![alt text][pic48]

[pic30]: images/30.png
[pic31]: images/31.png
[pic32]: images/32.png
[pic33]: images/33.png
[pic34]: images/34.png
[pic35]: images/35.png
[pic36]: images/36.png
[pic37]: images/37.png
[pic38]: images/38.png
[pic39]: images/39.png
[pic40]: images/40.png
[pic41]: images/41.png
[pic42]: images/42.png
[pic43]: images/43.png
[pic44]: images/44.png
[pic45]: images/45.png
[pic45a]: images/45a.png
[pic46]: images/46.png
[pic47]: images/47.png
[pic48]: images/48.png


[pic7]: images/7.png
[pic8]: images/8.png
[pic9]: images/9.png
[pic10]: images/10.png
[pic11]: images/11.png
[pic12]: images/12.png
[pic13]: images/13.png
[pic14]: images/14.png
[pic15]: images/15.png
[pic16]: images/16.png
[pic17]: images/17.png
[pic18]: images/18.png
[pic19]: images/19.png
[pic20]: images/20.png
[pic21]: images/21.png

# 4. Create Event Driven flow to listen for events and flow to consume topics. <a name="create_designer_flow"></a>

In this section, we will create an event driven flow to react to new leads from Salesforce.  When they are entered in Salesforce that will trigger the flow and we will then produce the Kafka event.  We will create a Kafka event flow to consume the Kafka message and put to a MQ Queue.
* We are just building the one flow to put the events to a queue but you could also build additional flows for other business units to react to the same message and send email, Slack, etc. 

1\. You should be on the App Connect Designer dashboard.  

![alt text][pic50]

2\. Select from the **New** drop down to create a new **Event-driven flow**.  

![alt text][pic8]

4\. First thing we will do is give the flow a meaningful name.   In this example, we can use **New SF Leads Events**.  Then we will select the connector to listen for events.  We will go to the Salesforce connector and select the **New lead** under the **Leads** drop down. 

![alt text][pic51]

5\. Now click on the blue **+** and scroll down to the **Kafka** connector or just start typing in the search field.  Select the **Send message**. 

![alt text][pic52]

6\. Now select the topic for your userid that you created in the last section.  For the payload, we will fill it in with the mapping from the Salesforce connector.  Add text in to identify each field and should look like the following. 
* When you are done click on the **Dashboard** in the upper left corner. 

![alt text][pic53]

7\. You will now see the flow you just created for handling the SF lead events. Next, we will click on **New** - **Event-driven flow** to create the consumer flow.

![alt text][pic54]

8\. First thing we will do is give the flow a meaningful name.   In this example we can use **Consume New Leads to MQ**.  Now click on the blue **+** and scroll down to the **Kafka** connector or just start typing in the search field.  Select the **New message**.   

![alt text][pic55]

9\. Now select the topic for your userid that you created in the last section.  For the Group ID, we will use your userid as the unique ID.  In this case, we are using wedge14.   

![alt text][pic56]

10\. Now click on the blue **+** and scroll down to the **IBM MQ** connector or just start typing in the search field.  Select the **Put message on a queue**. 

![alt text][pic57]

11\. Now we will complete the mapping for what is put on the queue. 

1. Queue name:      SF.MYTOPIC.EVENT
2. Message type:    TEXT 
3. Message payload: If you click in the box the suggested mapping is displayed.  Select the **Payload**.  

* When done click on the **Dashboard** in the upper left corner. 

![alt text][pic58]


12\. Now on the App Connect Designer Dashboard, we should see the two new flows we created.   We will need to start both of them by clicking on the **3-dots** on each tile and selecting **Start**.  

![alt text][pic59]

* When done, they should both show running.  Now continue to the next section to test the flows.   

![alt text][pic59a]

[pic50]: images/50.png
[pic51]: images/51.png
[pic52]: images/52.png
[pic53]: images/53.png
[pic54]: images/54.png
[pic55]: images/55.png
[pic56]: images/56.png
[pic57]: images/57.png
[pic58]: images/58.png
[pic59]: images/59.png
[pic59a]: images/59a.png


# 5 Testing the Event flows <a name="test_designer_flow"></a>

 We will now test the new Event flow.  We will log into our Salesfoce account and create a new Lead.   

1\. Open a new tab and go to https://www.salesforce.com/.  Login with your Salesforce login.  

![alt text][pic22]
![alt text][pic22a]

2\. In the left menu, click on the **9-dots** and the search window will open.  Type in **Lead** and you will see Leads.  Click on **Leads**.    

![alt text][pic60]


3\. You will now be on the Leads screen.  On the top menu, click on the **New** button.

![alt text][pic61]


4\. The New Lead form will now be displayed.  Fill-in the following fields:

1. First name   
2. Last name 
3. Company
4. Email
* and then click  **Save**

![alt text][pic62]

5\. Now we will go back and check that the event worked and we have the message on our MQ queue.  In the upper menu, select **IBM Automation** to get back to the home page.  
* Then under the **Messaging** select your QMgr.

![alt text][pic6f]

6\. Now click on the QMgr tile. 

![alt text][pic6g]

7\. You will now see your queues including the one we created for this lab **SF.MYTOPIC.EVENT** and it should show at least 1 new message.  Click on the **SF.MYTOPIC.EVENT**.  

![alt text][pic65]

8\. You will see the Timestamp of when the message was put on the queue as well as the Appliaction Data we put on the queue. 
* Click on the message and the Message details will be displayed. 

![alt text][pic66]

9\. The Message details will show info from the MQ header as well as the Application data. 

![alt text][pic67]

[pic22]: images/22.png
[pic22a]: images/22a.png
[pic23]: images/23.png
[pic24]: images/24.png
[pic25]: images/25.png
[pic25a]: images/25a.png
[pic26]: images/26.png
[pic27]: images/27.png
[pic60]: images/60.png
[pic61]: images/61.png
[pic62]: images/62.png
[pic65]: images/65.png
[pic66]: images/66.png
[pic67]: images/67.png


# 6. Deploying Your Designer Flow to App Connect Dashboard <a name="deploy_a_designer_flow"></a>

As in other labs, we can export our Designer flow as a bar file and deploy to App Connect Dashboard on Cloud Pak for Integration. We will not do that in this lab.   


[Return to main lab page](../index.md)
