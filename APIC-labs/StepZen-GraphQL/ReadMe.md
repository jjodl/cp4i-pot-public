# IBM API Connect

## Creating a StepZen GraphQL Proxy for a Salesforce Account REST API 

[Return to main APIC lab page](../ReadMe.md)

---

# Table of Contents 
- [1. Introduction](#introduction)

- [2. App Connect Dashboard](#dashboard)
	* [2a. Deploy a Toolkit API](#toolkit_api)
	* [2b. Test the API](#test_api)
	* [2c. Capture the REST API Endpoints] (#capture_endpoints)

- [3. StepZen](#stepzen)
	* [3a. StepZen CLI](#stepzen_cli)
	* [3b. Import the Salesforce Account API Operations into the StepZen Configuration](#stepzen_import)
	* [3c. Modify index.graphql Files](#modify)

- [4. Deploy to the StepZen Server](#deploy)

- [5. Working with the StepZen Dashboard](#stepzen_dashboard)
	* [5a. StepZen GraphQL Query Testing](#stepzen_testing)
	* [5b. Capturing the salesforce-account-api GraphQL Server URL](#capture)

- [6. Creating the GraphQL API in API Connect](#graphql_apic)
	* [6a. Testing the GraphQL API from the API Connect Manager](#testing_apim)

- [7. Summary](#summary)
    
---

# 1. Introduction <a name="introduction"></a>

In this lab, we will leverage an existing REST API to create StepZen GraphQL Proxy and then expose the GraphQL Proxy through IBM API Connect. For the lab, we will be leveraging a Salesforce Account REST API deployed onto IBM App Connect. A Salesforce Account Object has 100+ fields. By using GraphQL, one can Query for fields that they are interested in thus reducing the response payload and network traffic.

![](images/design-diagram.png)

-	Deploy an App Connect Toolkit built bar file into Cloud Pak for Integration
-	Capture REST API Endpoints for getAccounts, getAccount methods
-	Create StepZen Configurations for both methods
-	Deploy to StepZen GraphQL Server
-	Test the GraphQL Queries in StepZen Portal
-	Extract StepZen GraphQL URL from StepZen Portal
-	Expose GraphQL URL into IBM API Connect
-	Test GraphQL API from API Connect

# 2. App Connect Dashboard <a name="dashboard"></a>

In this section, you will deploy a pre-built App Connect Toolkit Rest API that retrieves Account records from Salesforce.

## 2a. Deploy a Toolkit API <a name"toolkit_api></a>

1\. If you are not already logged into the Platform Navigator, enter the URL for the Platform Navigator that was provided by your instructor.  To navigate to the main page of the Platform Navigator, click on **IBM Cloud Pak** in the upper left.

![](images/platform-navigator.png)

2\. Navigate to the App Connect instance.

![](images/cp4i-acedashboard.png)

3\. For this lab, we already have the REST service built and available as a **bar** file. You can download the **SF&#95;ACCOUNT&#95;API.bar** file for the service [here](./resources/SF_ACCOUNT_API.bar).

4\. Click on **Deploy integrations**.  

**Note:** The number of Integrations and Runtimes that you see in your environment may differ from the screenshot below.

![](images/ace-dashboard-deploy-1.png)

5\. Click **Small integration** and click **Next**.

![](images/ace-dashboard-deploy-2.png)

6\. Drag and drop the BAR file that you just downloaded or click to upload.  Once you have dragged and dropped or uploaded, you will see the bar file listed under **to be imported**.  Click **Next**.

![](images/ace-dashboard-deploy-3.png)

![](images/ace-dashboard-deploy-3a.png)

7\. Click **Create Configuration**.

![](images/ace-dashboard-deploy-config.png)

8\. Populate the following values:

- **Type:**: Select **setdbparms.txt** from the drop-down menu
- **Name:** Enter **\<username\>-setdbparms-salesforce-conf**. Replace **\<username\>** with the username that you logged in the Cloud Pak with.  In the screenshot below, the username is cody2
- **Description:** Enter **Salesforce credentials**
- **setdbparms.txt:** Enter **mqsisetdbparms -w /home/aceuser/ace-server -n salesforce::SF1 -u \<salesforce-userid\> -p \<password-and-token\> -c \<clientid\> -s \<secret\>**.  **Note**: Your instructor will provide you with the salesforce-userid, password-and-token, clientid, and secret.

Click **Next**.

![](images/ace-dashboard-deploy-config-2.png)

9\. Confirm that the newly created configuration is selected and click **Next**.

![](images/ace-dashboard-deploy-config-3.png)

9\. Give the Integration Server a **Name** (e.g., username-ace-salesforce-account-api) and click **Create**.  **Note:** In the screenshot below, the username is cody2.

![](images/ace-dashboard-deploy-4.png)

10\. This will take you back to the Runtimes Dashboard where you will see your new server. It will likely be showing Pending while it is starting up the pod.

![](images/ace-pending.png)

11\. Note: It may take a several minutes to start up. You can refresh the page. Once it is up and running it will show the following:

![](images/ace-ready.png)

## 2b. Test the API <a name="test_api"></a>

1\. From the App Connect Dashboard, click on the newly created Runtime.

![](images/ace-saleforce-account-api.png)

2\. Click on the **sf&#95;account&#95;api** API.

![](images/ace-salesforce-account-api.png)

3\. Click on the **GET /getAccounts** tab.

![](images/ace-getaccounts.png)

4\. Click **Try it**.

![](images/ace-getaccounts-tryit.png)

5\. Click **Send**.

![](images/ace-getaccounts-send.png)

6\. The Response Body should return several accounts.  **Note:**. The accounts that you see may differ from the accounts listed in the screenshot below.

![](images/ace-getaccounts-results.png)

7\. Copy and past into a text editor one of the **Id** values from the output (e.g., 0014100000D0bbQAAR).  **Note:** You will want to make sure that you capture an Id that has the BillingStreet, BillingCity, BillingState, BillingPostalCode, and BillingCountry populated with a value other than null.  You will use this Id to test getAccount operation.

![](images/ace-getaccounts-id.png)

8\. Click on the **GET /getAccount** tab.

![](images/ace-getaccount.png)

9\. Click **Try it**.

![](images/ace-getaccount-tryit.png)

10\. In the **id** field, enter the value that you previously captured and click **Send**.

![](images/ace-getaccount-send.png)

11\. The Response Body will return the account for the specified id.  **Note:**. The account detail that you see may differ from the account detail listed in the screenshot below.

![](images/ace-getaccount-results.png)

## 2c. Capture the REST API Endpoints <a name="capture_endpoints"></a>

In the next steps, you will capture the Salesforce Account REST API endpoints and save them to a text editor.

1\. From the **Try it** tab of the **GET /getAccount** tab, you should still have the response of the getAccount operation that you just tested.  Copy the URL in the **Request** and save it to a text editor.

![](images/ace-dashboard-2.png)

2\. Click on the **GET /getAccounts** tab.

![](images/ace-getaccounts-2.png)

3\. Click **Try it**.

![](images/ace-getaccounts-tryit.png)

4\. Copy the URL in the **Request** and save it to a text editor.

![](images/ace-dashboard-3.png)

# 3. StepZen <a name="stepzen"></a>

## 3a. StepZen CLI <a name="stepzen_cli"></a>

1\. If you have been using a browser outside of the VDI, navigate to the browser tab where the Cloud Pak for Integration VDI is running.

![](images/cp4i-vdi.png)

2\. From within the VDI, launch **Firefox**.

![](images/cp4i-vdi-firefox.png)

3\. Navigate to stepzen.com and click **Log In**.

![](images/stepzen-logon.png)

4\. Enter the **Username** and **Password** provided by your instructor and click **LOG IN**.

![](images/stepzen-login.png)

5\. Navigate to the **Account** tab.

![](images/stepzen-account.png)

6\. Copy and paste the **Account** and **Admin Key** into a text editor.

![](images/stepzen-adminkey.png)

7\. From within the VDI, launch **Terminal**.

![](images/vdi-terminal.png)

8\. In the terminal, log in with the Account that you copied in the step above.

```
stepzen login -a <account>
```
Make sure you replace **\<account\>** with the **Account** you copied in the previous step.

![](images/stepzen-terminal-login.png)

9\. When prompted, enter the **admin key** that you copied in the previous step.

![](images/stepzen-terminal-admin.png)

## 3b. Import the Salesforce Account API Operations into the StepZen Configuration <a name="stepzen_import"></a>

Next, you will be importing the getAccount and getAccounts operations into StepZen.

1\. Using the terminal, create a directory called **stepzen-salesforce-account-api**.

```
mkdir stepzen-salesforce-account-api
```

![](images/stepzen-terminal-mkdir.png)

2\. Change into the **stepzen-salesforce-account-api** directory.

```
cd stepzen-salesforce-account-api
```

![](images/stepzen-terminal-cd.png)

3\. Copy the below 5 lines as-is, and paste in the command line. This will create config.yaml.

```
echo "access:
  policies:
    - type: Query
      policyDefault:
        condition: true" > config.yaml
```
![](images/stepzen-terminal-config.png)

4\. Next you will import the Get Salesforce Account by ID operation.  In the terminal, enter:

```
stepzen import curl "<REPLACE-WITH-GETACCOUNT-URL>"
```
Replace **\<REPLACE-WITH-GETACCOUNT-URL\>** with the URL that you copied in Section 2c Step #1.

![](images/stepzen-import-getaccount.png)

5\. Enter **api/salesforce-account-api** when prompted for what you want your endpoint to be called.

![](images/stepzen-terminal-getaccount-endpoint.png)

![](images/stepzen-import-getaccount-result.png)

6\. Next you will import the Get Salesforce Accounts operation.  In the terminal, enter:

```
stepzen import curl "<REPLACE-WITH-GETACCOUNTS-URL>"
```
Replace **\<REPLACE-WITH-GETACCOUNTS-URL\>** with the URL that you copied in Section 2c Step #4.

![](images/stepzen-import-getaccounts.png)
ge
![](images/stepzen-import-getaccounts-result.png)

## 3c. Modify index.graphql Files <a name="modify"></a>

Next, you will modify the index.graphql files.

1\. From the **Terminal** in the VDI, enter:

```
vi curl/index.graphql
```
![](images/vi-1.png)

2\. You will likely be at the first line of the file.  Enter **SHIFT + G** to jump to the last line of the file.

![](images/vi-getaccount-last.png)

3\.  Replace **myQuery** with **getAccountById**.  If you are not familiar with vi, follow the steps below.  If you are familiar with vi, skip to Step #4 once you have replaced myQuery.

![](images/vi-getaccount.png)

If you are not familiar with vi, using your cursor, navigate to the **m** in **myQuery**.

![](images/vi-getaccount-m.png)

Press the **x** key to delete each letter of **myQuery**.

![](images/vi-getaccount-delete.png)

Press the **i** key.  You should see the word **INSERT** at the bottom of the screen.

![](images/vi-getaccount-insert.png)

With the cursor at the **(**, enter **getAccountById**.

![](images/vi-getaccountbyid.png)

4\. Make sure that you are out of **INSERT** mode, by pressing the **ESC** key.  Save and quit by entering **:wq**.

![](images/vi-getaccount-escape.png)

![](images/vi-getaccount-wq.png)

5\. From the **Terminal** in the VDI, enter:

```
vi curl-01/index.graphql
```

![](images/vi-2.png)

6\. You will likely be at the first line of the file.  Enter **SHIFT + G** to jump to the last line of the file.

![](images/vi-getaccounts-last.png)

7\.  Replace **myQuery** with **getAccounts**.  If you are not familiar with vi, follow the steps below.  If you are familiar with vi, skip to Step #8 once you have replaced myQuery.

![](images/vi-getaccounts-edit.png)

If you are not familiar with vi, using your cursor, navigate to the **m** in **myQuery**.

![](images/vi-getaccounts-m.png)

Press the **x** key to delete each letter of **myQuery**.

![](images/vi-getaccounts-delete.png)

Press the **i** key.  You should see the word **INSERT** at the bottom of the screen.

![](images/vi-getaccounts-insert.png)

With the cursor at the **:**, enter **getAccounts**.

![](images/vi-getaccounts.png)

8\. Make sure that you are out of **INSERT** mode, by pressing the **ESC** key.  

![](images/vi-getaccounts-escape.png)

9\. Next, we need to remove the **Attributes** and **BillingAddress** types as they are duplicate segments under curl and curl-01. If you are not familiar with vi, follow the steps below.  If you are familiar with vi, skip to Step #10 once you have removed the Attributes and BillingAddress types.

![](images/vi-getaccounts-rootentry.png)
 
If you are not familiar with vi, enter **gg** to jump to the first line of the file. 

![](images/vi-getaccounts-first.png)

To delete a line, position your cursor at the beginning of the line and enter **dd**.  Do this for each line of the **Attributes** type and the **BillingAddress** type.

**Attributes**:

```
type Attributes {
  type: String
  url: String
}
```

**BillingAddress**:

```
type BillingAddress {
  city: String
  country: String
  """
  Field "geocodeAccuracy" is defined as JSON since its value was always 'null'
  """
  geocodeAccuracy: JSON
  """
  Field "latitude" is defined as JSON since its value was always 'null'
  """
  latitude: JSON
  """
  Field "longitude" is defined as JSON since its value was always 'null'
  """
  longitude: JSON
  postalCode: String
  state: String
  street: String
}
```

The file should now begin with **RootEntry**.

![](images/vi-getaccounts-rootentry.png)

10\. Save and quit by entering **:wq**.

![](images/vi-getaccounts-wq.png)

# 4. Deploy to the StepZen Server <a name="deploy"></a>

In this section, you will deploy the salesforce-account-api to the StepZen server.

1\. In the terminal, make sure that you are in the **stepzen-salesforce-account-api** directory and enter **stepzen start**.

![](images/stepzen-start.png)

This will deploy the GraphQL Queries into the StepZen account.

![](images/stepzen-start-result.png)

# 5. Working with the StepZen Dashboard <a name="stepzen_dashboard"></a>

1\. Copy the URL (https://dashboard.stepzen.com/explorer?endpoint=api%2Fsalesforce-account-api) found under **Or explore it with GraphiQL at** and paste it into a new browser window.

![](images/stepzen-url.png)

## 5a. StepZen GraphQL Query Testing <a name="stepzen_testing"></a>

From the StepZen Dashboard, you will be testing both the queries.

1\. You will first run the getAccounts query will all of the fields.  You should see the getAccounts query already reflected in the Explorer.

![](images/stepzen-getaccounts-query-all.png)

If you do not, you can cut and paste the query below.

```
 query getAccounts {
  getAccounts {
    AccountNumber
        AccountSource
        Active__c
        AnnualRevenue
        BillingAddress{
            city
            country
            geocodeAccuracy
            latitude
            longitude
            postalCode
            state
            street
        }
        BillingCity
        BillingCountry
        BillingGeocodeAccuracy
        BillingLatitude
        BillingLongitude
        BillingPostalCode
        BillingState
        BillingStreet
        CleanStatus
        CreatedById
        CreatedDate
        CustomerPriority__c
        DandbCompanyId
        Description
        DunsNumber
        Fax
        Id
        Industry
        IsDeleted
        Jigsaw
        JigsawCompanyId
        LastActivityDate
        LastModifiedById
        LastModifiedDate
        LastReferencedDate
        LastViewedDate
        MasterRecordId
        NaicsCode
        NaicsDesc
        Name
        NumberOfEmployees
        NumberofLocations__c
        OwnerId
        Ownership
        ParentId
        Phone
        PhotoUrl
        Rating
        SLAExpirationDate__c
        SLASerialNumber__c
        SLA__c
        ShippingAddress {
          city
          country
          geocodeAccuracy
          latitude
          longitude
          postalCode
          state
          street
        }
        ShippingCity
        ShippingCountry
        ShippingGeocodeAccuracy
        ShippingLatitude
        ShippingLongitude
        ShippingPostalCode
        ShippingState
        ShippingStreet
        Sic
        SicDesc
        Site
        SystemModstamp
        TickerSymbol
        Tradestyle
        Type
        UpsellOpportunity__c
        Website
        YearStarted
        attributes{
            type
            url
        }
        nextPageToken
  }
}

```

2\. To execute the query, click on the **Execute query** button.

![](images/stepzen-getaccounts-execute.png)

Results (**Note:**  The data in your results may be different):
![](images/stepzen-graphql-test-0.png)

3\. Next, you will run getAccounts with a smaller set of fields.  In the Explorer, click on **Clear**.

![](images/stepzen-getaccounts-clear-1.png)

4\. Copy and paste the query below into the Explorer and click **Execute query**.

```
query getAccounts {
  getAccounts {
    Id
    AccountNumber
    Name
    AnnualRevenue
    BillingAddress {
      city
      country
      postalCode
      state
      street
    }
  }
}
```
![](images/stepzen-getaccounts-subset.png)

Results:
![](images/stepzen-graphql-test-1.png)

5\. Capture one of the **Id** values from the output (e.g., 0014100000D0bbQAAR).  You will use this Id to test getAccountById query.

![](images/stepzen-getaccounts-id.png)

6\. Next, you will run getAccountById with all of the fields.  In the Explorer, click on **Clear**.

![](images/stepzen-getaccounts-clear-2.png)

7\. Copy and paste the query below into the Explorer.  Make sure that you change the **id** to the **Id** that you copied in Step #5 and click **Execute query**.

```
{
    getAccountById(id: "0014T0000048SQHQA2"){
        AccountNumber
        AccountSource
        Active__c
        AnnualRevenue
        BillingAddress{
            city
            country
            geocodeAccuracy
            latitude
            longitude
            postalCode
            state
            street
        }
        BillingCity
        BillingCountry
        BillingGeocodeAccuracy
        BillingLatitude
        BillingLongitude
        BillingPostalCode
        BillingState
        BillingStreet
        CleanStatus
        CreatedById
        CreatedDate
        CustomerPriority__c
        DandbCompanyId
        Description
        DunsNumber
        Fax
        Id
        Industry
        IsDeleted
        Jigsaw
        JigsawCompanyId
        LastActivityDate
        LastModifiedById
        LastModifiedDate
        LastReferencedDate
        LastViewedDate
        MasterRecordId
        NaicsCode
        NaicsDesc
        Name
        NumberOfEmployees
        NumberofLocations__c
        OwnerId
        Ownership
        ParentId
        Phone
        PhotoUrl
        Rating
        SLAExpirationDate__c
        SLASerialNumber__c
        SLA__c
        ShippingAddress
        ShippingCity
        ShippingCountry
        ShippingGeocodeAccuracy
        ShippingLatitude
        ShippingLongitude
        ShippingPostalCode
        ShippingState
        ShippingStreet
        Sic
        SicDesc
        Site
        SystemModstamp
        TickerSymbol
        Tradestyle
        Type
        UpsellOpportunity__c
        Website
        YearStarted
        attributes{
            type
            url
        }
        nextPageToken
    }
}
```
![](images/stepzen-getaccount-execute.png)

Result:
![](images/stepzen-graphql-test-2.png)

8\. Next, you will run getAccounts with a smaller set of fields.  In the Explorer, click on **Clear**.

![](images/stepzen-getaccount-clear-1.png)

9\. Copy and paste the query below into the Explorer.  Make sure that you change the **id** to the **Id** that you copied in Step #5 and click **Execute query**.

```
{
  getAccountById(id: "0014T0000048SQHQA2") {
    Id
    AccountNumber
    Name
    AnnualRevenue
    BillingAddress {
      city
      country
      postalCode
      state
      street
    }
  }
}
```

![](images/stepzen-getaccount-subset.png).

Result:
![](images/stepzen-graphql-test-3.png)


10\.  Lastly, you will run multiple queries together. In the Explorer, click on **Clear**.

![](images/stepzen-getaccount-clear-2.png)

11\. Copy and paste the query below into the Explorer.  Make sure that you change the **id** to the **Id** that you copied in Step #5 and click **Execute query**.  

```
query MyQuery {
  getAccountById(id: "0014T0000048SQHQA2") {
    Id
    AccountNumber
    Name
    AnnualRevenue
    BillingAddress {
      city
      country
      postalCode
      state
      street
    }
  }
  getAccounts {
    Id
    AccountNumber
    Name
    AnnualRevenue
    BillingAddress {
      city
      country
      postalCode
      state
      street
    }
  }
}
```

![](images/stepzen-multitest-execute.png)

Result:
![](images/stepzen-graphql-test-4.png)

## 5b. Capturing the salesforce-account-api GraphQL Server URL <a name="capture"></a>

1\. Copy the StepZen GraphQL Server URL and save it to a text editor.

![](images/stepzen-graphql-account-api-url.png)

# 6. Creating the GraphQL API in API Connect <a name="graphql_apic"></a>


1\. If you are not already logged into the Platform Navigator, enter the URL for the Platform Navigator that was provided by your instructor.  To navigate to the main page of the Platform Navigator, click on **IBM Cloud Pak** in the upper left.

![](images/platform-navigator.png)

2\. Navigate to the API Connect instance.

![](images/cp4i-apic.png)

3\. If you are asked to log in, click **Common Services User Registry**.

![](images/apic-login.png)

4\. Once logged in, confirm that you are in the organization for your user and click **Develop APIs and products**.

![](images/apic-develop-api.png)

5\. With the **APIs** tab selected, click **Add** and then select **API (from REST, GraphQL or SOAP)**.

![](images/add-api.png)

6\. Select **From existing GraphQL service (GraphQL proxy)** and click **Next**.

![](images/apic-graphql-create.png)

7\. For the **Title**, enter **stepzen-graphql-salesforce-account-api** and for the **GraphQL Server URL** paste the URL that you copied in the previous section.

![](images/apic-graphql-create-2.png)

8\. Accept the defaults and click **Next**.

![](images/apic-graphql-create-3.png)

9\. Make sure that **Activate API** is not selected and click **Next**.

![](images/apic-graphql-create-4.png)

10\. Upon reviewing the Summary, click **Edit API**.

![](images/apic-graphql-create-5.png)

11\. Navigate to the **Gateway** tab.

![](images/apic-gateway.png)

12\. Select the **graphql-invoke** action (middle of the flow) which can be found under **GraphQL execute** (under **Otherwise**).

![](images/apic-graphql-create-invoke.png)

13\. Deselect the **Compression** flag.

![](images/apic-graphql-create-6.png)

14\. Click **Save**.

![](images/apic-save.png)

15\. Once saved, you will see an indicator window appear that shows that **Your API has been updated**. Click on the **X** to close the window.

![](images/apic-save-close.png)

## 6a. Testing the GraphQL API from the API Connect Manager <a name="testing_apim"></a>

In the API Designer, you have the ability to test the API.

1\. Switch the toggle from Offline to Online. This step automatically publishes the API.

![](images/apic-online-toggle.png)

2\. You will see an indicator window appear that shows that **Your API has been updated**. Click on the **X** to close the window. You should see that the API is now Online.

![](images/apic-online.png)

3\. Click on the Test tab.

![](images/apic-test.png)

4\. From the drop down menu, select the **POST** operation that ends with **stepzen-graphql-salesforce-account-api/graphql**.

![](images/apic-post.png)

5\. In **GraphiQL**, put you cursor in the request area and enter (**CTRL+A**) and hit the **delete** key.

![](images/apic-graphiql-selectall.png)

![](images/apic-graphiql-delete.png)

6\. Copy and paste the **getAccounts** query below into **GraphiQL** and click **Execute Query**.

```
query getAccounts {
  getAccounts {
    Id
    AccountNumber
    Name
    AnnualRevenue
    BillingAddress {
      city
      country
      postalCode
      state
      street
    }
  }
}
```

![](images/apic-getaccounts-execute.png)

Result:
![](images/apic-graphql-test-1.png)

7\. Capture one of the **Id** values from the output (e.g., 0014100000D0bbQAAR).  You will use this Id to test getAccountById query. 

8\. In **GraphiQL**, put you cursor in the request area and enter (**CTRL+A**) and hit the **delete** key.

9\. Copy and paste the **getAccounts** query below into **GraphiQL**.  Make sure that you change the **id** to the **Id** that you copied in Step #7 and click **Execute Query**.

```
{
  getAccountById(id: "0014T0000048SQHQA2") {
    Id
    AccountNumber
    Name
    AnnualRevenue
    BillingAddress {
      city
      country
      postalCode
      state
      street
    }
  }
}

```

![](images/apic-getaccount-execute.png)

Result:
![](images/apic-graphql-test-2.png)

10\. In **GraphiQL**, put you cursor in the request area and enter (**CTRL+A**) and hit the **delete** key.

11\. Copy and paste the query below into the Explorer.  Make sure that you change the **id** to the **Id** that you copied in Step #7 and click **Execute Query**. 

```
query MyQuery {
  getAccountById(id: "0014T0000048SQHQA2") {
    Id
    AccountNumber
    Name
    AnnualRevenue
    BillingAddress {
      city
      country
      postalCode
      state
      street
    }
  }
  getAccounts {
    Id
    AccountNumber
    Name
    AnnualRevenue
    BillingAddress {
      city
      country
      postalCode
      state
      street
    }
  }
}
```

![](images/apic-multitest-execute.png)

Result:
![](images/apic-graphql-test-3.png)

# 7. Summary <a name="summary"></a>
Congratulations, you have completed the **Creating a StepZen GraphQL Proxy for a Salesforce Account REST API** lab.  Throughout the lab, you learned how to:

-	Deploy an App Connect Toolkit built bar file into Cloud Pak for Integration
-	Capture REST API Endpoints for getAccounts, getAccount methods
-	Create StepZen Configurations for both methods
-	Deploy to StepZen GraphQL Server
-	Test the GraphQL Queries in StepZen Portal
-	Extract StepZen GraphQL URL from StepZen Portal
-	Expose GraphQL URL into IBM API Connect
-	Test GraphQL API from API Connect

[Return to main APIC lab page](../ReadMe.md)