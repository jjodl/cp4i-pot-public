# API Connect Experience Prereq

[Return to main APIC lab page](../ReadMe.md#lab-prereq)

## 1. Add user to Common Services User Registry <a name="login"></a>

1\. In a browser, enter the URL for the Platform Navigator that is provided by your instructor.

**Note:** You may get a warning message that your connection is not private.  If you get this message, you can add an exception.  

2\. To add an exception in the Chrome browser, click **Advanced** and then click **Proceed** to the URL.

![alt text][pic1]

![alt text][pic2]

3\. To add an exception in the Firefox browser, click **Advanced** and then click **Accept the Risk and Continue**.

![alt text][pic3]

![alt text][pic4]

 4\. When prompted,  Select the **Enterprise LDAP**. use the username and password provided to you for this lab. The username in the screenshots of this lab is `cody1`.

![alt text][pic5]

5\. When you log in for the first time, you may see a **Welcome, let's get started** window.  Feel free to review the contents by clicking **Start the tour** or click on the **X** to close the window.
Then from the home page select the **apim-demo** under the API lifecycle management tile.

![alt text][pic6]

6\. When you log in for the first time to the API Manager you will use the **Techcon LDAP**.
Click on the Techcon LDAP and the login screen will open. 

![alt text][pic7]

7\. Now on the Login screen enter your assigned id and password and click **Log in**

![alt text][pic8]

8\. Now from the API manager home page on the left menu select the **Member** icon. 

![alt text][pic9]

9\. You will see your user id in the member list.   We will now select **Add** and pick **Add member**

![alt text][pic10]

10\. Now make sure the User registry shows **Common Services User Registry**  and select type of user **Existing**.

For the **Username**, enter your assigned id and select all boxes for **Assign roles** and click **Add**.

![alt text][pic11]

11\. You will now see the local member added to the local registry.   Click on the **X** to close notification window. 

![alt text][pic12]

12\. While working through the API Connect Experience labs, make sure you use the **Common Services User Registry** when asked to log in. This will also enable the co-authoring between App Connect and API Connect.   

![alt text][pic13]

[pic0]: images/0.png
[pic1]: images/1.png
[pic2]: images/2.png
[pic3]: images/3.png
[pic4]: images/4.png
[pic5]: images/5.png
[pic6]: images/6.png
[pic7]: images/7.png
[pic8]: images/8.png
[pic9]: images/9.png
[pic10]: images/10.png
[pic11]: images/11.png
[pic12]: images/12.png
[pic13]: images/13.png

---
## 2. Create Consumer Org user <a name="login"></a>


1\. To navigate to the API Management home page, click on the **Home** icon in the left navigation.

![alt text][pic7c]

2\. Click on the **Manage** icon in the left navigation or the **Manage catalogs** tile from the main page.

![alt text][pic1c]

3\. You will see your default Sandbox Catalog.   Click on the **Sandbox** tile. 

![alt text][pic2c]

4\. In the top menu, click **Consumers**.  

![alt text][pic8c]

5\. Click **Add** and select **Create organization**. 
 
![alt text][pic3c]

6\. Now from the **Create consumer organization** screen, add your info.  In this example, the user is **cody1**.  Make sure to use your assigned userid.

For the **Type of user**, select **New user**.

**Note:** For the password, you can use something simple like **passw0rd**.

When done, click **Create**.
 
![alt text][pic4c]
![alt text][pic5c]

7\. You will see your new Consumer Org and this will be used to access the Devloper Portal in API Connect. 

![alt text][pic6c]

[pic1c]: images/1c.png
[pic2c]: images/2c.png
[pic3c]: images/3c.png
[pic4c]: images/4c.png
[pic5c]: images/5c.png
[pic6c]: images/6c.png
[pic7c]: images/7c.png
[pic8c]: images/8c.png

[Return to main APIC lab page](../ReadMe.md#lab-prereq)
