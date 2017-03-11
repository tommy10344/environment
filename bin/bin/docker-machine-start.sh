#!/bin/bash

MACHINE_NAME=docker

docker-machine start ${MACHINE_NAME}
eval "$(docker-machine env ${MACHINE_NAME})"
