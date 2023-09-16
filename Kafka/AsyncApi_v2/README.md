
# IBM Event Automation - Consuming Flight landing events through AsyncApi

AsyncApi's helps you to socialize the Kafka sources (Topics) as API's through IBM Event Gateway. These labs enables you an end-2-end event automation experience through the IBM Cloud Pak for Integration & IBM Event Automation products.

Architecture Diagram below <br>

![](./eem-component-diagram.png)

### Lab1: Work with IBM EventStreams
in this lab you will create Kafka Topic in IBM Event Streams, and capture Kafka Credentials.<br>

### Lab2: Work with IBM Event End Point Management (EEM)
In this lab you will,<br>
a) Link STUDENTxx.FLIGHT.LANDINGS topic from Event Streams into Event Endpoint Management. <br>
b) Export AsyncApi definition of STUDENTxx.FLIGHT.LANDINGS Topic. <br>
c) Extract Event Gateway Certificates to be used for Testing (lab5).<br>

### Lab3: Work with IBM Api Connect
In this lab you will,<br>
a) Create AsyncAPI, and a Product in IBM API Connect Manager. <br> 
b) Publish the Product & AsyncApi to API Connect Developer Portal.<br>
c) Subscribe to the AsyncApi from API Connect Developer Portal. <br>
<br>

### Lab4: Work with IBM App Connect
in this lab you will, <br>
a) Use IBM App Connect Toolkit and import Flight Landing Simulator Project.<br>
b) Review the Flight landing simulator flow, and modify Topic name <br>
c) Modify kafka policy's bootstrap url <br>
d) ReBuild the bar file <br>
e) Deploy the bar file to IBM App Connect Dashboard. <br>
<br>

### lab5: Consuming flight landing events
in this lab you will run kafka clients to consume the Flight landing events being produced in lab4. <br>


<br>

!!! CONGRATULATIONS !!!