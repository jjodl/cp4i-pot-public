# IBM API Connect

## The Developer Portal Experience

[Return to main APIC lab page](../ReadMe.md#lab-abstracts)

<span style="color: red">Lab prerequisite:</span> "Create and Secure an API to Proxy an Existing REST Web Service"

---

# Table of Contents
- [1. Introduction](#introduction)

- [2. Generate the Developer Portal](#generate_portal)
	* [2a. Login to the API Connect Developer Portal](#portal_login)

- [3. Register a Test Application](#register_app)
	* [3a. Create a new Consumer Application](#consumer_app)

- [4. Subscribe to the API Product](#subscribe_product)

- [5. Test the API](#test_api)

- [6. Summary](#summary)

---

# 1. Introduction <a name="introduction"></a>

In this lab, you will take the API created in the "Create and Secure an API to Proxy an Existing REST Web Service" lab and publish it to a Developer Portal where it will be ready for consumption by application developers.

You will begin by creating a new catalog and configuring the Developer Portal for the Customer 1.0.0 Product. You will then define a new Plan in the Product and publish to the new Developer Portal.

In this lab, you will explore the following key capabilities:

-   Configure the Developer Portal and publish the APIs

-   Create a Portal Account

-   Create an application and subscribe to a Plan

-   Test the API in the Developer Portal

# 2. Generate the Developer Portal <a name="generate_portal"></a>

A Developer Portal for the Sandbox catalog has already been configured in this environment.

## 2a. Login to the API Connect Developer Portal <a name="portal_login"></a>

1\. If you are not already logged into the Platform Navigator, enter the URL for the Platform Navigator that was provided by your instructor.  To navigate to the main page of the Platform Navigator, click on **IBM Cloud Pak** in the upper left.

![alt text][pic104]

2\. Navigate to the API Connect instance.

![alt text][pic6a]

3\. If this is your first time logging in, the login page is presented. Click **Common Services User Registry**.

![alt text][pic8a]

2\. If you are already logged in and continuing from the previous lab, click on the **Home** icon on the left navigation bar to take you to the main API Manager page.  If you just logged in, it will take you to the main API Manager page.  Click on **Manage catalogs**.  

![alt text][pic9]

3\. Click on **Sandbox**.

![alt text][pic10]

4\. Select the **Catalog settings** tab.  **Note:** Depending on how many labs you have completed, your Products list may differ then what is reflected in the screenshot.

![alt text][pic11]

5\. From the left menu, click on **Portal**.

![alt text][pic12]

6\. Highlight the **Portal URL** and right click to open URL in new tab or paste it in a new browser tab.  
**Note:** If you get a warning message that your connection is not private, you can follow the instructions in the [API Connect Experience Prereq instructions](../APIC-prereq/index.md) to add an exception.

![alt text][pic13]

7\.  The IBM API Connect Developer Portal provides consumers access to API Catalog information.  This gives application developers the opportunity to explore and test APIs, register applications, and subscribe to Plans.

A Portal Administrator can customize the look and feel to their organizational specifications. The default Developer Portal looks like the image below.  Note:  Depending on what you have published, the Products that you see may be different.

![alt text][pic14]

8\. Some Products are visible to all users without an account depending on the Product visibility setting. Additional options are available when you log into the Developer Portal.

=================================================================================================

**NOTE:** In this Proof of Technology, you created a Consumer account and Consumer Organization in the [API Connect Experience Prereq instructions](../APIC-prereq/index.md).  If using the pre-defined Consumer account, go to [**Step 11**](#step11) to log into the Developer Portal with your assigned username and password.  

If you would like to create your own account to access the Portal, follow the steps below.

9\. To create your own account, click on **Create an account**.

![alt text][pic15]

Next fill out the form and an activation email will be sent to you.  Click **Sign up**.

![alt text][pic16]

10\. You will then receive the activation email.  Copy the link and paste in to your browser to complete the registration.  Once complete, you can log in with your new account.

![alt text][pic17]

=================================================================================================

11\.<a name="step11"></a> You can log into the Developer Portal using the pre-defined Consumer account or the Consumer account that you just created.  Click on **Sign in** on the Dev Portal screen in the upper right corner.  

![alt text][pic19a]

12\. The Sign in screen will pop up and you will log in with your Consumer username and password.  If using the Consumer account that you pre-defined, the name will be based on your cluster account.  In the screenshot below, the cody cluster is being used and the user is cody2.  Therefore, the Consumer account username will be cody2dev.  The password that was suggested in the prereq was **passw0rd**.  If you are using the Consumer account that you just created, you can log in with those credentials.  Click **Sign in**. 

![alt text][pic20a]

13\. Once logged in, you will see the Welcome page for the portal.   Continue to the next section to register you test application. 

![alt text][pic21a]

[pic6a]: images/6a.png
[pic8a]: images/8a.png
[pic104]: images/104.png
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
[pic19a]: images/19a.png
[pic20a]: images/20a.png
[pic21a]: images/21a.png

# 3. Register a Test Application <a name="register_app"></a>

1\. You can explore various sections in the Developer Portal. Click on **Explore API Products**.

![alt text][pic37]

2\. The Products that you see in your Portal may vary from what is shown in the lab images.  Click on **Customer 1.0.0**.  This is the Product that was published in the "Create and Secure an API to Proxy an Existing REST Web Service" lab.

![alt text][pic19]

3\. You will see the API and Plan that is associated with the Customer 1.0.0 Product.

![alt text][pic20]

## 3a. Create a new Consumer Application <a name="consumer_app"></a>

IBM API Connect enforces entitlement rules to ensure that consumers are allowed to access the APIs that are being requested.  In the following steps you will register your consumer application and subscribe to an API Product.

1\. Click on **Apps**.

![alt text][pic21]

2\. Click **Create new app**.

![alt text][pic22]

3\. Give your application a **title** (e.g., Customer Demo) and click **Save**.

![alt text][pic23]

4\.  When your consumer application is registered in the IBM API Connect system, it is assigned a unique set of client credentials. These credentials must be provided on each API request in order for the system to validate your subscription entitlements. The Client Key can be retrieved anytime but the Client Secret can only be retrieved at this time.

Make note of your **Client Key** and **Client Secret** by click on the copy icon for each. **NOTE:** Copy these to notepad since you will need the Client Secret in a future step. 
 
Click **OK**.

![alt text][pic24]

[pic19]: images/19.png
[pic20]: images/20.png
[pic21]: images/21.png
[pic22]: images/22.png
[pic23]: images/23.png
[pic24]: images/24.png
[pic37]: images/37.png

# 4. Subscribe to the API Product<a name="subscribe_product"></a>

At this point, your registered consumer application has no entitlements.

In order to grant it access to an API resource, you must subscribe to a Product and Plan.

1\. Click on **API Products**.

![alt text][pic25]

2\. Click the **Customer 1.0.0** Product.

![alt text][pic26]

3\. Click on **Select** for the **Default Plan**.

![alt text][pic27]

4\. Select the application (e.g., **Customer Demo**) that you just created.  **Note:** The number of applications that you see in your environment may differ.

![alt text][pic28]

5\. Review the subscription information and click **Next**.

![alt text][pic29]

6\. Click **Done**.

![alt text][pic30]

[pic25]: images/25.png
[pic26]: images/26.png
[pic27]: images/27.png
[pic28]: images/28.png
[pic29]: images/29.png
[pic30]: images/30.png

# 5. Test the API<a name="test_api"></a>

The API Connect Developer Portal allows consumers to test the APIs directly from the website. This feature may be enabled or disabled per API.

1\. You should be on a screen that shows the API and Plan for the **Customer 1.0.0** Product.  If you are not on this screen, click on **API Products** in the top navigation and select the **Customer 1.0.0** Product.

![alt text][pic31]

2\. Click on the **Customer Database 1.0.0** API.

![alt text][pic32]

3\. Click on the **GET /customers** operation.

![alt text][pic33]

4\. On the right, you will find information about the request parameters and links to the response schemas.  Click the **Try it** tab.

![alt text][pic34]

5\. If you only have one application registered, it will be automatically selected in the **API Key** drop-down menu. If you have more than one, select the application (**Customer Demo**) which is subscribed to this API Product.

Paste your **Client Secret** in the **API Secret** field.

Click **Send**.

![alt text][pic35]

6\. Scroll down to see the call results.

![alt text][pic36]

**Note:** If running for the first time, you may see Code: 0 No response received. Causes include a lack of CORS support on the target server, the server being unavailable, or an untrusted certificate being encountered.  Clicking the link below will open the server in a new tab.

If the browser displays a certificate issue, you may choose to accept it and return here to test again.

7\. Feel free to test the rest of the operations.  Testing will be similar to the testing that was completed in the "Create and Secure an API to Proxy an Existing REST Web Service" lab.

[pic31]: images/31.png
[pic32]: images/32.png
[pic33]: images/33.png
[pic34]: images/34.png
[pic35]: images/35.png
[pic36]: images/36.png

# 6. Summary <a name="summary"></a>

Congratulations, you have completed the **Developer Portal Experience** lab. Throughout the lab, you learned how to:

-   Navigate to the Developer Portal

-   Create a Portal account

-   Create an application and subscribe to a Plan

-   Test a API in the Developer Portal

[Return to main APIC lab page](../ReadMe.md#lab-abstracts)