# Lab Setup

## Pre-Requisites

In order to run this lab, you need a CP4I stack with Event Streams (ES) and Event Endpoint Management (EEM) installed - ideally in the same namespace.

ES must have an external listener defined. It can optionally have SASL security enabled (you get both by deploying the `development` Event Streams profile).

EEM can either be installed using the Events capability in CP4I, or by editing an existing APIC custom resource YAML to add:
```yaml
endpointTypes:
 - Events
 - APIs
```

EEM should be configured (mail server, gateways etc.) - you then need to create a Provider Org and Portal in EEM ready for each lab user to use individually.

Alternatively, you can run a slimmed down lab single Provider Org and Portal for all lab users that just uses the Developer Portal - you will need to go through all the steps in the lab that publish the APIs to Portal. Lab participants can then start from [building the application](../README.md#building-the-application).

## Deploy the demo APIs

**NOTE** You need `oc`, `keytool` and `docker` available on your system.
1. Log into the Openshift Cluster using `oc`
1. Run `deployApis.sh`

This will create the following:
  1.  An ES user
  1.  A deployment with two containers:
      1.  A Kafka Connect instance publishing messages to ES using the ES user
      1.  A nodeRED server acting hosting a REST API
  1.  A service that provides internal access to the REST API

## Creating demo assets

There are "demo specific" items that need to be generated when running the lab on a new CP4I instance.

1.  Retrieve the Event Gateway and API Gateway certificates and generate a Java truststore. **NOTE** You need `oc`, `keytool` and `docker` available on your system.
    1. Log into the Openshift Cluster using `oc`
    1. Run `generateTruststore.sh`

1.  Replace `cp4i-apic` with the EEM namespace in [apis.txt](../assets/apis.txt) 