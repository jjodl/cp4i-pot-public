# IBM Cloud Pak for Integration

## Collaboration and Asset Sharing with Cloud Pak for Integration Asset Catalog

[Return to main lab page](../index.md)

# 1. Introduction <a name="introduction"></a>

The purpose of this lab is to introduce you to the Asset Repository. The Asset Repository is a component of IBM Cloud Pak for Integration that allows the user to store, manage, retrieve and search integration assets within the IBM Cloud Pak for Integration and its capabilities.

Users of IBM Cloud Pak for Integration are able to use the Asset Repository to share Integration assets across the platform capabilities. Storing assets, such as JSON schemas, within this repository allows them to be accessed directly within the user interface of certain Integration capabilities. For example, an OpenAPI specification asset stored in the repository can be directly imported within the IBM API Connect user interface.

Assets can also be located in remote repositories, such as Git. This allows users to take advantage of the versioning capability offered by the remote repository. **Note:** Assets stored in a remote repository are read-only.

Users gain access to the Asset Repository through membership in one or more teams that have access to the repository.

# 2. Creating a Designer Flow in IBM Cloud Pak for Integration <a name="creating_a_designer_flow_in_cp4i"></a>

In this section, we will use App Connect Designer to create a simple flow that will be exposed as an API.

1\. From the browser go to the platform navigator home page and click on the **Inegration Instances** on the top.

![alt text][pic1]

2\. You will see all integration instances you have access to in your namespace.  Click on the **asset-repo-ai**

![alt text][pic2]

3\. Here you will now be in the Automation Asset Repo.   You will see all the App Connect template and you should see a **POT Hello World**.   The owner will depend on which cluster you are in.  This screen shot is from the palpatine cluster. 
Now click on the **Cloud Pak | Automation** in the upper left to go back to the homepage.

![alt text][pic3]

4\. Click on the App Connect Designer link to take you to the designer dashboard. 

![alt text][pic4]

5\.  Here we will see a tile to **Create a flow by describing an integration**.   Click on this tile. 

![alt text][pic5]

6\. You will now see a list of App Connect templates and you also have the option to enter text to **Describe your scenario**  This will use AI to try and build a flow for you.  In this lab we will just use the **POT Hello World** API.
Click on the **+** at the end of it. 

![alt text][pic6]

7\. This will import this API into your dashboard and open it up.  
From here click on the **Edit flow**

![alt text][pic6a]

8\. Now click on the **Response** to show the Response info for this API.  It should contain **Hello POT Students**
Let's change that to something like **Hello from student - palpatine2**

**Note:** Use your user id that you are using for the cluster.  This example is user palpatine2. 

Make sure you have a Name for your flow in the upper left corner
You should enter something with you id for example **POT Palpatine2 - Hello World** and when done click on **Done**

![alt text][pic7]

9\. Now click on the **Start** switch and once it starts you will see the Test option.   Click on **Test**

![alt text][pic8]

10\. Select the GET operation on the left and click on Try it.
Then click on Send and you should see the response that you updated in the API.

![alt text][pic9]

11\. Now stop the flow in the upper right corner and make sure to have a name with your userid in it. 
The Click on the left menu to go to the Dashboard. 

![alt text][pic10]

12\. Now click on the 3-dots for the flow and select **Share as asset**

![alt text][pic11]

13\. Now add Asset Name and anything in the Description.
When done click on **Share** 

![alt text][pic12]

14\. Now return to the platform navigator home page and click on the **Inegration Instances** on the top.

![alt text][pic1]

15\. Cick on the **asset-repo-ai**

![alt text][pic2]

16\. You will now be back to the Asset-repo.  You should now see your API that you just shared to the repo.  

![alt text][pic13]

[pic0]: images/0.png
[pic1]: images/1.png
[pic2]: images/2.png
[pic3]: images/3.png
[pic4]: images/4.png
[pic5]: images/5.png
[pic6]: images/6.png
[pic6a]: images/6a.png
[pic6b]: images/6b.png
[pic7]: images/7.png
[pic8]: images/8.png
[pic9]: images/9.png
[pic10]: images/10.png
[pic11]: images/11.png
[pic12]: images/12.png
[pic13]: images/13.png

#
# Congratulations!
You have completed the IBM Cloud Pak for Integration Asset Repository lab.

[Return to main lab page](../index.md)