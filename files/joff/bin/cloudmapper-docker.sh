#!/bin/bash

(
    export $(aws-vault exec ${1} --no-session -- env | grep ^AWS | xargs) && \
    docker run -ti \
        -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
        -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
        -p 8000:8000 \
        cloudmapper /bin/bash
)

