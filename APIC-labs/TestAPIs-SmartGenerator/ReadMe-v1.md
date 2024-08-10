# API Connect Test APIs - Generate Tests using SmartGenerator

# 1. Overview

In this lab, you will explore "Test APIs" feature of IBM API Connect that generates API tests automatically. By using IBM Api Connect TestAPIs capability you can deliver high quality APIs consistently and improve developer productivity with automation and AI powered testing capabilities.
<br>
Reference: https://www.ibm.com/products/api-connect/api-testing

You will be using Customer Database Rest API deployed in Lab1 to App Connect Dashboard. <br>
<br> 

# 2. App Connect - Download Swagger document

From the Cloud Pak for Integration Platform Navigator, open App Connect Dashboard (student(n)-db). <br>

Click on the Runtimes.<br>
Select customerdatabase Integration Runtime, and click on the API, then "Download the OpenAPI Document" (yaml) as below.<br>
![Alt text](./images/cdb-openapi.png)

<br>
Lets adjust the OpenAPI document to conform to the specification that API Connect Test APIs feature is expecting!  <br>

Edit the downloaded yaml file. <br>

a) Append the below section above the schema: segement. Make sure it's aligned propertly.<br>
```
consumes:
  - application/json
produces:
  - application/json
```
![alt text](./images/image-35.png)


b) Make sure the /customers/post: operation is defined before the "get" operation. if not move the "post" operation segment before the "get" segment as below. <br>

![alt text](./images/image-36.png)



# 3. Api Connect - Test APIs

From the Cloud Pak for Integration Platform Navigator, open API Connect Manager (apim-demo). <br>

Click on the "Test APIs" tile. <br>

![Alt text](./images/image.png)

![Alt text](./images/image-2.png)

Click **"Create Test Suite"**. <br>

![Alt text](./images/image-3.png)

Test Suite name: student(n)-customerdatabase <br>
Description: student(n) customer database test suite.<br>

Click correct tick mark (on top right).<br>

![Alt text](./images/image-4.png)

Click on "Tests" Option.<br>

![Alt text](./images/image-5.png)
<br>
Click on **\<Add\>** to create a test. <br>

![Alt text](./images/image-6.png)
<br>
Enter customerdatabasev1_test1 and hit **continue**.<br>

![Alt text](./images/image-7.png)
Click \<Template from Specifications\> in the bottom middle option.<br>

![alt text](./images/image-7a.png)

Select "Swagger 2.0 YAML", and click on "drag a file here or click to upload", select downloaded yaml file (as below). <br>

![Alt text](./images/image-19.png)
Click **Save**. <br>

Click on the dropdown, and select /customerdb/v1/customers/{customerId} operation.<br>
![alt text](./images/image-19a.png)

Select "Smart Generator" circle as below, and click on the Tick mark on right of the window.<br>
![Alt text](./images/image-20.png)


That should generate a POST, GET, and DELETE operations as below.<br>
![Alt text](./images/image-21.png)

Now, add a variable "customerId" in between POST, and GET as below.<br>

Click on the (i) circle on the GET opeartion, and select "add component before".<br>

![Alt text](./images/image-22.png)

Click on "Set variable" circle.<br>

![Alt text](./images/image-23.png)

Set the variable name as customerId, and value as ${payload.id}. <br>

Confirm changes by clicking the Tick mark on top right of the Variable window.<br>

![Alt text](./images/variable.png)

Modify the DELETE operation. Set Authorization default secret <br>
![alt text](./images/image-37.png)
Click Edit of Authorization header field, and enter value "secr3t" as below and click the Correct symbol to save.<br>
![alt text](./images/image-38.png)

Click \<Save\> button on the top, and then click \<Run Test\>. <br>

![Alt text](./images/image-24.png)

![Alt text](./images/image-25.png)

Take the defaults, and hit \<Run Test\>, and that should generate a report as below.<br>

![Alt text](./images/image-26a.png)
![alt text](image.png)
![Alt text](./images/image-26b.png)


Review and Close the Report.<br>

Click on \<Save and Exit\> button on the top.<br>

![Alt text](./images/image-27.png)

![Alt text](./images/image-28.png)


NOW CLICK \<Publish\> button as below.<br>
![Alt text](./images/image-29.png)

Click on the Tests option on the top.<br>
![Alt text](./images/image-31.png)

Click on the 3 dots on the test CustomerDatabasev1_test1 as below, and click Run. You can hit Run few times.<br>
![Alt text](./images/image-32.png)

Click on the Dashboard on the top.<br>
![Alt text](./images/image-34.png)

Here you can see the tests that were ran, and results with Graphs.<br>
![Alt text](./images/image-33.png)



### Congratulations !!!

