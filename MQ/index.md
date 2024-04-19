# IBM MQ
## Introduction
You can use IBM MQ to enable applications to communicate at different times and in many diverse computing environments.

What is IBM MQ?

   - IBM MQ is messaging for applications. It sends messages across networks of diverse components. Your application connects to IBM MQ to send or receive a message. IBM MQ handles the different processors, operating systems, subsystems, and communication protocols it encounters in transferring the message. If a connection or a processor is temporarily unavailable, IBM MQ queues the message and forwards it when the connection is back online.

   - An application developer has a choice of programming interfaces, and programming languages to connect to IBM MQ.
   
   - IBM MQ is messaging and queuing middleware, with point-to-point,publish/subscribe, and file transfer modes of operation. Applications can publish messages to many subscribers over multicast.


[Return to main Lab section](../index.md#lab-section)


## Lab Abstracts

|  Subject                            | Description                                            |                                                               
|-----------------------------|------------------------------------------------------------------------------------------------------------| 
| [EnvSetup](Msg-Pre-lab/mqsetup/mq_setup_steps.md) | MQ lab environment Setup - download MQ lab artifacts                                         
|--------------------------------|-----------------------------------------------------------------|
| [Lab 1](Lab_1/Readme.md)       | Native HA Queue Manager on Cloud Platforms                      | 
|--------------------------------|-----------------------------------------------------------------|
| [Lab 2a](Lab_2a/Readme.md)       | Streaming Queues for MQ                       |                                       
|--------------------------------|-----------------------------------------------------------------|
| [Lab 2b](Lab_2b/Readme.md)       | MQ Source connector to Kafka from Streaming Queues                       |                                       
|--------------------------------|-----------------------------------------------------------------|
| [Lab 3](Lab_3/Readme.md)       | Uniform Cluster and Application Load Balancing          |                                     
|--------------------------------|-----------------------------------------------------------------|

[Return to main lab section](../index.md#lab-section)