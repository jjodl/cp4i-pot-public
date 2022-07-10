# Generating credentials for Designer connectors on CP4i

[Return to main lab page](../index.md)

## Service Now Connector


To get started you will require admin level access to your ServiceNow account. If you want to create a free ServiceNow account to test out App Connect, you’ll have to register for a ServiceNow Account for the Developer Site at https://developer.servicenow.com . Once your account is activated, you can request a ServiceNow personal developer instance.

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

Also, increase Access Token Lifespan to same as Refresh Token Lifespan.

![alt text][pic14]

Click on Update button to save the changes. 
* Save the Client id and the Client Secret to be used in App Connect to connect the smart connector to your instance. 

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
