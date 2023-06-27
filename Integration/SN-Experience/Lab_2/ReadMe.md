# IBM API Connect


## API lifecycle which includes creating, running, managing, and securing APIs

[Return to main lab page](../index.md)

---

# Table of Contents 
- [1. IBM API Connect](#ibm_api_connect)
- [2. The Steps of the API Lifecycle Include Creating, Running, Managing, and Securing APIs](#the_steps_of_the_api_lifecycle_include_creating_running_managing_and_securing_api)
  * [2.1 Let's Start](#lets_start)
  * [2.2 Import API](#create)
- [3. Configure API](#assemble_view)
  * [3.1 Configure API Key Security](#api_key_security)
  * [3.2 Security Definition](#security_definition)
  * [3.3 Define Target-URL for Sandbox Environment](#target_url)
- [4. Test API](#test)
- [5. Publishing](#publishing)
- [6. Developer Portal](#developer_portal)

---

# 1. IBM API Connect <a name="ibm_api_connect"></a>

IBM API Connect is an integrated API management offering, where all of the steps in the API lifecycle, and the actions that surround it, are performed within the offering.

# 2. The Steps of the API Lifecycle Include Creating, Running, Managing, and Securing APIs <a name="the_steps_of_the_api_lifecycle_include_creating_running_managing_and_securing_api"></a>

* Create, develop, and write the API definition and implementation, and test the API.
* Run, package, and deploy the API. Ensure that the API is hosted securely on a stable platform.
* Create and manage self-service portals that expose the API to API consumers. Monitor the set of rules and conditions that govern the API to ensure it is fulfilling its intended purpose, and make adjustments if necessary. Retire and archive the API when appropriate.
* Secure, incorporate access control, monitoring, and logging to properly secure the API.

# 2.1 Let's Start <a name="lets_start"></a>
First make sure you are logged into the CP4I Platform Navigator using the account the instructor provided to you. If you are already logged in, you can skip these steps. 

4\. Click on the API Connect link to take you to the API Manager Home page.

![alt text][pic2]

5\. You will now be on the APIC log in page. Select the **Common Services User Registry**
This will log you into the Provider Org you will be using.

![alt text][pic3]

6\. Once you are on the main page make sure you are in the correct POrg.  It should contain your userid. 

![alt text][pic4]

7\. When logged in and connected to the APIC Home Dashboard, you will see a few tiles and a tab on the left-hand side of the page.  You can use the left-hand menu or the Develop APIs and Products tile. 

![alt text][pic5]

[pic0]: images/0.png
[pic1]: images/1.png
[pic2]: images/2.png
[pic3]: images/3.png
[pic4]: images/4.png
[pic5]: images/5.png


# 2.2 Import API  <a name="create"></a>

There are a few ways to pull existing API flows or manually expose an API on this page. Whether it’s starting from scratch or pulling from an asset from a connected asset repo they all achieve the same thing.

For this Lab, we will use the Open API Document (ServiceNowRetrieve-0.0.1.yaml) we downloaded from our ACE integration server earlier in order to import the API.

1\. For now, we will click **Add** and select **API** from the dropdown.

![alt text][pic6]

2\. On the create page, you will be greeted with choices of how you would like to add an API. And on the top you will see option for OpenAPI 2.0 or Open API 3.0.  For this lab, we will use the **OpenAPI 2.0**. Go ahead and click Import from existing API Import and click **Next**. 

![alt text][pic7]

3\. On the Import API page, either drag and drop the yaml file from the ServiceNow Designer lab or click to upload it. Click **Next**.

![alt text][pic8]

4\. The next screen will ask if you want to activate the API. This will automatically create and expose your API.  However for this lab, we will **NOT** check that box and click **Next**.

5\. You will see the following summary page that shows the definition was successful generated. Click on **Edit API**. This will take you to the designer page and will populate the fields inside APIC with what was able to be pulled from the document we imported.

![alt text][pic9]

# 3. Configure API <a name="assemble_view"></a>
After importing the existing API, the first step is to configure basic security before exposing it to other developers. By creating a client key and secret security, you are able to identify the app using the services. Next, we will define the backend endpoints where the API is actually running. API Connect supports pointing to multiple backend endpoints to match your multiple build stage environments. Finally, we will configure the proxy call to invoke the endpoint.

# 3.1 Configure API Key Security <a name="api_key_security"></a>
The API Designer is a graphical user interface within the developer toolkit and provides functions for the creation and configuration of API definitions, running offline.

1\. On the Design page, you will notice the small red dot indicating an error.  This is related to not having https in our schemes. Click on the **+** next to the **Schemes List**.

![alt text][pic10]

2\. Add the **https** and then click **Save**.  You will now be showing **Schemes List(2)**

![alt text][pic10a]

**Note** Whenever you do a Save the following pop-up will show up.  Go ahead and click the **x** to close it. 

![alt text][pic10b]

[pic6a]: images/6a.png
[pic6]: images/6.png
[pic7]: images/7.png
[pic8]: images/8.png
[pic9]: images/9.png
[pic10]: images/10.png
[pic10a]: images/10a.png
[pic10b]: images/10b.png

# 3.2 Security Definition <a name="security_definition"></a>

After importing the existing API, the first step is to configure basic security before exposing it to other developers. By creating a client key and secret security, you are able to identify the app using the services. Next, we will define the backend endpoints where the API is actually running. API Connect supports pointing to multiple backend endpoints to match your multiple build stage environments. Finally, we will configure the proxy call to invoke the endpoint.

1\. We will now secure the API. On the left-hand side, let’s click on **Security Schemes**. 

Click on the **+** and we will start adding the Client ID.

![alt text][pic11]

2\. We will first create a client-id filling in the page with the following info.  
* Enter "Client-id" for the Name of the key.
* For the Security Definition Type click on the drop down and select **apiKey**.

![alt text][pic12]

3\. After you select apiKey, the following window will open.  Finish filling it in with the rest of the info and click **Create**. 

```
Key type = client_id
Located In = header (from dropdown)
Varible name = x-client-id

```
![alt text][pic13]

4\. Repeat steps 1 to 3 to create the Client-secret as a Type **client_secret**.  It should look like the following screen:

![alt text][pic13a]

5\. You should now have a Client-id and Client-secret for your Security Schemes (2).

![alt text][pic13b]

6\. Go to the Security under Produces and click the **+** to add our security.
* Click the Client-id and the Client-secret and then click **Create**.

![alt text][pic14]

7\. Once you have selected both, click on **Submit**.  Also go to the upper right and click on **Save** to save all your updates. 

![alt text][pic14a]

8\. One last thing to do on the Design tab.   Click on **Host** and then save the host name to a notepad and leave this blank.  We will use this in the next section when we setup our apigw proxy.  * Also go to the upper right and click on **Save** to save all your updates.  

**Note:** You will want to make sure that the host name field is empty.

![alt text][pic14b]

[pic11]: images/11.png
[pic12]: images/12.png
[pic13]: images/13.png
[pic13a]: images/13a.png
[pic13b]: images/13b.png
[pic14]: images/14.png
[pic14a]: images/14a.png
[pic14b]: images/14b.png

# 3.3 Define Target-URL for Sandbox Environment <a name="target_url"></a>

1\. Click on the **Gateway** tab.   This is where we will setup our Gateway and Portal setting for our API.  Make sure that all your updates are saved by checking the upper right corner. Click on the **Properties** on the left menu. 

![alt text][pic15]

2\. Now click on the **target-url** and use the host name that we saved from step 7 above.   Make sure to add **http://** in front it and save it.   Once done click on the **Policies** in the left menu.

![alt text][pic15a]

3\. You will now see the assemble view. With assemblies, you can readily tailor your APIs to include components such as activity logging and redaction of specific fields. This view includes a palette, which lists available components, a property sheet, which is used to configure a component, and a canvas, which is used to arrange and visualize the assembly’s components.
* Now we will click on the **invoke** to open that so we can update the URL configuration.

![alt text][pic16]

4\. Below the canvas is the details for the invoke.  Scroll down to the URL and you will see $(target-url) please type **$(request.path)** after it.  This will append the path we created earlier to our invoke components URL. Click **Save** in the upper right corner.

![alt text][pic17]

[pic15]: images/15.png
[pic15a]: images/15a.png
[pic16]: images/16.png
[pic17]: images/17.png

# 4. Test the API <a name="publishing"></a>

In the API designer, you have the ability to test the API immediately after creation in the Assemble view!

1\.Toggle **Offline** to activate API and to publish the API itself to the gateway for testing.
* Make sure that the Save is gray out if not click it to Save all updates.

![alt text][pic18]

2\. You will see that the API is now online.  Close the API updated pop-up in the right.  
* You will now see that you can click on the **Test** tab in the menu.   Click on that to go to the Test section.

![alt text][pic18a]

3\. You will see you have both operations available for your API.  Select the one that will return the first 2 users and click **Send**.

![alt text][pic19]

4\. In the first time of running the API after publishing the API, the security warning dialog box may show. Please click on the **here** link and accept the certificate to see the 401 message.  
* Go back to the test view and click Send again.

![alt text][pic19a]

5\. In the Response section, you should see the results of your API call.  Review this and save one of the **SystemUserIDs** to test the other operation.  

![alt text][pic20]

6\. Now select the operation to retrieve one AccountID.  Replace {SystemUserID} with one of the user IDs from the first test and click **Send**.  

![alt text][pic20a]

7\. In the Response section, you should see the results of your API call for just the one user ID.

![alt text][pic20b]

[pic18]: images/18.png
[pic18a]: images/18a.png
[pic19]: images/19.png
[pic19a]: images/19a.png
[pic20]: images/20.png
[pic20a]: images/20a.png
[pic20b]: images/20b.png

# 5. Publishing <a name="publishing"></a>

Now that your API has been activated and tested to work, you may want to publish it to a product that can make use of it, or if you’re just starting like us we can create a product for this API to live within. 

1\. There are a few ways to go about this but for this lab let’s go back to the development tab that we first saw when we attempting to create an API.

![alt text][pic31]

2\. Once here you will see the title, version, type, and time last modified of your API. Click the three dots at the end of your API and choose **Publish.**

![alt text][pic32]

3\. Since this is our first product, let’s go ahead and give it a title and click **Next**.

![alt text][pic33]

4\. Each organization can create and manage several catalogs containing different combinations of API and products and its own Developer Portal. For this lab, let’s stick with the Sandbox catalog and click **Publish**.

![alt text][pic34]

5\. We have now created a consumable product that we can find in our Developer Portal.

Something to note is we completely skipped the stage portion of the product. Normally you would want to stage the product, make changes to visibility, subscribability, APIs, categories to include, and lastly subscription plans and rate limits. An example of what I’ve mentioned can be seen below.

![alt text][pic35]

![alt text][pic35a]

[pic31]: images/31.png
[pic32]: images/32.png
[pic33]: images/33.png
[pic34]: images/34.png
[pic35]: images/35.png
[pic35a]: images/35a.png


# 6. Developer Portal <a name="developer_portal"></a>

Application developers discover and use APIs by using the Developer Portal. You can customize the Developer Portal for your application developers.
In addition to allowing application developers to find and use both free and paid APIs, the Developer Portal provides additional features including forums, blogs, comments, and ratings, together with an administrative interface for customizing the Developer Portal. 

Now that your product is published, let's view it in the Developer Portal. This can be found under the Manage section of APIC. 


1\. Click on the **Manage** tab on the left side bar.

![alt text][pic36]

2\. Click the catalog in which you published the API (Sandbox).

![alt text][pic37]

3\. Click on **Catalog settings**.

![alt text][pic38]

4\. Click on **Portal** in the left menu and copy and paste the Portal URL into your browser in a new tab.

![alt text][pic39]

5\. The portal is setup for self service so we will create a new account as a developer.

![alt text][pic40]

6\. Fill in the form and make sure to use a valid email address since that is where the activation email is sent.  At the bottom when done, click **Sign up**.

![alt text][pic41]

7\. You will receive an email that you will copy the link and paste in to your browser to complete the registration at which point you can log in. 

![alt text][pic42]

8\. Go to **Sign in** and enter your Username and Password you just created.

![alt text][pic43]

9\. Once you are logged in, you can explorer varies sections in the Developer Portal.   For now, let's go to the SystemUser Product we created and Published to. 

![alt text][pic44]

10\. Now from the Products page, we see our API for ServiceNow Users and below that you see Plans.  This can be configured back in the Products section where you may add plans for Silver and Gold plans.   We just have the default for this one. Click on the API tile.

![alt text][pic45]

11\. We will now need to Subscribe to the API to use it. You may have other applications already created from other labs. We will create a new one for this one.

![alt text][pic46]

12\. Enter a name for this application and click **Save**.

![alt text][pic47]

13\. You will get the following page.  Save the Key and Secret into notepad and then click **X** to close window.

![alt text][pic48]

15\. With an app now created, let’s travel back to the **API Products** page of the Developer Portal (upper left) and click on the product shown that we created and published to. 

![alt text][pic50]

16\. We will also need to subscribe to a plan for this Product.  Since we only have the Default plan we will use that.

![alt text][pic51]


17\. Select the existing application.

![alt text][pic52]


18\. Confirm subscription and click **Next**.

![alt text][pic53]

19\. This will complete the Subscription.  Click **Done**.

![alt text][pic54]

20\. Click on the API that we will now test.

![alt text][pic55]

21\. Here we will select the GET account operation on the left and then select **Try it**.  The Client ID will have the App name we created earlier.  You will need to copy the secret that we saved and paste it in the Client secret. Click **Send**.

![alt text][pic56]

22\. You will see the response on the bottom of the page. 

![alt text][pic57]

23\. Now that we have run the API several times, click on **Apps** on the top menu and select the Active app that we are using.  

![alt text][pic58]

24\. This will give you info on the APIs that you are running. 

![alt text][pic59]

[Return to main lab page](../index.md)

The End.

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
[pic54]: images/54.png
[pic55]: images/55.png
[pic56]: images/56.png
[pic57]: images/57.png
[pic58]: images/58.png
[pic59]: images/59.png

