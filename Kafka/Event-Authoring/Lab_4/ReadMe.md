# Lab 4 - Join related events that occur within a time window

When looking for patterns in an event stream, sometimes we need to examine events from more than one topic. We talk of this as a "join" between the streams - the same term we would use when working with databases and correlating data between two tables.
## Scenario : Identify suspicious orders

Many interesting situations need us to combine multiple streams of events that correlate events across these inputs to derive a new, interesting situation.

In this scenario, we will look for suspicious orders. Specifically, we will be looking for a particular pattern of behavior where large orders have been placed, followed by a smaller order, but the large order was at some point cancelled. 

This pattern would suggest an attempt to manipulate prices, since the presence of the large order might result in a subsequent reduction in prices, which the smaller
order can take advantage of.

To find this pattern, we will use the "join" capability to compare a stream of "orders" with a stream of "cancellations".

## 1.0 Import template flow to start with

1. Go to the **Event Processing** home page. Type "template" in the "Find a flow" search box

    Select vertical ... on the flow named "Lab 4 starting template" and then select the "Export" option
  
    ![](images/media/image1.png)

1. Select JSON option and then select the Export button. Save the file to a place where you will easily find it in the next step.

    ![](images/media/image2.png)

1. Select the "Import" link on the "Create a new flow" tile

    ![](images/media/image3.png)


1. Select the "Drag and drop files here or click to upload" link then navigate
to where you saved the file you just exported.

    Select the "Upload" button

    ![](images/media/image4.png)

1. Now rename your flow by clicking on the flow name in the upper left corner.   
That will open the details and change the name of your flow to match your student name.

    **ex: Lab4-kallus1** then click "Save"

    ![](images/media/image5.png)

## 1.1  Join the two streams

You are now ready for the next step to specify how to correlate the large orders with the cancellations.

1. Add an **Interval join** node and link it to the two streams by clicking and drag from the small gray dot on the cancellations event
source to the matching dot on the filter node. Do the same for the large orders filter node.  

    Hover over the **IntervalJoin_1** node and click the **pen icon** to edit the node.  

    ![](images/media/image6.png)



1. Give the join node a name that describes the events it should identify: **Cancelled large orders**

    ![](images/media/image7.png)

1. Configure the join node by clicking the Assistant drop down.

    Define the join by matching the **orderid** from the cancellation events and the **id** from the large order events

    Then click on **Add to expression**

    ![](images/media/image8.png)
 
1. You will now see your expression.  
    
    Click "Next"

      ![](images/media/image8a.png)
  
   
1. Specify that you are interested in detecting cancellations that are made within 30 minutes of the (large) order.

     Click "Next"

    ![](images/media/image9.png)

1. Now we will remove the properties that we do not need to simplify the output.
 We only need to know when it happened, what product was cancelled and by what customer

    Keep the two "Event time" properties - ordertime and canceltime.

    Keep the description and customerid properties from the Large orders.

    Click on the icon next to the properties you want to remove.  

    ![](images/media/image10.png)

1. Once you are done should look like this and you can click **Configure** to finalize the
join.

   ![](images/media/image10a.png)

## 1.2 Test the flow
The next step is to test your event processing flow and view the results.

1. Use the "Run" menu, and select **Include historical** to run your transform on the history of events available on this Kafka topic.
  
    ![](images/media/image11.png)

    **NOTE:** "Include historical" is useful while you are developing your flows, as it means that you don't need to wait for new events to be produced to the Kafka topic. You can use all of the events already on the topic to check that your flow is working the way that you want.
  
1. Click the "intervalJoin" node to see a live view of results. 

    **Note:** You may see the message "Waiting for receiving the events" while the process is running.

    ![](images/media/image12.png)
1. When you have finished reviewing the results, you can stop this flow.

    ![](images/media/image13.png)

## 1.4 Identify small orders

The next step is identify small orders (that we will later correlate with the cancelled large orders).

1. Add a **Filter** node to the flow and link it to the order events. Click on the **pen icon** to edit new node.

      ![](images/media/image14.png)

1. Give the filter node a name that describes the events it should identify: **Small orders**

    Click **Next**
      ![](images/media/image15.png)

1. Create a filter that selects orders for five or fewer items using the Assistant and click on **Add to expression**

    ![](images/media/image16.png)

1. You will now see your filter expression. 
    
    Click **Configure** to finalize the filter.

    ![](images/media/image17.png)

1. Now you will see your flow and notice a Validation error. Disregard that error since we have not yet completed connecting all nodes.

    ![](images/media/image17a.png)

## 1.5 Correlating small orders with cancelled large orders
The next step is identify small orders that occur within a short time of cancelled large orders.

1. Add an **Interval join** node to combine the small order events with the cancelled large order events.  
  Click the pen icon to edit the new node.

     ![](images/media/image18.png)

1. Give the join node a name that describes the events it should
 identify: **Suspicious orders**

     ![](images/media/image19.png)

1. Click on the **Assistant** 

    Join the two streams based on the **description** and click on **Add to expression**
    ![](images/media/image20.png)

1. This will show your expression.

    Click **Next**
    ![](images/media/image21.png)

1. Specify 30 minutes time window that you want to use for the join.

    This will identify a small order, when it occurs within thirty minutes of a large order that is soon cancelled.
    
    Click **Next**

    ![](images/media/image22.png)
1. Choose the output properties that will be useful to return.

    **NOTE:** Use the "+" next to properties to add and "-" to remove properties.  

    - For the Small orders keep the following properties: id, customer, description and event_time but delete all the others

    - Delete all the properties on Cancelled large orders
  
    Now rename the 4 properties as shown below by hovering over the property and clicking on the edit pencil. 

    You will notice when changing the properties names the **Orginal name** will be saved.   
    
    Click **Configure** to finalize the join.

    ![](images/media/image23.png)
## 1.6 Test the flow
 The final step is to run your event processing flow and view the results.

1. Use the "Run" menu, and select **Include historical** to run your flow on the history of order, cancelled events available on the Kafka topics.
    ![](images/media/image24.png)

    **NOTE:** "Include historical" is useful while you are developing your flows, as it means that you don't need to wait for new events to be produced to the Kafka topic. You can use all of the events already on the topic to check that your flow is working the way that you want.
  
1. Click the "Suspicious orders" node to see a live view of results. 

    **Note:** You may see the message "Waiting for receiving the events" while the process is running.

    ![](images/media/image25.png)
1. When you have finished reviewing the results, you can stop this flow.

    ![](images/media/image26.png)
 

    You should notice some suspicious customers in the results.
("Suspicious Bob","Naughty Nigel","Criminal Clive", "Dastardly Derek") 

    There are likely also some non-suspicious customers in the results.
    
    Some of these might be customers who innocently made a large order, decided they didn't need that many, cancelled it and made a smaller order instead. 

    Some of them might be customers who coincidentally made a small order for the same product that a suspicious person was currently manipulating the price of.

## Recap

You used filter nodes to divide the stream of orders into separate subsets - of large and small orders.

You used join nodes to combine the orders events with the corresponding cancellation events, and to look for small orders in the context of large orders that happened within a short time window.

[Return to main Event processing lab page](../index.md)
