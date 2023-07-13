## IBM Event Automation
Get hands on building Event Automation flows.  Define business scenarios in an intuitive, easy-to-use authoring canvas. Detect situations whenever they arise and start acting in real-time when it matters the most.

[Return to kafka main page](../index.md#lab-abstracts)

## Lab Abstracts

|  Subject                            | Description                                            |                                                               
|-------------------------|------------------------------------------------------------------------------------------------------------|
| [Lab 1: Est 10 mins][tutorial-1-pdf]       |**Create a new event processing flow & connect to a Kafka Topic as a source of events** <br> <br>The purpose of this lab is to create a new event processing flow and connect to a source of events in a Kafka Topic.  <br><br>In this lab you will: <br>a) Discover and request access to a topic in the Event Endpoint Management Catalog <br>b) Create your first event processing flow <br>c) Register your topic as a source of events and enter the security details into the Event Source node
|-------------------------|------------------------------------------------------------------------------------------------------------|
| [Lab 2: Est 10 mins][tutorial-2-pdf]       |**Filter events and test your flow** <br> <br>This lab builds on the previous lab.<br><br>The purpose of this lab is to show you how to filter out a subset of events you want to keep as part of the event processing flow.  Filtering works on individual events in the stream. <br><br>In this lab you will: <br>a) Start with the flow from Lab 1 <br>b) Create a filter to keep the events you want in the results.  <br>c) Test your flow to see the results 
|-------------------------|------------------------------------------------------------------------------------------------------------|
| [Lab 3A: Est 5 mins][tutorial-3A-pdf]<br>[Lab 3B: Est 5 mins][tutorial-3B-pdf]       |**Transform Events by removing event properties and adding new custom properties** <br> <br>Lab 3A builds on the previous lab.<br><br>The purpose of Lab 3A and Lab 3B is to show you how to modify the events to remove some properties and add new custom properties based on the data in the message. Transformations work on individual events in the stream.   <br><br>In Lab 3A you will: <br>a) Start with the flow from Lab 2 <br>b) Remove some properties of the events in the flow.  <br>c) Test your flow to see the results <br><br>In Lab 3B you will: <br>a) Start with the flow from Lab 3A <br>b) Add some new properties to the events in the flow by extracting data that already exists.  <br>c) Test your flow to see the results 
|-------------------------|------------------------------------------------------------------------------------------------------------|
| [Lab 4: Est 10 mins][tutorial-4-pdf]        |**Aggregate events to produce real-time analytics & detect trends** <br> <br>This lab builds on the previous lab.<br><br>The purpose of this lab is to show you how to summarize many events over a time period for the events going through your flow.  Aggregation works to calculate sums, averages, etc for many individual events over a time period. This produces real-time summary analytics for the events in your stream.<br><br>In this lab you will: <br>a) Start with the flow from the previous lab <br>b) Count the number of events of each type over a 1 hour period.  <br>c) Test your flow to see the results 
|-------------------------|------------------------------------------------------------------------------------------------------------|
| [Lab 5: Est 10 mins][tutorial-5-pdf]      |**Join related events that occur within a time window**  <br> <br>You will create a new flow for this lab by importing a partially completed flow.<br><br>The purpose of this lab is to show you how to join 2 streams of events together within a time window as part of the event processing flow.  The time based joins (called interval joins) work on individual events from each stream that meet the criteria of the join condition. <br><br>In this lab you will: <br>a) Start by importing a partially created flow <br>b) Create an interval join between the orders and cancellations streams of events.  You will define the join condition.  <br>c) Test your flow to see the results <br>d)Add a filter to the orders stream to create produce only small orders <br>e)Create an interval join between the cancelled large orders and small orders streams of events.  You will define the join condition.  <br>f) Test your flow to see the results
|-------------------------|------------------------------------------------------------------------------------------------------------|
| [Lab 6: Est 10 mins][tutorial-6-pdf]      |**Save flow results to a Kafka Topic in Event Streams** <br> <br>This lab builds on the previous lab.<br><br>The purpose of this lab is to show how you can save the results of your completed flow to a Kafka topic.  This saves each individual event that remains after all the event processing is complete. <br><br>In this lab you will: <br>a) Start with the flow from the previous lab <br>b) Create a destination Kafka topic in Event Streams using the Event Streams UI.  <br>c) In the Event Processing UI you will create an Event Destination node that saves the events to the Kafka topic <br>d) Start your flow and go back to the Event Streams UI to see that your flow results are saved to Kafka  
|-------------------------|------------------------------------------------------------------------------------------------------------|



[Return to Event Automation main page](../index.md#lab-abstracts)

[tutorial-1-pdf]:  ./pdfs/1_Create_new_event_processing_flow_and_connect_to_source.pdf
[tutorial-2-pdf]:  ./pdfs/2_Filter_events_based_on_particular_properties.pdf
[tutorial-3A-pdf]: ./pdfs/3A_Transform_events_to_remove_properties.pdf
[tutorial-3B-pdf]: ./pdfs/3B_Transform_events_to_create_properties.pdf
[tutorial-4-pdf]:  ./pdfs/4_Aggregate_events_for_real_time_analytics.pdf
[tutorial-5-pdf]:  ./pdfs/5_Do_time_window_join_on_2_event_streams.pdf
[tutorial-6-pdf]:  ./pdfs/6_Save_flow_results_to_new_topic.pdf 

[tutorial-1-0]: https://ibm.github.io/event-automation/tutorials/guided/tutorial-1#instructions
[tutorial-2-0]: https://ibm.github.io/event-automation/tutorials/guided/tutorial-2#instructions
[tutorial-3-0]: https://ibm.github.io/event-automation/tutorials/guided/tutorial-3#instructions
[tutorial-4-0]: https://ibm.github.io/event-automation/tutorials/guided/tutorial-4#instructions
[tutorial-5-0]: https://ibm.github.io/event-automation/tutorials/guided/tutorial-5#instructions
[tutorial-6-0]: https://ibm.github.io/event-automation/tutorials/guided/tutorial-6#instructions

[example-8-0]:https://ibm.github.io/event-automation/tutorials/event-processing-examples/example-08

[tutorial-1-1]: https://ibm.github.io/event-automation/tutorials/guided/tutorial-1#step-1--discover-the-topic-to-use
[tutorial-1-2]: https://ibm.github.io/event-automation/tutorials/guided/tutorial-1#step-2--create-a-flow
[tutorial-1-3]: https://ibm.github.io/event-automation/tutorials/guided/tutorial-1#event-source
[tutorial-1-4]: https://ibm.github.io/event-automation/tutorials/guided/tutorial-1#step-4--define-the-filter
[tutorial-1-5]: https://ibm.github.io/event-automation/tutorials/guided/tutorial-1#step-5--testing-the-flow