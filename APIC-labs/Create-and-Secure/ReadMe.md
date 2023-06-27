# IBM API Connect

## Create and Secure an API to Proxy an Existing REST Web Service

[Return to main APIC lab page](../ReadMe.md#lab-abstracts)

---

# Table of Contents
- [1. Introduction](#introduction)


- [2. Deploying the REST Service](#deploy)

- [3. Import an API into the Developer Workspace](#import_api)

- [4. Configure the API ](#configure_api)
	* [3a. Configure Client Secret API Key Security](#configure_security)
	* [3b. Review and update the Target-URL for Sandbox Environment](#target_url)
	* [3c. Review the Proxy Call in Designer](#proxy)

- [5. Test the API](#test_api)

- [6. Publish API](#publish_api)
	* [5a. Create Customer Product and Add API](#customer_product)

- [7. Summary](#summary)

---

# 1. Introduction <a name="introduction"></a>

In this lab, you will get a chance to use the IBM API Connect (APIC) Designer and its intuitive interface to import and edit an API using the OpenAPI definition (YAML) of an existing Customer Database RESTful web service.

In this tutorial, you will explore the following key capabilities:

-   Creating an API by importing an OpenAPI definition for an existing REST service

-   Configuring ClientID/Secret Security, endpoints, and proxy to invoke an endpoint

-   Testing a REST API in the developer toolkit

-   Publish an API for developers

# 2. Deploying the REST Services <a name="deploy"></a>

First, you will deploy a Customer Database REST service and then you will download the OpenAPI file for the Customer Database REST service that you deployed.

1\. In a browser, enter the URL for the Platform Navigator that is provided by your instructor.

Before beginning this lab, you will want to make sure that you have completed the [API Connect Experience Prereq instructions](../APIC-prereq/index.md).

2\. When you log in for the first time, you may see a **Welcome, let's get started** window.  Feel free to review the contents by click **Start the tour** or by click on the **X** to close the window.

![alt text][pic91]

3\. Navigate to the **App Connect Dashboard**.

![alt text][pic92]

4\. Click on the **Dashboard** icon in the left navigation.

![alt text][pic93]

5\. For this lab, we already have the REST service built and available as a **bar** file. You can download the **CustomerDatabaseV1.bar** file for the service [here](./resources/CustomerDatabaseV1.bar).

6\. Click on **Deploy integrations**.

![alt text][pic94]

7\. Click **Quick start integration** and click **Next**.

![alt text][pic95]

8\. Drag and drop the BAR file that you just downloaded or click to upload.  Once you have dragged and dropped or uploaded, you will see the bar file listed under **to be imported**.  Click **Next**.

![alt text][pic96]

9\. Click **Next**.

![alt text][pic97]

10\. Give the Integration Server a **Name** (e.g., username-customerdb) and click **Create**.

![alt text][pic98]

11\. This will take you back to the Runtimes Dashboard where you will see your new server. It will likely be showing Pending while it is starting up the pod.

![alt text][pic99]

12\. Note: It may take a several minutes to start up. You can refresh the page. Once it is up and running it will show the following:

![alt text][pic100]

13\.  Click on the newly created Runtime.

![alt text][pic101]

14\. Click on the **CustomerDatabaseV1** API.

![alt text][pic102]

15\. Confirm that the **Overview** tab is selected and click **Download OpenAPI Document**.

![alt text][pic103]

[pic0]: images/0.png
[pic1]: images/1.png
[pic2]: images/2.png
[pic3]: images/3.png
[pic4]: images/4.png
[pic5]: images/5.png
[pic91]: images/91.png
[pic92]: images/92.png
[pic93]: images/93.png
[pic94]: images/94.png
[pic95]: images/95.png
[pic96]: images/96.png
[pic97]: images/97.png
[pic98]: images/98.png
[pic99]: images/99.png
[pic100]: images/100.png
[pic101]: images/101.png
[pic102]: images/102.png
[pic103]: images/103.png

# 3. Import an API into the Developer Workspace <a name="import_api"></a>

1\. Click on **IBM Cloud Pak** in the upper left.

![alt text][pic104]

2\. Navigate to the API Connect instance.

![alt text][pic6]

3\. If this is your first time logging in, the login page is presented. Click **Common Services User Registry**.
![alt text][pic8]

4\. Confirm that you are in the provider organization for your username (upper right) and then click on **Develop APIs and products**.

![alt text][pic9]

5\. We are now able to begin to create APIs and Products.  Click **Add**.

![alt text][pic10]

6\. Click **API (from REST, GraphQL or SOAP)**.

![alt text][pic11]

7\. Click **Existing OpenAPI** under **Import** and click **Next**.

![alt text][pic12]

8\.  Drag and drop the yaml file that you just downloaded or click to upload.  Once you have dragged and dropped or uploaded, you will see the yaml file listed under and should see a notification that the "YAML has been successfully validated".  Click **Next**.

![alt text][pic13]

9\. Make sure that the **Activate API** <span style="color: red">is not</span> selected and click **Next**. 

![alt text][pic14]

10\.  The API should be imported successfully as shown in the image below.  Click **Edit API**.

![alt text][pic15]
    
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
[pic104]: images/104.png

# 4. Configure the API <a name="configure_api"></a>

After importing the existing API, the first step is to configure basic security before exposing it to other developers. By creating a client key and secret security, we are able to identify the application using the API. 

Next, we will define the backend endpoints where the API is actually running. IBM API Connect supports pointing to multiple backend endpoints to match your multiple build stage environments. 

Finally, we will configure the proxy call to invoke the endpoint.

## 4a. Configure API Key Security <a name="configure_security"></a>

1\. Schemes define which transfer protocols you want your API to use. Make sure that the **Design** tab is selected and click on the **+** next to **Schemes List**.

![alt text][pic18]

5\. From the **Select an option** drop-down menu, select **https**.  Click **Create**.

![alt text][pic19]

![alt text][pic20]

6\. Expand the **Schemes List** section.  Under the Schemes List, **http** and **https** are listed.  Click **Save**.

![alt text][pic21]

Once saved, you will see an indicator window appear that shows that **Your API has been updated**.  Click on the **X** to close the window.  You should no longer see the warning indicator.

![alt text][pic22]

7\. Make sure that the **Design** tab is selected and click on the **+** next to **Security Schemes**.

![alt text][pic23]

8\. For the **Security Definition Name (Key)**, enter a name (e.g., **X-IBM-Client-Id**) and select **apiKey** in the drop-down menu for **Security Definition Type**.

![alt text][pic24]

9\. Select **client_id** from the drop-down menu for **Key Type (optional)**, select **header** from the drop-down menu for **Located In**, and enter a name (e.g., **X-IBM-Client-Id**) for **Variable name**.  **Note:** Before clicking Create, make sure that the **This field is required** indicator is no longer there.  Click **Create**.

![alt text][pic25]

10\. Click **Save**.

![alt text][pic26]

11\. Once saved, you will see an indicator window appear that shows that **Your API has been updated**.  Click on the **X** to close the window.

![alt text][pic22]

12\. Make sure that the **Design** tab is selected and click on the **+** next to **Security Schemes**.

![alt text][pic31]

13\. For the **Security Definition Name (Key)**, enter a name (e.g., **X-IBM-Client-Secret**) and select **apiKey** in the drop-down menu for **Security Definition Type**.

![alt text][pic32]

14\. Select **client_secret** from the drop-down menu for **Key Type (optional)**, select **header** from the drop-down menu for **Located In**, and enter a name (e.g., **X-IBM-Client-Secret**) for **Variable name**.  Before clicking Create, make sure that the **This field is required** indicator is no longer there.  Click **Create**.

![alt text][pic33]

15\. Click **Save**.

![alt text][pic26]

16\. Once saved, you will see an indicator window appear that shows that **Your API has been updated**.  Click on the **X** to close the window.

![alt text][pic22]

17\. Make sure that the **Design** tab is selected and click on **+** next to **Security**.

![alt text][pic34]

18\. Select **"X-IBM-Client-Id"** and **"X-IBM-Client-Secret"** and click **Create**.

![alt text][pic35]

19\. Click **Save**.

![alt text][pic26]

20\. Once saved, you will see an indicator window appear that shows that **Your API has been updated**.  Click on the **X** to close the window.

![alt text][pic22]

## 4b. Define a Target-URL for Sandbox Environment <a name="target_url"></a>

1\. Make sure that the **Design** tab is selected and click on **Host**.

![alt text][pic38]

2\. Copy the value in the **Host (optional)** field.

![alt text][pic39]

3\. Navigate to the **Gateway** tab.

![alt text][pic40]

4\. Make sure that the **Gateway** tab is selected and expand **Properties**.  Click on **target-url**.

![alt text][pic41]

5\. Replace the **Property Value (optional)** with the value that you copied in Step 2.  **Note:**  Make sure to include a **http://** at the beginning and remove the **:** and **port number** (e.g. **:80**) if present from the end.

![alt text][pic42]

6\. Click **Update**.

![alt text][pic43]

7\. Click **Save**.

![alt text][pic44]

8\. Navigate to the **Design** tab.

![alt text][pic45]

9\. Click on **Host**.

![alt text][pic46]

10\. Delete the value in the **Host (optional)** field.

![alt text][pic47]

11\. Click **Save**.

![alt text][pic26]

12\. Once saved, you will see an indicator window appear that shows that **Your API has been updated**.  Click on the **X** to close the window.

![alt text][pic22]

## 4c. Configure Proxy Call in Designer <a name="proxy"></a>

1\. Navigate to the **Gateway** tab.

![alt text][pic48]

2\. Make sure the **Gateway** tab is selected and click on **Policies**.

![alt text][pic49]

3\. Click on the **Invoke** task in the assembly panel.

![alt text][pic50]

4\. Update the **URL** so that it reads **$(target-url)$(request.path)**.

![alt text][pic51]

5\. Click **Save**.

![alt text][pic52]

6\. Once saved, you will see an indicator window appear that shows that **Your API has been updated**.  Click on the **X** to close the window.

![alt text][pic53]

[pic16]: images/16.png
[pic17]: images/17.png
[pic18]: images/18.png
[pic19]: images/19.png
[pic20]: images/20.png
[pic21]: images/21.png
[pic22]: images/22.png
[pic23]: images/23.png
[pic24]: images/24.png
[pic25]: images/25.png
[pic26]: images/26.png
[pic27]: images/27.png
[pic28]: images/28.png
[pic29]: images/29.png
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
[pic46]: images/46.png
[pic47]: images/47.png
[pic48]: images/48.png
[pic49]: images/49.png
[pic50]: images/50.png
[pic51]: images/51.png
[pic52]: images/52.png
[pic53]: images/53.png
[pic105]: images/105.png
[pic106]: images/106.png

# 4. Test the API <a name="test_api"></a>

In the API Designer, you have the ability to test the API immediately after creation in the Assemble view!

1\. Switch the toggle from Offline to Online. This step automatically publishes the API.

![alt text][pic54]

2\. You will see an indicator window appear that shows that **Your API has been updated**.  Click on the **X** to close the window.  You should see that the API is now Online.

![alt text][pic55]

3\. Click on the **Test** tab.

![alt text][pic56]

4\. For the **Request**, select the request that begins with **GET** and ends in **../customerdb/v1/customers**.  Click **Send**.

![alt text][pic57]

**Note:** If this is the first time testing the API after publishing it, you may get a **No response received** popup. Click **Open the server** and accept the certificate to see the 401 message.

![alt text][pic58]

To add an exception in the Chrome browser, click on **Advanced**.

![alt text][pic59]

Click on **Proceed to apim-demo...**. This should direct you to a new page that states **401 - Unauthorized**.

![alt text][pic60]

![alt text][pic107]

Navigate back to the **API Connect** browser window.

To add an exception in the Firefox browser, click **Advanced** and click **Accept the Risk and Continue**.

![alt text][pic61]

![alt text][pic62]

This will direct you to a new page that states **401 - Unauthorized**.

![alt text][pic63]

Navigate back to the **API Connect** browser window.

5\. Click **Send**.

![alt text][pic57]

6\. The **Response** will show all of the customers in the database.

![alt text][pic64]

7\. Now let's add a record to the database.  Click **Clear**.

![alt text][pic65]

8\. For the **Request**, select the request that begins with **POST** and ends in **../customerdb/v1/customers**.  Click on the **Body** tab.

 ![alt text][pic66]

9\. In the **Body** tab, enter some text in the following JSON format:<br>
<code>
{
  "firstname": "Emily",
  "lastname": "Drew",
  "address": "123 Colorado Address"
}
</code>

Click **Send**.

![alt text][pic67]

10\. Make note of the **ID** number in the response.  In the example below, the ID is 9.

![alt text][pic68]

11\. For the **Request**, select the request that begins with **GET** and ends in **../customerdb/v1/customers/{customerId}** and click **Clear**.

![alt text][pic69]

12\. Click on the **Parameters** tab and enter the **ID** that you noted in step 10. Click **Send**.

![alt text][pic70]

13\. In the response, you will see the customer information that you entered in step 9.

![alt text][pic71]

14\. We can now update the customer information. For the **Request**, select the request that begins with **PUT** and ends in **../customerdb/v1/customers/{customerId}** and click **Clear**.

![alt text][pic72]

15\. Enter the **ID** that you noted in step 10 under the **Parameters** tab and click on the **Body** tab.

![alt text][pic73]

16\. In the **Body** tab, enter some text in the following JSON format:<br>
<code>
{
  "firstname": "Emily",
  "lastname": "Drew",
  "address": "123 Denver Address"
}
</code>
and click **Send**.

![alt text][pic74]

17\. The response should show that the customer ID was updated.

![alt text][pic75]

18\. For the **Request**, select the request that begins with **GET** and ends in **../customerdb/v1/customers/{customerId}** and click **Clear**.

![alt text][pic69]

19\. Make sure that the **Parameters** tab is selected and enter the **ID** that you noted in step 10. Click **Send**.

![alt text][pic70]

20\. In the response, you will see the customer information that you entered in step 16.

![alt text][pic76]

21\. You can also delete a customer from the customer database.  For the **Request**, select the request that begins with **DELETE** and ends in **../customerdb/v1/customers/{customerId}** and click **Clear**.

![alt text][pic77]

22\. Make sure that the **Parameters** tab is selected and enter the **ID** that you noted in step 10 and enter **secr3t** for **Authorization**. Click **Send**.

![alt text][pic78]

23\. In the response, you will see the customer was deleted.

![alt text][pic79]

[pic54]: images/54.png
[pic55]: images/55.png
[pic56]: images/56.png
[pic57]: images/57.png
[pic58]: images/58.png
[pic59]: images/59.png
[pic60]: images/60.png
[pic61]: images/61.png
[pic62]: images/62.png
[pic63]: images/63.png
[pic64]: images/64.png
[pic65]: images/65.png
[pic66]: images/66.png
[pic67]: images/67.png
[pic68]: images/68.png
[pic69]: images/69.png
[pic70]: images/70.png
[pic71]: images/71.png
[pic72]: images/72.png
[pic73]: images/73.png
[pic74]: images/74.png
[pic75]: images/75.png
[pic76]: images/76.png
[pic77]: images/77.png
[pic78]: images/78.png
[pic79]: images/79.png
[pic107]: images/107.png

# 5. Publish API <a name="publish_api"></a>

In this lab, you will make the API available to developers. In order to do so, the API must be first put into a product and then published to the Sandbox catalog. A product dictates rate limits and API throttling.

When the product is published, the Invoke policy defined in the previous lab is written to the gateway. 

## 5a. Create Customer Product and Add API <a name="customer_product"></a>

1\. From the vertical navigation menu on the left, click **Develop**.

![alt text][pic80]

2\. Click the **Products** tab.

![alt text][pic82]

3\. Click **Add** and click **Product** from the drop-down menu.

![alt text][pic83]

![alt text][pic84]

4\. Click **New product** and click **Next**.

![alt text][pic85]

5\. Enter **Customer** for the **Title** and click **Next**.

![alt text][pic86]

6\. Select the **Customer Database** API and click **Next**.

![alt text][pic87]

7\. Keep the **Default Plan** as is and click **Next**.

![alt text][pic88]

8\. Select **Publish product** and confirm that **Visibility** is set to **Public** and **Subscribability** is set to **Authenticated**.  Click **Next**.

![alt text][pic89]

9\.  The Product is now published successfully with the API base URL listed and available for developers from the Developer Portal.  Click **Done**.

![alt text][pic90]

[pic80]: images/80.png
[pic81]: images/81.png
[pic82]: images/82.png
[pic83]: images/83.png
[pic84]: images/84.png
[pic85]: images/85.png
[pic86]: images/86.png
[pic87]: images/87.png
[pic88]: images/88.png
[pic89]: images/89.png
[pic90]: images/90.png

# 6.Summary <a name="summary"></a>

Congratulations, you have completed the **Create and Secure an API** lab. Throughout the lab, you learned how to:

-   Create an API by importing an OpenAPI definition for an existing REST service

-   Configure ClientID/Secret Security, endpoints, and proxy to invoke endpoint

-   Test a REST API in the Developer Toolkit

-   Publish an API for developers

[Return to main APIC lab page](../ReadMe.md#lab-abstracts)
