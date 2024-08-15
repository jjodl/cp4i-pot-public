# IBM App Connect Enterprise

## App Connect Designer Salesforce

[Return to main lab page](../index.md)

---

# Table of Contents 
- [1. Introduction](#introduction)
  * [Pre-Lab: Gathering your Salesforce Credentials](#pre_lab)
- [2. Setup connection to Smart connectors for this lab](#Setup_connections)
- [3. Create a Designer Event Flow in CP4I for Salesforce ](#create_a_designer_flow)
- [4. Testing the Event flow ](#test_a_designer_flow)
- [5. Deploying Your Designer Flow to App Connect Dashboard  ](#deploy_a_designer_flow)
    
---

# 1. Introduction <a name="introduction"></a>

In an event-driven flow you identify an event that can occur in your source application and actions that can be performed in one or more target applications. The flow is triggered when the event occurs.
* The purpose of this LAB is to show how to create an event-driven flow to identify when new Salesforce Account Records are created. 

# 2. Setup connection to Smart connectors for this lab.<a name="Setup_connections"></a>

In this section we use App Connect Designer to create a flow that is triggered when an event occurs on Salesforce records.

First make sure you are logged into the CP4I Platform Navigator using the account the instructor provided to you. 

7\. For this lab we will be using MQ to receive the events from App Connect so we will go and create a new Queue in are QMgr. Right click your qmgr and open in a new tab.  

![alt text][pic6f]

8\. Now save the name of your QMgr and click on the tile to open that Qmgr dashboard.

![alt text][pic6g]

9\. Now we will create a new Queue to use in our new flow

![alt text][pic6h]

10\. We will be creating a new Local queue.  

![alt text][pic6i]

11\. Enter the name for the Queue.  In the example we used "SALESFORCE.ACCOUNT.EVENT" then click Create.  

![alt text][pic6j]

12\. Now go back to the tab with the App Connect Designer and select the catalog on the left menu. Scroll down to IBM MQ and fill in the connection info.  
* Enter your QMgr name
* For the QMgr host we will use the service name **qmgrX-ibm-mq** where the **X** equals the number from your cluster id ( ex: palpatine**2** )
* Port is 1414
* Channel SYSTEM.DEF.SVRCONN

![alt text][pic6k]

# 3. Create a Designer Event Flow in CP4I for Salesforce  <a name="create_a_designer_flow"></a>

1\. Click on the App Connect Designer dashboard icon:

![alt text][pic7]

2\. Select from the New drop down to create a new Event-driven flow:  

![alt text][pic8]

3\. First thing enter a name that identifies the purpose of your flow, for example:
Salesforce New Account Events. 

![alt text][pic9]

4\. Click on the first Blue + and scroll down to Salesforce connector.   Select New account under Accounts.  

![alt text][pic10]

5\. Now we show the Salesforce connector.  Click on the next Blue + and scroll down to IBM MQ.  Select the Put message action.

![alt text][pic11]


6\. Now enter the Queue Name you created for MQ.  We used SALESFORCE.ACCOUNT.EVENT
* For Message type select Text
* For the Message payload click on the insert mapping and you will have a list of Suggested mappings.  Scroll down and select the Account Name.

![alt text][pic12]

7\. Now we are ready to start the flow.  In the upper right corner click on the 3-dots and start the flow.  

![alt text][pic13]

8\. Now return to the tab where you have the MQ console opened.  Click on manged and you should see your new Queue.  It should be showing 0/5000 which means it has no messages and can handle 5000 messages. 
* This is where we will check when we test this flow. 

![alt text][pic14aa]


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


# 4 Testing the Event flow <a name="test_a_designer_flow"></a>

 We will now test the new Event flow.  We will log into our Salesfoce account and create a new Account.   

1\. Open a new tab and go to https://www.salesforce.com/  login with your Salesforce login.  

![alt text][pic22]
![alt text][pic22a]

**Note:** This is a shared login so others will be using this as well so try and use names that are unique to you or the Account you were assigned.   
You will use the Userid and Password provide for this lab.

![alt text][pic22b]


2\. In the left menu seach for Accounts and select that.   

![alt text][pic23]


3\. There are two methods for creating a new Account.  Select one to get the New Account screen

![alt text][pic24]


4\. Fill-in the new Account info.  You will need a Account Name and website and then click  **Save**

![alt text][pic25]

5\. Now we will go back to the MQ console to check for messages on our Queue from this event.   

![alt text][pic26]

5\. You will now see that it shows 1/5000 which means we have a new message.  Click on the Queue to see the message.  Remeber in the mapping of the flow we put the Account Name in the Message body so you should see that here. 

![alt text][pic27]

[pic22]: images/22.png
[pic22a]: images/22a.png
[pic22b]: images/22b.png
[pic23]: images/23.png
[pic24]: images/24.png
[pic25]: images/25.png
[pic25a]: images/25a.png
[pic26]: images/26.png
[pic27]: images/27.png


# 5. Deploying Your Designer Flow to App Connect Dashboard <a name="deploy_a_designer_flow"></a>

As in other labs we can export our Designer flow as a bar file and deploy to App Connect Dashboard on Cloud Pak for Integration. We will not do that in this lab.   


[Return to main lab page](../index.md)
