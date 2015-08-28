#!/bin/bash

source .env.sh

curl http://$IBBD_DOCKER_HOST/v1/search

