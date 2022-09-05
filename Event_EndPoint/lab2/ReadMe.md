
# IBM Cloud Pak for Integration - Flight Landing Events Simulator

In this lab, students will go through steps on how to simulate flight landing events, and consume the events using Kafka Client programs. <br>

[Return to main EEM lab page](../index.md#lab-abstracts)

# 1. App Connect Toolkit

## Flight landing event generator Message Flow

This is a simple App Connect Toolkit Flow to generate Flight Landing events.<br>

Download the **AsyncApi_Toolkit_PIF.zip** <br>
    Click here and save the zip file - [AsyncApi_Toolkit_PIF.zip](../source/project-interchange/AsyncApi_Toolkit_PIF.zip)

![](../images/ace-flight-landing-event-simulator.png)

<br>
Import Project Interchange AsyncApi_Toolkit_PIF.zip into App Connect Toolkit File > Import > Project Interchange > Select AsyncApi_Toolkit_PIF.zip from the Downloads folder.
<br><br>

#### Modify TOPIC name with yours Topic name.<br>

![](../images/ace-fl-simulator-kafkatopic.png)

<br>

#### Kafka Policy


![](../images/ace-es-policy.png)

<br>
Update bootstrap url with yours saved in  Notepad.
<br><br>
Save the policy <br><br>

#### Export the policy as a zip file, save to Downloads folder.

![](../images/ace-es-policy-export.png)
<br><br>


# 2. App Connect Enterprise Dashboard

From Cloud Pak for Integration Platform Navigator, open App Connect Dashboard.<br><br>

Navigate to Configuration Icon on the left panel, and click Configuration.<br>

![](../images/acedb-configurations.png)

Click "Create Configuration"<br>

#### Event Streams Policy Project configuration
![](../images/acedb-es-policy-configuration.png)

#### Truststore configuration
![](../images/acedb-es-cert-jks.png)

#### setdbparms.txt configuration
![](../images/acedb-setdbparms.png)

<br>

## Deploying the BAR (Broker Archive) file
Navigate to "Create Server" from the "Servers" Icon on the left panel. <br>
Select "Small Integration" tile. <br>
![](../images/ace-toolkit-barfile.png)

Drag and drop the bar file from Toolkit to ACE Dashboard "Create Server" wizard as below.<br>
![](../images/acedb-barfile-deployment.png)

<br>
Next
<br>

![](../images/acedb-barfile-configurations.png)

Search for "es-" configurations. <br>
Select all es-policy, es-setdbparms, es-cert.jks configurations, and Hit Next <br>
![](../images/acedb-barfile-deployment-finalscreen.png)

<br>
Wait for few minutes for the Integration Server to be ready.<br>
<br>
<br>
<br>


# 3. Event Streams Console - Verify Flight Events

From the Cloud Pak for Integration Platform Navigator, open Event Streams Console.<br>

Open STUDENT00.FLIGHT.LANDINGS, and verify if the Flight Landing Evennts are being generated as below. <br><br>
![](../images/es-flight-landing-events.png)
<br>
<br>
<br>


[Return to main EEM lab page](../index.md#lab-abstracts)
