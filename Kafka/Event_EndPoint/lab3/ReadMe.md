
# IBM Cloud Pak for Integration - AsyncApi - Consuming Flight Landing Events

In this lab, you will consume the flight landing events using Kafka Clients kafka-console-consumer.sh and Java program.


# 1. Consuming Flight Landing Events

## 1. kafka-console-consumer.sh

Receive flight landing events using open-source kafka-console-consumer.sh

1. From a command terminal go to ~/EEM.

  ```
  cd ~/EEM
  ```
  Then use gedit to edit the kafka_console_flight_landings_consumer.sh
  ![](./images/test1a.png)

1. You should have the following info saved in your **EEM-info** file.  
  ![](./images/test1b.png)

1. Update the *kafka_console_flight_landings_consumer.sh* with the values from EEM-info.  This screens shows all fields to update. 

    **Note:** Make sure to change the group number to your student number. 
  ![](./images/test1c.png)


1. Now run the kafka_console_flight_landings_consumer.sh script and you should see flight info being displayed. 
  ![](./images/test1d.png)


# 2. Java Application

Use the Java Client application and receive the flight landing events thru the IBM Event Gateway --> Api Connect Async Api --> Event Streams, using a java client<br>

1. First we will need to get the JKS cert for the JAVA client. 
    ```
    cd ~/EEM
    ```
    From that directory copy and paste the following command to create the JKS cert.
    ```
    /usr/lib/jvm/java-11-openjdk-11.0.22.0.7-1.el7_9.x86_64/bin/keytool -importkeystore -srckeystore egw-cert.p12 \
	-srcstoretype PKCS12 \
        -destkeystore egw-cert.jks \
        -deststoretype JKS \
        -srcstorepass passw0rd \
        -deststorepass passw0rd \
        -noprompt
    ```
    When done you should now have a JKS cert.
      ![](./images/test2aa.png)

1. From a command terminal use the following command to go to the directory for the JAVA client.
    ```
    cd ~/EEM/AsyncApi_Consume_Flight_Landing_Events_Java_Project_EEM
    ```
    Then use gedit to edit the config.properties file.  
  ![](./images/test2a.png)

1. You should still have the **EEM-info** file open.  If not open that in gedit since you will need the same details from there to updated the config.properties file.  

    Updated the config.properties file with details from your EEM-info. 

    When done **Save** your changes. 

    **Note:** Make sure to change the group number to your student number. 
  ![](./images/test2b.png)


1. Now run the following command.  Copy and paster into the terminal window and you will start to see flight landing info. 

    ```
    java -cp :jars/jackson-annotations-2.10.5.jar:jars/jackson-databind-2.10.5.1.jar:jars/slf4j-api-1.7.30.jar:jars/jackson-core-2.11.4.jar:jars/kafka-clients-2.8.0.jar: AsyncApi_Consume_Flight_Landing_Events_EEM
    ```
    ![](./images/test2c.png)

[Return to main Event Endpoint Management lab page](../index.md#lab-abstracts)