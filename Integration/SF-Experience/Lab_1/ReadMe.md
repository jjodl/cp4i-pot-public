# IBM App Connect Enterprise

## App Connect Designer Salesforce

[Return to main lab page](../index.md)

---

# Table of Contents 
- [1. Introduction](#introduction)
  * [Pre-Lab: Gathering your Salesforce Credentials](#pre_lab)
- [2. Create a Designer Flow in CP4I to Call Salesforce](#create_a_designer_flow_in_cp4i_to_call_salesforce)
  * [2a Testing the API flow](#testing_the_API_flow)
  * [2b Add an Additional Operation for our Salesforce API](#add_an_additional_operation_for_our_salesforce_API)
  * [2c Testing the New API Operation](#testing_the_new_API)
- [3. Deploying Your Designer Flow to App Connect Dashboard](deploying_your_designer_flow_to_app_connect_dashboard)
    
---

# 1. Introduction <a name="introduction"></a>

The purpose of this LAB is to show how to retrieve Salesforce Account Records using IBM App Connect Designer on IBM Cloud Pak for Integration. When prompted to log in to CP4I  use the username and password provided to you for this lab.  

If you need to review logging in to the Platform Navigator review the steps in the [Return to main lab page](../../../index.md#lab-sections) 

**Gathering your own SalesForce Credentials**
- For this lab, you will be provided with shared credentials.  If you would like to use your own account you can follow these steps to collect your SalesForce account details: Username, Password, Client Secret, and Client ID. You can learn how to obtain these values [here](../SF-Pre-Lab/SF-Pre-Lab.md)

# 2. Create a Designer Flow in CP4I to Call Salesforce  <a name="create_a_designer_flow_in_cp4i_to_call_salesforce"></a>

In this section we use App Connect Designer to create a flow that will be exposed as an API to connect and call Salesforce records.

2\. You will now be on your home page and in the upper left it will show your login name.   Under Integrations click on the App Connect Designer link to take you to the designer dashboard.

![alt text][pic2]

3\. In the upper left always make sure you are in the correct namespace.  Select the tab on the left to open the Catalog screen.  The App Connect catalog provides a list of applications and APIs that are available.

![alt text][pic3]

4\. Now scroll down to the Salesforce connector and click on the Connect button.  We are setting up our Salesforce connector here first but this also can be done with in the flow as you are building it. 
* **Note:** If you already have the Salasforce smart connect account setup skip to step 8.

![alt text][pic4]

5\. Fill in the Salesforce connection info that you were provided from the instructor.    
**Note:**
You should have received the credentials and it will look similar to this.

![alt text][pic5a]

Use this info to fill in the following fields for the Smart connector.
* For the password field, enter your account password for your Salesforce account and suffix it with your Salesforce security token.  If your password is ABC and your token is 123, you would enter ABC123 into the password field
* The Client ID field in the Designer is the Consumer Key field in your Salesforce Connected App
* The Client secret field in the Designer is the Consumer Secret field in your Salesforce Connected App

![alt text][pic5]

7\. You will see the events and actions available with this connector. Also you can change the Account Name to something more meaningful to you by clicking on the 3 dots next to the Account name. 

![alt text][pic6]

8\. Click on the App Connect Designer dashboard icon:

![alt text][pic7]

9\. Select from the New drop down to create a new API flow:  

![alt text][pic8]

10\. First thing we will do is create the model for this.  We will call the model **SalesforceRetrieve**

![alt text][pic9]

11\. For this example, we will map the following properties which are all data type String. You can also set the data type to Number for properties containing numerical integer values. 

1. AccountID
2. AccountName
3. Website

![alt text][pic10]


12\. Now that we have defined the properties in our API model definition, we can implement a flow by clicking on the Operations tab. The Operations tab is located next to the Properties tab.
From the Operations drop-down menu, select Add a Custom Operation. Here we will customize the operation that we want our API to perform. 

13\. Customize the details of your API operation. 
* **Note**: You can optionally set a description for your individual API operation. 
    * Display Name: **Retrieve Accounts**
    * HTTP Verb: **GET** 
    * Operation Name: **accounts**
        * Note: The operation name will be a part of your API Endpoint URL and is therefore consumer-facing.
    * Response body: **SalesforceRetrieve**

14\. After customizing your API operation, the details should match the image below.

![alt text][pic11]

Now click the "Get /SalesforceRetrieve/accounts" tab can click the Implement Flow button next to our API operation definition. This will take us to the App Connect Designer flow. This is where we can insert Smart Connectors to communicate with a variety of external applications as well as implement conditional logic and callable flows. 

15\. After clicking the blue plus icon on our flow designer interface, we will be able to see the variety of Smart Connectors offered by IBM App Connect Designer. You will also see an option for callable flows which allows you to integrate more complex logic into your Designer flows by building them in App Connect Enterprise Toolkit and calling them via REST API protocols. 

![alt text][pic12]

16\.For our lab, we will be using the Salesforce smart connector, so let us scroll down to the Salesforce connector and select it.

17\. There is a vast catalog of different Salesforce objects you can interact with from App Connect Designer. In this lab we are retrieving Account information so go ahead and drop down the Accounts option and click Retrieve accounts.

![alt text][pic13]

18\. The next interface that populates under our Designer flow allows us to add conditionals to our integration flow. For example, if we want to retrieve all account records for a particular account, we can specify this condition by setting the AccountName key to the respective account.   

In our example, we will retrieve the first 4 Salesforce account records. In order to do this, we can set the Maximum number of items to retrieve field to 4.  And then select, Process 4 items from the collection in the radio button options. As you can see there is also some error handling options provided by App Connect Designer below.

A helpful feature offered by the Smart Connectors is the **“Try this action”** button on the right side of the canvas. Clicking this button will allow you to test your Salesforce connection. If your credentials and operations are configured correctly you should be able to pull records from Salesforce. 

![alt text][pic14]

19\. You can now click on the View details to see the results.   This is done even before your API is complete and allows you to see info that is returned from Salesforce to be mapped. 

![alt text][pic15]

20\. This shows the Test Results details.

![alt text][pic16]

21\. Now we can configurate our API Response body to populate a successful response message with the data fields we are interested in returning to our consumer. Go ahead and click the Response button on the integration flow (outlined in the blue box below).

![alt text][pic17]

22\. Now we will map our API Response keys to the respective values we want our consumer to obtain from Salesforce. Let us start with the **AccountID** field. 

* Click on the hamburger icon next to AccountID field. ![alt text][pic18]
* Now you will see the list of **Available mappings.**

Click on the **Salesforce / Retrieve accounts / Accounts** mapping and select **Account ID.** Repeat the process for the other two data fields. After populating all the fields your mapping should match the image attached below.

![alt text][pic19]

23\. After populating all the fields your mapping should match the image attached below.

![alt text][pic20]

24\. We are now ready to start and Test the API but first need to give it a meaningful name.  This will automatically be saved.  Click the Done button to close the flow

![alt text][pic21]


[pic0]: images/0.png
[pic1]: images/1.png
[pic2]: images/2.png
[pic3]: images/3.png
[pic4]: images/4.png
[pic5]: images/5.png
[pic5a]: images/5a.png
[pic6]: images/6.png
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


# 2A Testing the API flow <a name="testing_the_API_flow"></a>

 We will now start the API and this will make the Test button visible on the menu bar.  

1\. Click in the upper right cornor on the Stopped switch and it will turn green and show started.   

![alt text][pic22]

2\. We will not go into details on all the items on the menu bar.  For now we will focus on the Test button.   Click on the Test button.

![alt text][pic23]


3\. Now click on the Get operation on the left side under Overview.  This will take you to the Details page for this operation.   Scroll down and review the info.   When ready to Test the API click on the **Try it**

![alt text][pic24]


4\. Now you will see the GET Url for our API and the Security key.  Since we are not passing anything into the API we can just go ahead and Click on **Send**

![alt text][pic25]

5\. The API will run and you will see the Request details sent in as well as the Reponse from the API.   

![alt text][pic25a]

[pic22]: images/22.png
[pic23]: images/23.png
[pic24]: images/24.png
[pic25]: images/25.png
[pic25a]: images/25a.png



# 2B Add an Additional Operation for our Salesforce API <a name="add_an_additional_operation_for_our_salesforce_API"></a>
In this section we will add an additional operation to get Account by ID.
First we will stop the API. Click on the green Started switch in the upper right corner.  This will take you to the designer page.   Click on the Operations item.

![alt text][pic26a]

1\. Now select to add another operation and select the Retrieve SalesforceRetrieve by ID. 

![alt text][pic26]

2\. Select “Implement flow” for the new operation and that will get us to the flow editor where we will select the “+” sign and scroll down to SaleForce connector and select Retrieve accounts.

![alt text][pic28]

3\. We will now add a condition to retrieve the Account for the Account ID that is passed to the API.  
Click on the Add condition and you will see the Where clause for the equals condition click in the blank box and you will see the mapping option there where you can select the Account ID that is passed to the API.   
When done should look like the following:

![alt text][pic29]

4\. Now we will map our API Response keys to the respective values we want our consumer to obtain from Salesforce. Let us start with the **AccountID** field
* Click on the hamburger icon next to AccountID field. ![alt text][pic30]
* Now you will see the list of **Available mappings.**

Click on the **Salesforce / Retrieve accounts / Accounts** mapping and select Account ID. Repeat the process for the other two data fields. After populating all the fields your mapping should match the image attached below.

![alt text][pic31]

5\. We are now ready to start the API and test the new operation. 

[pic26a]: images/26a.png
[pic26]: images/26.png
[pic27]: images/27.png
[pic28]: images/28.png
[pic29]: images/29.png
[pic30]: images/30.png
[pic31]: images/31.png

# 2c Testing the New API Operation <a name="testing_the_new_API"></a>
We will now start the API and this will make the Test button visible on the menu bar.  

1\. Click in the upper right cornor on the Stopped switch and it will turn green and show started.   

![alt text][pic22]

2\. As you can see we have two operations now one that will get us the first four accounts and the other will get account by id.   
So let’s first run the accounts GET first to get a list of Account IDs.

![alt text][pic33]

Click the Send button and we will see the Response with list of AccountID

![alt text][pic34]

Pick one of the AccountID from the Response to use in the other Operation.

3\. Now select the GET operation on the left menu and review the information on this new operation we just created.  

![alt text][pic35]


4\. You will see the response for the AccountID that we entered to the API.

![alt text][pic36]

[pic32]: images/32.png
[pic33]: images/33.png
[pic34]: images/34.png
[pic35]: images/35.png
[pic36]: images/36.png


# 3. Deploying Your Designer Flow to App Connect Dashboard <a name="deploying_your_designer_flow_to_app_connect_dashboard"></a>

Now we can export our Designer flow as a bar file to be deployed in the App Connect Dashboard on Cloud Pak for Integration. Navigate to your App Connect Designer Dashboard so we can export our flow as a BAR file. 

1\. Click on Dashboard to get back to the main designer page where you will see your API running.

![alt text][pic37]

2\. You will see that your API is running and you then will click on the triple-dot icon on your Designer flow.  Select Export.

![alt text][pic38]

3\. We will export this API as a runtime flow asset.

![alt text][pic39]

4\. You will save the SalesforceDemo.bar file locally on your machine and will use that to deploy to the AppConnect runtime.


5\. Now we will go back to the Integration home page. Click on the IBM Cloud Pak for Integration on the top menu

![alt text][pic40]

6\. From the Platform Navigator, select your App Connect Dashboard instance.

![alt text][pic41]

7\. Now select the Create a server option from your App Connect Dashboard capability

![alt text][pic42]

8\. We will now select the Designer Integration that we will deploy then click next.

![alt text][pic43]

9\. Now we will either drag and drop the BAR file we just exported or we can click to upload it.  Then click next.

![alt text][pic44]

10\. The next section is for configuration you can look at all the options that are available.   We will just be using the Designer Accounts which will include your Salesforce credentials.

![alt text][pic45]

11\. The final section is the server details.   We will give it a name **is-salesforce-accounts** and change the Designer flows mode to local and Designer flows type to event-driven-or-api-flows. Go ahead and click Create.

![alt text][pic46]

12\. This will take you back to the Servers Dashboard where you will see your new server. To start with, it will be showing Unavailable while it is starting up the pods for it.  Refresh the screen till it shows running.

![alt text][pic47]

13\. Once it is up and running it will show the following:

![alt text][pic48]

14\. We can also quickly test the API call running in the Integration server.   First click on the tile and it will show the API.   Click once more and you will be at the SalesforceDemo API test page.  Select the Get accounts and you will see the API details.  Click on Try it and then click the Send button. 

![alt text][pic49]

15\.You will see the following results.  After reviewing this click on the Overview on the left menu. 

![alt text][pic50]

16\. On the over view page near the bottom you can click on the **Download OpenAPI Document** . We will ue the OpenAPI Swagger document to import your API into IBM API Connect.
![alt text][pic51]

[Return to main lab page](../index.md)

[pic37]: images/37.png
[pic38]: images/38.png
[pic39]: images/39.png
[pic40]: images/40.png
[pic41]: images/41.png
[pic42]: images/42.png
[pic43]: images/43.png
[pic44]: images/44.png
[pic45]: images/45.png
[pic46]: images/46.png
[pic47]: images/47.png
[pic48]: images/48.png
[pic49]: images/49.png
[pic50]: images/50.png
[pic51]: images/51.png
