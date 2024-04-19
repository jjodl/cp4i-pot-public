# Generating credentials for Designer connectors on CP4i

[Return to main lab page](../index.md)

## Service Now Connector


Pre-requisite: Download and Install [Postman](https://www.postman.com/) app

To get started you will require admin level access to your ServiceNow account. If you want to create a free ServiceNow account to test out App Connect, you’ll have to register for a ServiceNow Account for the Developer Site. Once your account is activated, you can request a ServiceNow personal developer instance.

![alt text][pic9]

Search for Registry in Filter navigator search bar and then select Application Registry

![alt text][pic10]

Click "New" and create an OAuth API endpoint for external clients
![alt text][pic11]

![alt text][pic12]

In the config panel give it a unique name and hit submit
![alt text][pic13]

This will create a new OAuth endpoint with Client ID and Client Secret generated. You can view these details by clicking and viewing the new endpoint.

Save Client ID and Secret for future use.

Inside your Oauth endpoint we now need to make few updates to make it work with Postman so that we can generate access tokens.

Insert Postman url: https://www.getpostman.com/oauth2/callback in Redirect URL field.

Also, increase Access Token Lifespan to same as Refresh Token Lifespan.

![alt text][pic14]

Click on Update button to save the changes. Now, open Postman app on your machine.
![alt text][pic15]

Create a new Collection with a new API request. Go to the collections tab and click **Create Collection**

![alt text][pic16]

Click on the drop-down arrow next to new collection. 

![alt text][pic17]

Then click **Add a Request**

![alt text][pic18]

Select HTTP request method as GET and use HTTP URL as below: https://&lt;your URL&gt;/api/now/table/incident. YourURL can be found when you are signed into your ServiceNow developer account. Typically this URL will be in the following format: https://devXXXXX/service-now.com

![alt text][pic19]

![alt text][pic20]


Now click on Authorization to config auth parameters. Set Auth type to OAuth 2.0

![alt text][pic21]

Configure GET NEW ACCESS TOKEN panel with following details:
* **Token Name** – any unique name
* **Grant Type** – Authorization Code
* **Callabck URL** – https://www.getpostman.com/oauth2/callback (same as the one you inserted in OAuth endpoint in ServiceNow)
* **Auth URL** - https://<your ServiceNow URL>/oauth_auth.do
* **Access Token URL** - https://<your ServiceNow URL>/ oauth_token.do 
* **Client ID** – As generated in above steps
* **Client Secret** – As generated in above steps
* **Scope** – useraccount
* **State** – 1
* **Client Authentication** – Send as Basic Auth header

![alt text][pic22]

Click on **Get New Access Token** and it will kick start OAuth web dance. You will require your admin username/password to authenticate yourself with web dance. Note: this log in is different from your developer user and password

![alt text][pic23]


![alt text][pic24]


Once through click on Allow and it will give you Access Token and Refresh Tokens generated for you. Store them for future use.


![alt text][pic25]

[Return to main lab page](../index.md)

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
[pic22]: images/22.png
[pic23]: images/23.png
[pic24]: images/24.png
[pic25]: images/25.png
