# IBM Cloud Pak for Integration

## Transaction tracing with Cloud Pak for Integration Operations Dashboard

[Return to main labs page](../index.md)

---

# Table of Contents
- [1. Introduction](#introduction)

- [2. Configuring IBM API Connect](#configuring_apiconnect)

- [3. Using Operations Dashboard](#using_operations_dashboard)

- [4. Lab Cleanup](#lab_cleanup)
	* [7a. Removing Assets from IBM API Connect](#removing_assets)

---

# 1. Introduction <a name="introduction"></a>

The purpose of this lab is to introduce you to the Operations Dashboard. The IBM Cloud Pak for Integration Operations Dashboard Add-on provides cross-component transaction tracing to allow troubleshooting and investigating errors and latency issues across integration capabilities to ensure applications meet service level agreements.

**Main features:**
#
- Visually follow the journey of distributed transactions – from the entry as an API, to invocation of an integration flow, placement into an Event Streams topic or an MQ queue and beyond, including complex, asynchronous and long-running use cases
- Quickly understand latencies and errors across integration capabilities
- Identify and focus on issues using builtin dashboards and advanced filtering based on capability-specific terminology
- Execute and schedule reports and define proactive alerts to quickly respond to issues
- Non-intrusive implementation that does not require changes to existing integration code for sending tracing data

**Supported capabilities:**
Currently, the Operations Dashboard supports tracing across the following IBM Cloud Pak for Integration capabilities:
#
- App Connect (ACE)
	* Only HTTP, SOAP, MQ and Kafka nodes are supported
	* Tracing MQ messages is only supported for MQ messages that are copied into the default output location. If "Output data location" or "Result data location" (e.g. in the MQGet node) is set to a different location, those messages will not be traced by Operations Dashboard
- API Connect
	* APIs using API Gateway are supported
	* APIs using v5 Compatible Gateway are not supported
- MQ
	* Only MQ messages that include an MQRFH2 header or message properties are supported
	* MQ client connection is supported, binding mode is not supported
- External applications
	* Applications deployed inside the Cloud Pak for Integration cluster can push trace data into the Operations Dashboard runtime (requires code changes to the application)

**Note:** An additional license must be purchased to remove the usage limitations of this add-on capability. Without this license, the following limitations are valid:
#
- Trace data for Operations Dashboard generated from any of the IBM Cloud Pak for Integration capabilities cannot be exported or used outside of IBM Cloud Pak for Integration Operations Dashboard
- Spans are available for a limited duration based on the following conditions (if any of these conditions are reached, new spans will replace existing spans that have met the established limit):
	* Maximum duration of two hours
	* When the total number of spans within IBM Cloud Pak for Integration platform reaches one million

In this lab, we will use the IBM Cloud Pak for Integration to expose an existing integration flow on containers as a secure rate-limited API.

Extending access via APIs to your back-end integrations empowers your partners and developer community to create new business value, technical value, and customer experiences for your products and offerings.

The existing integration flow takes data from the request source and sends it to a message queue for reliable delivery. First we will expose this integration as a rate-limited API secured by a key and secret.  Lastly, we will look at the tracing capability provided by the IBM Cloud Pak for Integration.


# 2. Configuring IBM API Connect <a name="configuring_apiconnect"></a>

There's an application integration flow deployed inside our cluster. Now, to make it accessible to the rest of the world, it is important to add security around it - at least in the form of a client ID. This way, in addition to access control, you can get insights into which teams or customers are the least and most active. Adding security to an API is simply done by an OpenAPI configuration parameter. We can add rate limits to the API to increase the calls per second, minute, or hour to scale up as much as you need. At this point we are going to reuse an exiting API Definition that someone else in our team or company has configured previously and shared for others to reuse.

1\.If you're not logged before, follow these instructions to access to the API Manager ->
[Login to the API Manager](../../../APIC-labs-new/Login-apic/ReadMe.md)

2\. Click **Develop APIs and products**.

![alt text][pic63]

3\. Click **Add** &#8594; **API**.

![alt text][pic64]

4\. Click **From asset repository** and click **Next**.

![alt text][pic65]

5\. Click **Lauch Asset Repositoy**.

![alt text][pic65a]

6\. A new view shows a list of shared Open API Specifications that are available to work with.Click the **+** for the **Orders API** to import it into your API Connect workspace.

![alt text][pic65b]

7\. The yaml should show that it has been successfully validated. Click **Next**.

![alt text][pic65c]

8\. Click **Next** again to complete the import wizard.

![alt text][pic65d]

9\. Now click **Edit** open the api definition in the API Connect Designer.

![alt text][pic65e]


10\. In the **API Designer** view we can change the configuration of the API.  Here we can explore the **Design**, **Source**, and **Assemble** tabs. To test the API, we must activate the API. Switch the toggle from **Offline** to **Online**. This step automatically publishes the API. You can also close the window that indicates that your API has been updated.

![alt text][pic70]

![alt text][pic71]

11\. Click on the **Test** tab.

![alt text][pic72]

12\. Enter **0000** for the value of **order**.  Click **Send**.

![alt text][pic73]

**Note:** You may get a **No response received** popup.  Click **Here**.

![alt text][pic74]

To add an exception in the Chrome browser, click in the whitespace of the page.

![alt text][pic75]

Blindly type **thisisunsafe**.  This should direct you to a new page that states **401 - Unauthorized**.

![alt text][pic76]

Navigate back to the **API Connect** browser window.

To add an exception in the Firefox browser, click **Advanced** and click **Accept the Risk and Continue**.

![alt text][pic77]

![alt text][pic78]

This will direct you to a new page that states **401 - Unauthorized**.

![alt text][pic79]

Navigate back to the **API Connect** browser window.

13\. Click **Send**.

![alt text][pic80]

14\. We should see the following response.

![alt text][pic81]

[pic53]: images/53.png
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
[pic65a]: images/65a.png
[pic65b]: images/65b.png
[pic65c]: images/65c.png
[pic65d]: images/65d.png
[pic65e]: images/65e.png
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
[pic80]: images/80.png
[pic81]: images/81.png
[pic137]: images/137.png
[pic140]: images/140.png
[pic141]: images/141.png
[pic142]: images/142.png

# 3. Using Operations Dashboard <a name="using_operations_dashboard"></a>

Cloud Pak for Integration - Operations Dashboard Add-on is based on the Jaeger open source project and the OpenTracing standard to monitor and troubleshoot microservices-based distributed systems. Operations Dashboard can distinguish call paths and latencies. DevOps personnel, developers, and performance specialists now have one tool to visualize throughput and latency across integration components that run on Cloud Pak for Integration. Cloud Pak for Integration - Operations Dashboard Add-on is designed to help organizations that need to meet and ensure maximum service availability and react quickly to any variations in their systems.

1\. In the Platform Navigator, expand the menu in the upper left.

![alt text][pic82]

Click on the caret next to **Operate** and select **Integration tracing**.

**Note:** If you get a warning message that your connection is not private, follow the instructions in Section 2.

![alt text][pic83]

2\. The first time you access Tracing, you might see this what’s new page. Close the window after review.

![alt text][pic85]

3\. In the **Tracing** page, check the **Overview** tab. We see all of the products that you can use this tool with: APIC, APP Connect and IBM MQ.  **Note**: More tracing products will add in the future releases.

![alt text][pic86]

4\. You can monitor each product separately. Click **App C overview**.

![alt text][pic87]

5\. Operations Dashboard generates a list of tracing. Click **Traces** on the left-hand pane.  

![alt text][pic88]

6\. Click on one of the Trace entries. **Note:** Your trace entries may look different from what is captured in the screenshot below. Look for a trace that is tied to your username in the *Root operation* column and shows **API C, App C, and MQ** in the *Capabilities* column.

![alt text][pic89]

7\. We can drill into the individual components.  Click on **orders 1.0.0**.

![alt text][pic90]

The trace will take you through the activity that occurred in IBM API Connect.

![alt text][pic91]

8\. Click on **gen.orders**.

![alt text][pic92]

9\. Click on **ORDERS**.

![alt text][pic93]

![alt text][pic147]

[pic82]: images/82.png
[pic83]: images/83.png
[pic84]: images/84.png
[pic85]: images/85.png
[pic86]: images/86.png
[pic87]: images/87.png
[pic88]: images/88.png
[pic89]: images/89.png
[pic90]: images/90.png
[pic91]: images/91.png
[pic92]: images/92.png
[pic93]: images/93.png
[pic147]: images/147.png

# 4. Lab Cleanup <a name="lab_cleanup"></a>

We will now clean-up the environment.

# 4a. Removing Assets from IBM API Connect <a name="removing_assets"></a>

1\. In the Platform Navigator, navigate to the API Connect instance.

![alt text][pic94]

![alt text][pic95]

If prompted, log in with the username and password provided to you for this lab.

2\. Click on **Developer APIs and products**.

![alt text][pic96]

3\. Click on the triple-dot icon for **orders** and click **Delete**.

![alt text][pic97]

4\. Confirm the deletion by clicking **Delete**.

![alt text][pic98]

[pic94]: images/94.png
[pic95]: images/95.png
[pic96]: images/96.png
[pic97]: images/97.png
[pic98]: images/98.png
[pic138]: images/138.png

# Congratulations!
You have completed the IBM Cloud Pak for Integration Operations Dashboard lab.

[Return to main labs page](../index.md)
