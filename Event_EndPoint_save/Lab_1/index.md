## Multi-Style Integration with IBM Cloud Pak for Integration Event Endpoint Experience

[Return to main lab page](../index.md)

---

# Lab 1 - Create, Discover and Consume Event Driven APIs

## Pre-requisites
- Eclipse, IntelliJ, or any other IDE that can compile and run Java code
- Create a new Java project in your IDE
- Attach all the JAR dependencies from [jars.zip](https://github.ibm.com/velox/event-endpoint-labs/blob/master/Lab_1/assets/jars.zip) to the project's build path and class path
    ![](./images/image-22.png)

1.  Log into the Event Streams UI. Click **Connect to this cluster** perform the following steps:
    1. Note down the external listener URL for later user.
    1. Create SCRAM credentials. Note down the user and password generated for later use. 
    1. Download the cluster PEM file to your machine.
    ![](./images/image-42.png)

## The scenario

Acme Airlines has been getting complaints that there aren't enough taxis available at the airport when flights arrive full of passengers. Passengers are having to wait a long time to leave the airport.

They would like their customer relations team to build an application that will send a message to any taxis in the vicinity of the airport when a flight with a large number of passengers lands, offering drivers a voucher for a free coffee if they go to the airport and collect a passenger.

Acme Airlines have recently deployed an instance of IBM Event Endpoint Management to enable teams to publicise their event driven APIs as data sources alongside their existing RESTful APIs so that other teams can discover and use the APIs.

This lab will introduce how two personas can work together to solve the problem - an API developer who has been tasked with publicising the APIs available in the organisation, and an application developer who has been asked to write the application just to address the customer complaints.

You will use the API Manager feature in Event Endpoint Management to create and publicise new APIs. You will then use the Developer Portal feature to discover sources of data and APIs and use them to build an application.

## Publicising new APIs

Your teams has been building new APIs - including a Kafka Event Driven API for flight data, and a REST API that interacts with the taxi providers in the local area. Your job is to publicise these APIs in Event Endpoint Management so that other teams can connect and consume the APIs.

### Steps

1. Log into the API Manager UI
![](./images/image-1.png)

#### Document the Kafka event driven API

1. Click **Develop APIs and products > Add > AsyncAPI (from Kafka topic)**
    ![](./images/image-50.png)

1. Enter the following details:
    ```
    Title: Flight Landings
    Bootstrap servers: <Event Streams external listener URL> 
    Topic name: FLIGHT.LANDINGS
    Schema: <Upload assets/flights.avsc avro schema>
    Security protocol: SASL_SSL
    SASL mechanism: SCRAM-SHA-512
    SASL username: <Username from Event Streams> 
    SASL password: <Password from Event Streams> 
    Transport CA certificate <Event Streams PEM certificate>
    ```
    ![](./images/image-2.png)
    ![](./images/image-51.png)

1. A schema has been supplied to ensure that any App developer will have a documented message structure that they can use to build their apps. 
    
    A CA certificate is supplied so that the Event Gateway can securely communicate with the Kafka cluster.

1. Click **Next**

1. Leave this page unchanged. `Secure the API` is used to indicate that the AsyncAPI being created should be enforced via the Event Gateway with credentials. This ensures that the App developer consuming this API from the Developer Portal can generate their own credentials to access the API.
    ![](./images/image-52.png)
    Click **Next**

1. Click **Edit API**
    ![](./images/image-53.png)

1. This is the advanced editor - allowing you to add additional metadata. 
    ![](./images/image-54.png)
    
    Because we want to allow App developers to use a range of Kafka clients to consume the messages, we have configured our Kafka API to encode the messages in JSON.

    You now need to add the JSON content type for the message. On the left side of the editor, click **Channels > FLIGHT.LANDINGS > Operations > subscribe > message** and set `Content Type` to `application/json`. 
    ![](./images/image-55.png)
    
    Click **Save** then click **Develop** in the breadcrumb trail.

#### Document the Taxi Locator API

1. Click **Add > API (from REST, GraphQL or Soap)**

1. Click **OpenAPI 3.0 > From target service > Next**

1. Enter the following details:
    ```
    Title: Taxi Locator
    Target service URL: <Taxi Locator URL from assets/apis.txt>
    ```
    ![](./images/image-5.png)

1. Click **Next**. Leave the page unchanged. `Secure using Client ID` indicates that the API should be secured with credentials, the same as with the Kafka API earlier.
    ![](./images/image-4.png)

1. Click **Next**. Click **Edit API**

1. Using the Source view (`</>`) remove all operations other that `get` from the `paths` section. Click **Save**.
    ![](./images/image-56.png)

1. Add the following to the `get` operation to describe the API parameters:
    ```
    summary: Find taxis in a given location
    operationId: findTaxis
    parameters:
        - name: lat
        in: query
        description: latitude
        required: true
        schema:
            type: number
            format: double
        - name: lon
        in: query
        description: longitude
        required: true
        schema:
            type: number
            format: double
    ```
    Click **Save**
    ![](./images/image-57.png)

1. Replace the `type:string` in the `responses` with the following to describe the API response:
    ```
    type: object
      required:
        - taxis
      properties:
        taxis:
          type: array
          items:
            type: integer
            format: int32
    ```
    ![](./images/image-58.png)
    Click **Save** then click **Develop** in the breadcrumb trail.

#### Document the Taxi Messaging API

1. Create another OpenAPI 3.0 from a target service.

1. Use the following details:
    ```
    Title: Taxi Messaging
    Target service URL: <Taxi Messaging URL from assets/apis.txt>
    ```

1. Remove all paths except `post`. 
    ![](./images/image-59.png)

1. Add the following to the `post` section:
    ```
    summary: Send a message to taxi drivers
    operationId: taxiAlert
    requestBody:
      required: true
      content:
        application/json:
          schema:
            type: object
            required:
              - taxis
              - message
            properties:
              taxis:
                type: array
                items:
                  type: integer
                  format: int32
              message:
                type: string
    ```
    ![](./images/image-60.png)

1. Remove the `200` response. Replace with:
    ```
    "201":
      description: message sent
      content:
        application/json:
          schema:
            type: object
              required:
                - sent
              properties:
                sent:
                  type: string
    ```
    ![](./images/image-61.png)
    Click **Save** then click **Develop** in the breadcrumb trail.

#### Publishing the APIs

You will now publish these APIs to the Developer Portal for application developers to consume.

1. Click **Products** tab. Click **Add > Product**

1. Click **New Product > Next**
    ![](./images/image-9.png)

1. Name the product "Flights Data" and click **Next**
    ![](./images/image-10.png)

1. Select `Flight Landings` API and click **Next**
    ![](./images/image-11.png)

1. Use the "Default Plan" and click **Next**

1. Leave the page unchanged and click **Next** - the default settings allow any user of the Developer Portal to sign up to use the API.

1. Click **Done**

1. Create a new Product named "Taxis" containing the two Taxi APIs

1. Click the **Products** tab. Click the **three dots** next to `Taxis` and click **Publish**.
    ![](./images/image-12.png)

1. Click **Publish** to publish the Product to the Sandbox catalog. This will make the APIs available to application developers.

1. Now publish the "Flights Data" Product.
## Building the application

You've prepared the following rough outline for an app:

1. When a flight lands...
1. ...if there are more than 50 passengers on the flight...
1. ...get a list of taxis near the aiport...
1. ...and send the following message to those taxis:
    >"Acme Air flight XXXXX has just landed with lots of passengers. Please can you go to Terminal XXX at the airport. If you pick up a fare from the flight, we will credit your app with a voucher for a free coffee to say thank you."

### Useful information for the app

#### Location of the airport

`latitude: 51.027`

`longitude: -1.399`

#### Endpoints and APIs to use

- Flight Landings
  - An event driven API that publishes events every time a flight lands.
- Taxi Locator
  - A REST API you can call to get a list of taxis in the area.
- Taxi Messaging
  - A REST API you can call to send a message to a list of taxis.

### Accessing the Developer Portal
1. From the EEM Api Manager UI, click **Manage** in the left bar. 

    Click **Sandbox**. Click the **Catalog setttings** tab and select **Portal**. The `Portal URL` will link to the Developer Portal.
    ![](./images/image-13.png)

### Steps

1. Go to the Developer Portal and click **Create account**.
    ![](./images/image-14.png)

1. Fill in the form and click **Sign up**.
    ![](./images/image-44.png)
    Your account is created and you will need to activate your account.
    ![](./images/image-45.png)

1. Check your email for activation instructions. Click the activation link in the email when you get it, and then sign into the Developer Portal.
    ![](./images/image-46.png)

#### Create an Application

In order to access the APIs in the Developer Portal you will need to create an Application in the Developer Portal. An Application is used to manage permissions and credentials for your external Applications.

1. After signing in, click the **Create a new App** button.
    ![](./images/image-47.png)

1. Enter a name for your new app and then click **Save**.
    ![](./images/image-48.png)

1. Make a note of your API Key and Secret. You can copy them by using the copy icon next to each field.
    - **Important:** Ensure you do this now. You will not be able to retrieve the Secret again later.
    ![](./images/image-49.png)

#### Grant your Application access to the flight landings endpoint

1. Click the **API Products** link in the menu bar.

1. Click the **Flights Data** product for APIs related to flights.

1. Click the **Flight Landings** API.
    ![](./images/image-15.png)

1. Before you can access the API, you need to associate your application with the API. 
    Click the **Get Access** button in the top-right. 
    ![](./images/image-16.png)

1. Click the **Select** button on the **Default Plan** tile.
    ![](./images/image-17.png)

1. Click the name of your application.
    ![](./images/image-18.png)

1. Click **Next**. 
    ![](./images/image-19.png)

1. Click **Done**. 
    ![](./images/image-20.png)

1. Click the `FLIGHT.LANDINGS` topic on the left to expand the menu, then click **Subscribe (operation)**.
    ![](./images/image-21.png)

1. Click **Download schema** and save to the root of your Java project.

1. Click the copy icon in the Java template to copy the Java code to your clipboard.

1. Go to your IDE and paste the code snippet into a new class called `SampleApplication.java`.

1. Find the placeholder `<SASL_password>` in the sample code, and replace it with the Secret that was generated for your Application.
    - **Note:** This is the Secret that was created earlier when [creating the app](#create-an-application). The username has been automatically templated in for you.
    ![](./images/image-23.png)

#### Test that your Java application can consume flight information data

1. In your IDE, find the line of code in the sample that says `// Do something with your record` and update it as follows:
    ```java
    // Do something with your record
    String flightnumber = ((Utf8) genericRecord.get("flight")).toString();
    String terminal = ((Utf8) genericRecord.get("terminal")).toString();

    int numPassengers = (int) genericRecord.get("passengers");

    System.out.println("DEBUG: A flight has landed!");
    System.out.println(" flight number: " + flightnumber);
    System.out.println(" terminal: " + terminal);
    System.out.println(" number of passengers: " + numPassengers);
    ```
    ![](./images/image-24.png)

1. Add the following imports to the top of the class:
    ```java
    import org.apache.kafka.common.config.SslConfigs;
    import org.apache.avro.util.Utf8;
    ```

1. Add the following as a static variable in the class:
    ```java
    static final String TRUSTSTORE = "/path/to/Lab_1/assets/gateway.p12";
    ```
    ![](./images/image-25.png)

1. Add the following code to the list of properties in your
    `main` method:
    ```java
    props.put(SslConfigs.SSL_TRUSTSTORE_LOCATION_CONFIG, TRUSTSTORE);
    props.put(SslConfigs.SSL_TRUSTSTORE_PASSWORD_CONFIG, "passw0rd");
    props.put(SslConfigs.SSL_TRUSTSTORE_TYPE_CONFIG, "PKCS12");
    props.put(SslConfigs.SSL_ENDPOINT_IDENTIFICATION_ALGORITHM_CONFIG,"");
    ```

1. Run your code and observe the output. Your application should start receiving a stream of events about flight landings.
    ![](./images/image-x.png)

1. Stop your application.

#### Subscribe your application to Taxi location information

1. Go to the Developer Portal, and click the **API Products** link in the menu bar again.

1. Click the **Taxis** product.
    ![](./images/image-26.png)

1. Find and click the API called **Taxi locator**.

1. Click the **Get Access** button in the top right.
    ![](./images/image-27.png)

1. Click the **Select** button on the **Default Plan** tile.

1. Click the name of your application.

1. Click **Next**.

1. Click **Done**.

1. Click the **GET /** link on the left.
    ![](./images/image-28.png)

1. Click the **Try it** tab. 
    ![](./images/image-29.png)

1. Enter the location of the [airport](#location-of-the-airport) and click **Send**.
    ![](./images/image-30.png)
    **Note:** If you see a CORS error message, open the link displayed in a new tab to correct this and retry **Send**

1. Check the list of identifiers for taxis that are currently in the area.
    ![](./images/image-31.png)

#### Configure your app to use the list of taxis

1. Return to your IDE and the following imports to the top of the `SampleApplication.java` class:
    ```java
    import org.apache.hc.client5.http.classic.methods.HttpGet;
    import org.apache.hc.client5.http.impl.classic.CloseableHttpClient;
    import org.apache.hc.client5.http.impl.classic.CloseableHttpResponse;
    import org.apache.hc.client5.http.impl.classic.HttpClients;
    import org.apache.hc.client5.http.impl.io.PoolingHttpClientConnectionManager;
    import org.apache.hc.client5.http.socket.ConnectionSocketFactory;
    import org.apache.hc.client5.http.ssl.NoopHostnameVerifier;
    import org.apache.hc.client5.http.ssl.SSLConnectionSocketFactory;
    import org.apache.hc.client5.http.ssl.TrustSelfSignedStrategy;
    import org.apache.hc.core5.http.HttpEntity;
    import org.apache.hc.core5.http.config.RegistryBuilder;
    import org.apache.hc.core5.http.io.entity.EntityUtils;
    import org.apache.hc.core5.ssl.SSLContextBuilder;
    import org.apache.hc.core5.ssl.SSLContexts;
    import org.json.JSONArray;
    import org.json.JSONObject;
    import javax.net.ssl.SSLContext;
    ```

1. Add the following methods to the class. Replace `<GET_URL>` with the URL displayed in the Developer Portal (`https://<path>/sandbox/taxi-locator`).
    ```java
    private static CloseableHttpClient createClient() throws Exception {
        SSLContextBuilder sslcontextbuilder = SSLContexts.custom();
        sslcontextbuilder.loadTrustMaterial(new File(TRUSTSTORE), "passw0rd".toCharArray(), new TrustSelfSignedStrategy());

        SSLContext sslContext = sslcontextbuilder.build();

        PoolingHttpClientConnectionManager cmgr = new PoolingHttpClientConnectionManager(
            RegistryBuilder.<ConnectionSocketFactory>create()
            .register("https", 
                new SSLConnectionSocketFactory(sslContext, NoopHostnameVerifier.INSTANCE)
            ).build()
        );

        return HttpClients.custom().setConnectionManager(cmgr).build();
    }

    public static JSONArray findTaxis() throws Exception {
        CloseableHttpClient httpClient = createClient();
        HttpGet request = new HttpGet("https://<GET_URL>?lat=51.027&lon=-1.399");
        request.addHeader("X-IBM-Client-Id", "YOUR API KEY HERE");

        CloseableHttpResponse response = httpClient.execute(request);
        HttpEntity responseEntity = response.getEntity();

        String responseString = EntityUtils.toString(responseEntity);
        JSONObject responseObject = new JSONObject(responseString);
        JSONArray taxiIds = responseObject.getJSONArray("taxis");

        return taxiIds;
    }
    ```
    ![](images/image-32.png)

1. Replace the `X-IBM-Client-Id` value with your API Key.
    -   **Note:** This is the API Key that was created earlier when [creating the app](#create-an-application).

1. Update your `// Do something with your record` code so that it gets a list of taxis every time a flight with more than 50 passengers lands.
    ```java
    // Do something with your record
    String flightnumber = ((Utf8) genericRecord.get("flight")).toString();
    String terminal = ((Utf8) genericRecord.get("terminal")).toString();

    int numPassengers = (int) genericRecord.get("passengers");

    System.out.println("DEBUG: A flight has landed!");
    System.out.println(" flight number: " + flightnumber);
    System.out.println(" terminal: " + terminal);
    System.out.println(" number of passengers: " + numPassengers);

    if (numPassengers > 50) {
        JSONArray nearbyTaxiIds = findTaxis();
        System.out.println("DEBUG: Taxis that are currently in the area: ");
        System.out.println(nearbyTaxiIds);
    }
    ```
    ![](images/image-62.png)

1. Run your code and observe the output.
    -   **Note:** Your app will start by receiving and processing all the events it has missed since running it earlier.
    ![](images/image-37.png)

#### Test the taxi alerts

1. Return to the Developer Portal and click the **API Products** link in the menu bar.

1. Go to the **Taxis** product.

1. Click the API called **Taxi Messaging**.
    ![](./images/image-33.png)

1. Click **POST /** on the left.
    ![](./images/image-34.png)

1. Click the **Try it** tab. 
    ![](./images/image-35.png)

1. Copy and paste the following into the **body** (or click **Generate**) text box to try the API out:
    ```json
    {
        "taxis": [
            1234
        ],
        "message": "Hello World"
    }
    ```

1. Click **Send**.
    ![](./images/image-36.png)

#### Configure your app to send alerts to nearby taxis

1. Go to your IDE and the following imports to the top of your class:
    ```java
    import org.apache.hc.client5.http.classic.methods.HttpPost;
    import org.apache.hc.core5.http.io.entity.StringEntity;
    ```

1. Add the following method to the class. 

    Replace `<POST_URL`> with the URL from Developer Portal. 
    
    Replace the `X-IBM-Client-Id` value with your API Key.
    -   **Note:** This is the API Key that was created earlier when [creating the app](#create-an-application).
    ```java
    public static JSONObject sendTaxiAlert(JSONArray taxiIds, String message) throws Exception {

        CloseableHttpClient httpClient = createClient();
        HttpPost request = new HttpPost("<POST_URL>");

        request.addHeader("X-IBM-Client-Id", "YOUR API KEY HERE");
        request.addHeader("Content-Type", "application/json");

        JSONObject requestPayload = new JSONObject();
        requestPayload.put("taxis", taxiIds);
        requestPayload.put("message", message);

        request.setEntity(new StringEntity(requestPayload.toString()));

        CloseableHttpResponse response = httpClient.execute(request);
        HttpEntity responseEntity = response.getEntity();
        String responseString = EntityUtils.toString(responseEntity);
        JSONObject responseObject = new JSONObject(responseString);

        return responseObject;

    }
    ```
    ![](./images/image-37.png)

1. Update your `// Do something with your record` code so that it sends a message to the list of taxis:
    ```java
    // Do something with your record
    String flightnumber = ((Utf8) genericRecord.get("flight")).toString();
    String terminal = ((Utf8) genericRecord.get("terminal")).toString();

    int numPassengers = (int) genericRecord.get("passengers");

    System.out.println("DEBUG: A flight has landed!");
    System.out.println(" flight number: " + flightnumber);
    System.out.println(" terminal: " + terminal);
    System.out.println(" number of passengers: " + numPassengers);
    if (numPassengers > 50) {
        JSONArray nearbyTaxiIds = findTaxis();
        System.out.println("DEBUG: Taxis that are currently in the area: ");
        System.out.println(nearbyTaxiIds);

        String voucherMessage = "Acme Air flight " + flightnumber +
        " has just landed with lots of passengers. " +
        "Please can you go to Terminal " + terminal + " at the airport. " +
        "If you pick up a fare from the flight, we will credit your app " +
        "with a voucher for a free coffee to say thank you.";

        JSONObject sendOutput = sendTaxiAlert(nearbyTaxiIds, voucherMessage);
        System.out.println("DEBUG: Sent message: ");
        System.out.println(sendOutput);
    }
    ```
    ![](./images/image-39.png)

1. Run the code and observe the output.
    -   **Note:** Remember that your app will start by receiving and processing all the events it has missed since running it earlier.
    ![](./images/image-40.png)

## Summary

You've finished the lab!

You've documented a combination of asyncronous and synchrous APIs.

You've created a new event-driven application, using a combination of APIs discovered in a Developer Portal.

Sample code to help you get started with how to consume an asynchronous API was copied from the Developer Portal, and you are using the same credentials and certificates to access all of these APIs.