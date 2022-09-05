SCRIPT=_trustStore.sh
BASEPATH=$(x=$(realpath "${0}") && dirname "${x}")

TRUST_STORE=gateway.p12
TRUST_STORE_TARGET="${BASEPATH}/../assets/${TRUST_STORE}"
PEM=gateway.pem

docker run -e PEM="${PEM}" -e TRUST_STORE="${TRUST_STORE}" \
--mount type=bind,source="$(echo ~/.kube/config)",target="/root/.kube/config" \
--mount type=bind,source="${BASEPATH}",target="/tmp/mounted" \
openshift/origin-cli sh /tmp/mounted/"${SCRIPT}"

keytool -import -noprompt \
        -alias gatewayca \
        -file "${PEM}" \
        -keystore "${TRUST_STORE}" -storetype pkcs12 \
        -storepass password

rm ${PEM}
mv "${TRUST_STORE}" "${TRUST_STORE_TARGET}"