#!/bin/bash

echo 'Preparing to download code'

wget --header="authorization: token ${TOKEN}" ${WEIGHTS_URL} -O "/app/weights.pt"

if [ $? -eq 0 ]
then
  echo "Successfully downloaded weights"
else
  echo "Could download weights. Exiting" >&2
  exit
fi

wget --header="authorization: token ${TOKEN}" ${CODE_URL} -O /tmp/code.gz; tar xvf /tmp/code.gz -C "/app";

if [ $? -eq 0 ]
then
  echo "Successfully downloaded code"
else
  echo "Could download code. Exiting" >&2
  exit
fi

export PWD='/app'
export WEIGHTS_PATH="/app/weights.pt"

exec seldon-core-microservice SeldonModel REST --service-type MODEL --persistence 0