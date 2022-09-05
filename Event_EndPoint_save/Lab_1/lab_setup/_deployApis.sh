#!/bin/bash

msg() {
    printf '%b\n' "$1"
}

error() {
    msg "\33[31m[✘] ${1}\33[0m" 1>&2
    exit 1
}

info() {
  msg "\33[33m[INFO] ${1}\33[0m"
}

cd /tmp || exit
export PATH=/tmp:"${PATH}"

# -------------------------------------------------------------------
# Preqrequisites
# -------------------------------------------------------------------

info "Downloading jq (pre-req)"
curl -sL https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -o jq 
chmod +x jq

cd mounted || exit

EEM_NAMESPACE=$(oc get eem -A -o jsonpath='{..namespace}')
EEM_CLUSTER=$(oc get eem -n "${EEM_NAMESPACE}" -o=jsonpath='{.items[0].metadata.name}')
ES_NAMESPACE=$(oc get es -A -o jsonpath='{..namespace}')
ES_CLUSTER=$(oc get es -n "${ES_NAMESPACE}" -o=jsonpath='{.items[0].metadata.name}')

BOOTSTRAP_ADDRESS="$(oc get es -n "${ES_NAMESPACE}" "${ES_CLUSTER}" -o=jsonpath='{.status.kafkaListeners[?(@.type=="external")].bootstrapServers}')"

info "Deploying APIs"
sed "s/%NAMESPACE%/${ES_NAMESPACE}/" eem-user.yaml | sed "s/%ES_CLUSTER%/${ES_CLUSTER}/" - | sed "s/%ES_BOOTSTRAP_ADDRESS%/${BOOTSTRAP_ADDRESS}/" - | oc apply -f -
sed "s/%NAMESPACE%/${EEM_NAMESPACE}/" eem-demo-apis.yaml | sed "s/%ES_CLUSTER%/${ES_CLUSTER}/" - | oc apply -f -

info "Waiting for EventStreams user to be created for EEM"
sleep 10s

if [ "${EEM_NAMESPACE}" != "${ES_NAMESPACE}" ]; then
  info "ES instance [${ES_CLUSTER}] is in namespace [${ES_NAMESPACE}] and EEM instance [${EEM_CLUSTER}] is in namespace [${EEM_NAMESPACE}]. Copying resources into EEM namespace."
  oc get secret -n "${ES_NAMESPACE}" "${ES_CLUSTER}--eem-user" -o json | jq "{kind, type, apiVersion, data, metadata: {name: .metadata.name, namespace: \"${EEM_NAMESPACE}\"}}"| oc apply -f -
  oc get secret -n "${ES_NAMESPACE}" "${ES_CLUSTER}-cluster-ca-cert" -o json | jq "{kind, type, apiVersion, data, metadata: {name: .metadata.name, namespace: \"${EEM_NAMESPACE}\"}}"| oc apply -f -
fi