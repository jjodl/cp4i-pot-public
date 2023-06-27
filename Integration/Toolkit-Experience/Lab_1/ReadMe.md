# IBM App Connect Enterprise
[Return to main lab page](../index.md)
## App Connect Enterprise Basics

### Featuring: 
- Integration Servers
- Integration Servers managed by Integration Nodes
- Running simple message flows and REST APIs
 
 ---

# Table of Contents 
- [1. Introduction](#introduction)
- [2. Integration Servers](#integration_servers)
  * [2.1 Configure a local integration server](#configure_a_local_integration_server)
  * [2.2 Stopping and starting a local integration server](#stopping_and_starting_a_local_integration_server)
    + [2.2.1 Using Integration Toolkit](#using_integration_toolkit)
    + [2.2.2 Using the Administration REST API](#using_the_administration_rest_api)
  * [2.3 Putting integration servers to work!](#putting_integration_servers_to_work)
    + [2.3.1 Import PING_Basic](#import_ping_basic)
    + [2.3.2 Review PING_Basic](#review_ping_basic)
    + [2.3.3 Deploy PING_Basic](#deploy_ping_basic)
    + [2.3.4 Test PING_Basic](#test_ping_basic)
    + [2.3.5 Build PING_Basic BAR file](#build_ping_basic_bar_file) 
- [3. Deploy BAR file to Cloud Pak for Integration (CP4I)](#deploy_bar_file_to_cp4i)
  * [3.1 Test PING_Basic flow on CP4I](#test_ping_basic_flow_on_cp4i)

[Return to main ACE lab page](../index.md)
---

# 1. Introduction <a name="introduction"></a>

The purpose of this LAB is to show how to create a default Integration Server and then we will build a very simple application that we will deploy to the integration server to test. 

# 2. Integration Servers  <a name="integration_servers"></a>

## 2.1 Configure a Local Integration Server <a name="configure_a_local_integration_server"></a>

The ability to create a local integration server from the Integration Toolkit was introduced in fix pack 8 of IBM App Connect Enterprise. In the next section you will create a local integration server using this feature. The following diagram shows what you will set up on your local integration server.

![alt text][pic0]

1\. Open the IBM App Connect Enterprise Toolkit.   From the virtual Desktop image that you were assigned for the PoT login and then open a Terminal window.    This will land you in your home directory.   Enter **ace toolkit**  
From the Workspace Launcher we will create a new workspace for the work in this lab guide enter the Workspace name and click OK.

![alt text][pic1] 

2\. In the “**Welcome to IBM App Connect Enterprise Toolkit**” window click the arrow to go to the **Integration Toolkit**: 

![alt text][pic2]

3\. The Eclipse based **Integration Toolkit** will open:

![alt text][pic3]

A)	**The Application Development** window <span style="color:red"><b>(A)</b></span> is where your Applications, REST APIs, etc. will be shown in your workspace

B)	Window <span style="color:red"><b>(B)</b></span> is where resources that you open (for example message flows) will be shown.

C)	Window <span style="color:red"><b>(C)</b></span> is where properties of resources that you highlight in window <span style="color:red"><b>(B)</b></span> can be viewed 

D)	The **Integration Explorer** Window <span style="color:red"><b>(D)</b></span> is where you can view and manage deployed  assets (for example Applications and Message flows). Note assets are deployed to Integration Servers that are optionally managed by an Integration Node. When they are managed by an integration node the integration servers will appear “under” an integration node in this view. When not managed by an integration node they will be found under the “**Integration Servers**” view in this window.    

4\. In the **Integration Explorer** window <span style="color:red"><b>(D)</b></span> right click on Integration Servers and select “Create a local Integration Server”: 

![alt text][pic4]

5\. Accept the defaults in the “***Create and start a local Integration Server***” window and select Finish: 

![alt text][pic5]

This will trigger a process to configure a **\<local>** integration server (not managed by a node) and to start it. 

Note: the default port for Administration of the server is 7600. Since the “**Find a currently available port for REST administration**” is ticked, the process will add one to this port number until an available port is found (*this is also the logic for the HTTP Port and JVM Debug Port*). 

6\. On successful start of the local Integration Server you will see a message similar to the following. **\<Before>** dismissing the message, note the location of the console.log file.

**Note** If using the POT VDI defaults then the location will be this /home/student/IBM/ACET12/workspace/TEST_SERVER/console.log

![alt text][pic6]

7\. A connection to your new local Integration Server will appear in the Integration Explorer window – the green arrow (pointing upwards) to the left of the server name indicates that the server is running: 

![alt text][pic7]

The local Integration Server should be started (if the server isn’t started there is likely to be a problem with the default ports configured in your server.conf.yaml) 

[pic0]: images/0.png
[pic1]: images/1.png
[pic2]: images/2.png
[pic3]: images/3.png
[pic4]: images/4.png
[pic5]: images/5.png
[pic6]: images/6.png
[pic7]: images/7.png

# 2.2 Stopping and starting a local integration server <a name="stopping_and_starting_a_local_integration_server"></a>

In this section you see different ways of how a local Integration Server can be stopped stopped and started.

## 2.2.1 Using Integration Toolkit <a name="using_integration_toolkit"></a>

1\. The integration server that you created in the previous section will be up and running (it will have a green arrow facing upwards in the Integration Explorer window. Right click on the server name and select Stop (this will stop the integration server): 

![alt text][pic8]

2\. A message will appear explaining that the integration server is shutting down: 

![alt text][pic9]

3\. When the integration server has shutdown, the **Integration Explorer** will show the TEST_SERVER with a red arrow pointing downwards: 

![alt text][pic10]

4\. In the **Integration Explorer** right click on the integration server and **\<note>** the option to start the integration server.

![alt text][pic11]

[pic8]: images/8.png
[pic9]: images/9.png
[pic10]: images/10.png
[pic11]: images/11.png

## 2.2.2 Using the Administration REST API <a name="using_the_administration_rest_api"></a>

IBM App Connect Enterprise has an extensive administration REST API that enables you to control running Servers as well as server objects and resources. In this next section you see how to review the API documentation and get details of a running local integration server using this REST API. 

1\. Using the Integration Explorer, Start TEST_SERVER (check the arrow is green and facing upwards): 

![alt text][pic12]

2\. Open a Firefox browser window and go to the following URL: [http://localhost:7600/apidocs](http://localhost:7600/apidocs)

![alt text][pic13]

3\. Note the API operations on the left of the window with details of the right. 

Use the filter to show the operations relating to <span style="font-weight: 100">shutdown</span> and select the resulting **GET/apiv2** operation to show the details of the API operation: 

![alt text][pic14]

Note the **Example request** and **Responses**.

4\. Click curl in the **Example request** to see examples of how to call the operation using different methods: 

![alt text][pic15]

For example **python**:

![alt text][pic16]

5\. Click the “**Try it**” tab and then select the **Send** button (this will send the API request to the administration port on TEST_SERVER. The integration server will then shutdown: 

![alt text][pic17]

6\. You will see the request that was sent followed by the server’s response at the bottom of the “**Try it**” web page: 

![alt text][pic18]

In this section you have seen how to create a local integration server from within Integration Toolkit and various options to manage integration server using the administration REST API. 

[pic12]: images/12.png
[pic13]: images/13.png
[pic14]: images/14.png
[pic15]: images/15.png
[pic16]: images/16.png
[pic17]: images/17.png
[pic18]: images/18.png
[pic19]: images/19.png
[pic20]: images/20.png

# 2.3 Putting integration servers to work! <a name="putting_integration_servers_to_work"></a>

You now have a integration servers running: TEST_SERVER running with defaults settings; You will now review a very simple application called PING_Basic and deploy it to integration servers you have running in your environment. 

Now download the **PING_Basic_PoT_PIF.zip** 
    Click here and save the zip file - [PING_Basic_PoT_PIF.zip](PING_Basic_PoT_PIF.zip)

## 2.3.1 Import PING_Basic <a name="import_ping_basic"></a>
PING_Basic is a very simple application that you will now use to see an application running on the servers you have created. In this next section you will import the application into your workspace so that you can review what it will do. 

1\. With your mouse right click on the background of the Application Development window and select “**Import**”

![alt text][pic21]

2\. Select **IBM Integration > Project Interchange** then click the Next button:  

![alt text][pic22]

3\. Use the browse button to import the file <span style="font-weight: 100">PING_Basic_PoT.zip</span> from where you had downloaded it. 

Click **Finish**:

![alt text][pic23]

4\. The **PING_Basic** Application will be imported into your workspace, expand the application to see the message flow: 

![alt text][pic24]

[pic21]: images/21.png
[pic22]: images/22.png
[pic23]: images/23.png
[pic24]: images/24.png

## 2.3.2 Review PING_Basic <a name="review_ping_basic"></a>

1\. Double click on basicflow.msgflow, this will open the message flow in window <b><span style="color: red">(B)</span></b>. This flow has two paths.   For this lab we will be focused on the HTTP Input.

![alt text][pic25]

2\. Double click on the node called “Compute” to see the data that will be returned from the http request when the message flow is called: 

The flow will return the following: 

<span style="color:#E1C4D8">Set</span> <span style="color:#3F3FBF">OutputRoot.JSON.Data.pingbasic.Server = ExecutionGroupLabel</span>;

<span style="color:#E1C4D8">Set</span> <span style="color:#3F3FBF"> OutputRoot.JSON.Data.pingbasic.WorkPath = WorkPath</span>;

<span style="color:#E1C4D8">Set</span> <span style="color:#3F3FBF"> OutputRoot.JSON.Data.pingbasic.MsgFlow = MessageFlowLabel</span>;

<span style="color:#E1C4D8">Set</span> <span style="color:#3F3FBF"> OutputRoot.JSON.Data.pingbasic.DateTime</span> = <span style="color:#E1C4D8">CURRENT_TIMESTAMP</span>;

ie The **server name** that the flow is running on;the **WorkPath** of the server; the **message flow name**; the **current time** stamp;  

3\. Close the esql editor and the message flow without making any changes: 

![alt text][pic26]

[pic25]: images/25.png
[pic26]: images/26.png

## 2.3.3 Deploy PING_Basic

1\. Right click on the **PING_Basic** application and select **Deploy**. 

![alt text][pic27]

[pic27]: images/27.png


2\. When prompted to choose an integration server, deploy the application to **TEST_SERVER**. 

![alt text][pic28]

[pic28]: images/28.png

3\. Review the deploy messages and dismiss the Progress information window by pressing the close button (*note this new window in FP8 is very useful if you receive errors on the deploy*):

![alt text][pic29]

[pic29]: images/29.png

4\. The PING_Basic application will appear in the TEST_SERVER : 

![alt text][pic29a]

[pic29a]: images/29a.png

## 2.3.4 Test PING_Basic <a name="test_ping_basic"></a>

1\. Open a new tab in your Firefox browser window, and go to the followin URL:

[http://localhost:7800/PING_Basic](http://localhost:7800/PING_Basic)

the request should return details of TEST_SERVER: 

![alt text][pic30]

[pic30]: images/30.png

## 2.3.5 Build PING_Basic BAR file <a name="build_ping_basic_bar_file"></a>
Create a BAR file in order to deploy the solution to the Cloud Pak for integration server

1\. In the ACE Toolkit, right click on the Application Development window and select **New> BAR file**. Call the BAR file **PING_BasicBAR**. Click Finish to create the BAR file.

2\. When the BAR file editor opens, select the **PING_Basic** Application, select the compile and in-line resources, then click “**Build and Save**”:

![alt text][pic31]

3\. Ensure the build completes successfully and dismiss the message:

![alt text][pic32]

4\. Save the bar file you build.  We will upload this to the Cloud Pak for Integration in the next lab. 

![alt text][pic33]

[pic31]: images/31.png
[pic32]: images/32.png
[pic33]: images/33.png

# 3. Deploy the BAR file to Cloud Pak for Integration <a name="deploy_the_bar_file_to_cp4i"></a>

With the Toolkit you can build powerful and complex integration applications, services, and APIs quickly and easily using a visual designer. Your integration solutions can be directly deployed to the Cloud Pak for Integration on IBM Cloud Pak running on-premises, in any cloud, or combinations of both. 

In this next section you will deploy the PING_Basic bar file created and tested in the toolkit in the last section to the Cloud Pak for Integration.  

1\. Open a Firefox browser window and enter the Cluster Homepage that was provided to you by the instructor.   The URL will take you to the CP4I Platform Navigator.  
The URL should look similar to this one which is to the chopper cluster:
https://cpd-cp4i.apps.**chopper**.coc-ibm.com/zen/#/homepage

2\. Select the Enterprise LDAP:

![alt text][pic34]

3\. When prompted use the username and password provided to you for this lab. 
In this example we are using **chopper9**. 

![alt text][pic35]

4\. This is the **CP4I Platform Navigator** page and shows all the capabilities  that are installed:

In the upper right corner click on the icon to see who you are logged in as. Then we will select the **Integration Dashboard**

![alt text][pic37]

5\. This will take you to the IBM App Connect Dashboard Home page.  Select the ***Create a server tile***

![alt text][pic39]

6\. This will take you to the first step of creating an integration server.  We will select the Toolkit integration and clidk Next: (***We will cover the Designer Integration in other labs***)

![alt text][pic40]

7\. We will now select our BAR file either by drag and drop it or upload it.  Then click **next**

![alt text][pic41]

8\. The next page is for any configurations that need to be applied to the integration server.  For this one just click “**Next**”

9\. Now we will use the UI to set all the details for this integration server.
We will set the name to **is-toolkit1**, **Replicas** to **1** and then select **Create**

![alt text][pic42]

10\. This will take you to the Servers page.   You will see the integration server we just created and it will show Unavailable till the containers are started. 
After a little bit refresh the page.  Once the server is up and running it will show as <span style="color: green">**Started**</span> 

**Note:** This will take a few minutes to spin up the needed containers so move on to the next section and we will login to the OCP console to get the route to our service. 

![alt text][pic43]

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

## 3.1 Test PING Basic flow on CP4I <a name="test_ping_basic_flow_on_cp4i"></a>

We will now test the PING_Base flow we just deployed to CP4I in the Integration Server.  First we will need to get the route to our service from the OCP console.

[//]: # (<span style="color: red">*** **Note a request to make the url available from the ACE dashboard was made 2/18/2021** ***</span>)
[//]: # (<span style="color: red">*** **For now we need to find the route from the OCP console to be used.** ***</span>)

1\. Open a Firefox browser window and enter the OCP console URL provided to you by the instructor.  
This is an example for the chopper cluster
The URL should look similar to this one which is to the chopper cluster:
https://console-openshift-console.apps.**chopper**.coc-ibm.com/dashboards 

2\. When prompted use the username and password provided to you for this lab. 
In this example we are using **chopper1**. 

![alt text][pic34a]

3\. Now you will be in the OCP console for your userid.  On the left side menu click on the Networking drop down and select routes.  Make sure you userid (Project) is correct in the top.  In this example it is chopper1.
Scroll down to find your new server you created **is-toolkit-http** and click on that.  

![alt text][pic34b]

4\. Now once you are in the Route page you will see the **Location** which is what you will use to call the service.  Click on the copy next to the Location address to save it. 

![alt text][pic34c]

5\. You can go back to the App Connect Dashboard and check that the service is up and running.  

![alt text][pic34d]

6\. Now open a new firefox browser window and enter the the route address for you for your service you saved and append **PING_Basic** to it and enter.  

**Note** in the example we are using chopper1.

![alt text][pic34e]

7\. You should see something simialr to the following:

![alt text][pic44]

[pic34a]: images/34a.png
[pic34b]: images/34b.png
[pic34c]: images/34c.png
[pic34d]: images/34d.png
[pic34e]: images/34e.png
[pic44]: images/44.png
   
[Return to main lab page](../index.md)

# <span style="color:teal">END OF LAB GUIDE</span>
