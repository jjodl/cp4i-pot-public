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

check_return_code() {
  if [[ "$1" -ne 0 ]]; then
    error "${2:=Unexpected failure}"
    exit 1
  fi
}

get_zen_token() {
    ZEN_HOST=https://$(oc get route -n "${CP4I_NAMESPACE}" cpd -o=jsonpath='{.spec.host}')
    CS_HOST=https://$(oc -n kube-public get cm ibmcloud-cluster-info -o jsonpath='{.data.cluster_address}')

    USERNAME=$(oc get secret -n "${CS_NAMESPACE}" platform-auth-idp-credentials -o=jsonpath='{.data.admin_username}' | base64 --decode)
    PASSWORD=$(oc get secret -n "${CS_NAMESPACE}" platform-auth-idp-credentials -o=jsonpath='{.data.admin_password}' | base64 --decode)

    IAM_TOKEN=$(curl -kfs -X POST -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: application/json' -d "grant_type=password&username=${USERNAME}&password=${PASSWORD}&scope=openid" "${CS_HOST}"/v1/auth/identitytoken | jq -r .access_token)
    ZEN_TOKEN=$(curl -kfs "${ZEN_HOST}"/v1/preauth/validateAuth -H "username: ${USERNAME}" -H "iam-token: ${IAM_TOKEN}" | jq -r .accessToken)
    test ${#ZEN_TOKEN} -gt 0
    check_return_code "${?}"
    echo "${ZEN_TOKEN}"
}

get_platform_api_url() {
    oc get eem -n "${NAMESPACE}" "${INSTANCE}" -o=jsonpath='{.status.endpoints[?(@.name=="platformApi")].uri}'
}


TRUST_STORE="/tmp/mounted/${TRUST_STORE}"
PEM="/tmp/mounted/${PEM}"

cd /tmp || exit
export PATH=/tmp:"${PATH}"

# -------------------------------------------------------------------
# cleanup from previous runs
# -------------------------------------------------------------------
[ -e "${TRUST_STORE}" ] && rm "${TRUST_STORE}"

# -------------------------------------------------------------------
# Preqrequisites
# -------------------------------------------------------------------

info "Downloading jq (pre-req)"
curl -sL https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -o jq 
chmod +x jq

# -------------------------------------------------------------------
# log into apic CLI
# -------------------------------------------------------------------

CS_NAMESPACE=$(oc get commonservice -A -o jsonpath='{..namespace}')
CP4I_NAMESPACE=$(oc get zenservice -A -o jsonpath='{..namespace}')
NAMESPACE=$(oc get eem -A -o jsonpath='{..namespace}')
INSTANCE=$(oc get eem -n "${NAMESPACE}" -o=jsonpath='{.items[0].metadata.name}')

info "Creating zen token"
ZEN_TOKEN=$(get_zen_token | tail -1)
check_return_code "${?}" "Unable to generate Zen Token"

info "Downloading apic CLI"
oc cp -n "${NAMESPACE}" "$(oc get po -n "${NAMESPACE}" -l app.kubernetes.io/name=client-downloads-server,app.kubernetes.io/part-of="${INSTANCE}" -o=jsonpath='{.items[0].metadata.name}')":dist/toolkit-linux.tgz toolkit-linux.tgz
test -f toolkit-linux.tgz
check_return_code "${?}" "Failed to download CLI"
tar -xf toolkit-linux.tgz  && mv apic-slim apic

info "Downloading apic config json file"
PLATFORM_API_URL=$(get_platform_api_url)
TOOLKIT_CREDS_URL="${PLATFORM_API_URL}/cloud/settings/toolkit-credentials"
curl -ks "${TOOLKIT_CREDS_URL}" -H "Authorization: Bearer ${ZEN_TOKEN}" -H "Accept: application/json" -H "Content-Type: application/json" -o creds.json
yes | apic client-creds:set creds.json
[[ -e creds.json ]] && rm creds.json

info "Creating apic API key"
APIC_APIKEY=$(curl -ks --fail -X POST "${PLATFORM_API_URL}"/cloud/api-keys -H "Authorization: Bearer ${ZEN_TOKEN}" -H "Accept: application/json" -H "Content-Type: application/json" -d '{"client_type":"toolkit","description":"Tookit API key"}' | jq -r .api_key)
test ${#APIC_APIKEY} -gt 0
check_return_code "${?}" "Failed to retrieve API key"

info "Logging into API manager"
APIM_ENDPOINT=$(oc -n "${NAMESPACE}" get mgmt "${INSTANCE}-mgmt" -o jsonpath='{.status.zenRoute}')
yes n | apic login --context admin --server https://"${APIM_ENDPOINT}" --sso --apiKey "${APIC_APIKEY}"

# -------------------------------------------------------------------
# setting up certificate
# -------------------------------------------------------------------
printf "\n\033[1;33m Retrieving gateway certificate\033[0m"
apic keystores:get \
  --server https://$APIM_ENDPOINT \
  --org admin \
  --format json \
  tls-server-for-gateway-services-default-keystore \
  --output -  | jq -r .public_certificate_entry.pem > "${PEM}"