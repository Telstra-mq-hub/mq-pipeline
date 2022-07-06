#!/bin/bash
DIR=`dirname "$0"`
source ${DIR}/functions.sh

export MQCCDTURL=ccdt.json
export MQSSLKEYR=../certs/mqclient

release_name=${1:-qm1}
namespace=${2:-mq}
i=0

while wait_for ${release_name} QueueManager ${namespace} "Running"; do
    i++
    printf "%s\n\n" "sending message $i to queue manager" | amqsputc APPQ QM1 > /dev/null
    echo "Sending message $i to queue manager"
done

