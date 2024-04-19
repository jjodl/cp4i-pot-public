
# IBM Cloud Pak for Integration - Creating AsyncAPI

In this lab you will import the AsyncApi definition of STUDENTxx.FLIGHT.LANDINGS that you exported in the previous lab. After importing, you will create a Product and Publish.<br>

<br>

# 1. Api Connect Manager

From the IBM Cloud Pak for Integration Platform Navigator, open IBM Api Management Console. <br>

## 1.1 Import AsyncApi definition

From the Home page select "Develop APIs and products" > \<Add\> button > API option.<br>

![](./images/eem-async-4.png)

![](./images/eem-async-5.png)


![](./images/eem-async-6.png)

Click \<Next\>  \<Next\> \<Next\> 

![](./images/eem-async-7.png)

You have successfully imported AsyncApi into IBM Api Connect. <br>


## 1.2 Create Product

![](./images/eem-async-8.png)


![](./images/eem-async-9.png)

![](./images/eem-async-10.png)

Click \<Next\>  \<Next\> \<Next\> \<Done\>, that should publish the AsyncApi into the IBM Api Connect Developer Portal.<br>


## 1.3 Publish Product

Now, publish the AsyncApi's product to the IBM Api Connect Developer Portal, and to the IBM Event Gateway.

![](./images/apic-stage-product-1.png)

![](./images/apic-stage-product-2.png)

![](./images/apic-stage-product-3.png)

Navigate to API Manager Home (Home Icon on top left) --> Manage Catalogs, select Sandbox Catalog.

Publish the Product to APIC Developer Portal, and Event Gateway.

![](./images/apic-publish-product-1.png)

![](./images/apic-publish-product-2.png)

<br>

# 2. Api Connect Developer Portal

Locate the developer portal Url, by navigating to API Manager Home (Home Icon on top left) --> Manage Catalogs, select Sandbox Catalog.

Click on "Catalog Settings" tab.
![](./images/apic-dev-portal-navigate.png)

Click on Portal tab on left panel, and copy the Portal URL.
![](./images/apic-dev-portal-link.png)


Signon to API Connect Developer Portal

![](./images/apic-dev-portal-signon.png)

![](./images/apic-dev-portal-1.png)


## 2.1 Subscribe to AsyncAPI

Select student00-asyncapis Product

![](./images/apic-dev-portal-subscribe-1.png)

![](./images/apic-dev-portal-subscribe-2.png)

![](./images/apic-dev-portal-subscribe-3.png)

*** IMPORTANT ***<BR> 
Copy and Save the Key (ClientId), and the Secret into Notepad. These will be used by the Async Client java application.

![](./images/apic-dev-portal-subscribe-4.png)

Select the new application that you just created.
![](./images/apic-dev-portal-subscribe-5.png)

![](./images/apic-dev-portal-subscribe-6.png)

<br><br>

<br><br><br>

<b> CONGRAGULATIONS !!! </b>
