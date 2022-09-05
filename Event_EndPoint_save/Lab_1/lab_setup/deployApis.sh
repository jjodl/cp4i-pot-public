#!/bin/bash

SCRIPT=_deployApis.sh
BASEPATH=$(x=$(realpath "${0}") && dirname "${x}")

docker run --mount type=bind,source="${BASEPATH}",target="/tmp/mounted" \
--mount type=bind,source="$(echo ~/.kube/config)",target="/root/.kube/config" \
openshift/origin-cli sh /tmp/mounted/"${SCRIPT}"