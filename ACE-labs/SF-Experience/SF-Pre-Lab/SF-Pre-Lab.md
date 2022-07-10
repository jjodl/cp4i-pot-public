# Generating credentials for Designer connectors on CP4i

[Return to main lab page](../index.md)

## Salesforce Connector

To get started you will require admin level access to your Salesforce account. 
If you want to create a free Salesforce account to test, make sure that you create a Developer account rather than a Trial account. If you connect to App Connect with a Trial account, the Salesforce events do not work.
You will need a developer account to use for testing – if you already have a Salesforce developer account, you can use that – if not, you can sign up for a free developer account now.

**1.** Go to (https://developer.salesforce.com) and click on Sign up.

![alt text][pic0a]

**2.** As soon as you have your account, log in with your dev admin account.

![alt text][pic0]

**3.** To get your Salesforce integration URL, click on your **user profile**. The URL text below your Account Name is your login URL. **Copy/paste** it somewhere for later use in the labs.

![alt text][pic1]

**4.** Next, you need to retrieve Security Token. For this, click on your user profile and select the Settings option in the profile panel.

![alt text][pic2]

**5.** Under Settings, find and click the Reset Security Token option. Then click on Reset Security Token Button and it will send the newly generated security token to your email.

![alt text][pic3]

**6.** Next, you will retrieve the Client ID and Secret. Click the setup cogwheel at the top right.

![alt text][pic4]

**7.** On the left navigator, go to **PLATFORM TOOLS > Apps > App Manager.**

![alt text][pic5]

**8.** Now click on New Connected App button.

![alt text][pic6]

**9.** Enter **App Connect PoT** as Connect App Name and API Name is automatically generated for you.
Provide Contact Email usually admin email address.
And mark the **Enable OAuth Settings.** This will also show Enable for Device Flow marked as well.  
Connectors technically only require data api, for the POT labs we will choose to enable all the scopes for this connected app.
Go to the bottom of the page and then click on Save.

![alt text][pic7]

**10.** It may take several minutes for newly created Connected App to be registered. Once registered go back to Apps > App Manager and on the far right next to your connected app name click the drop down and select **View**

![alt text][pic8]

**11.** Here you can copy the Consumer Key and Secret.
Use Consumer Key and Secret as Client ID and Client Secret as needed in the connector template for the App Connect smart connector. 

![alt text][pic9]

[Return to main lab page](../index.md)

[pic0a]: images/0a.png
[pic0]: images/0.png
[pic1]: images/1a.png
[pic2]: images/2a.png
[pic3]: images/3a.png
[pic4]: images/4a.png
[pic5]: images/5a.png
[pic6]: images/6a.png
[pic7]: images/7a.png
[pic8]: images/8a.png
[pic9]: images/9a.png
