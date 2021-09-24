#!/usr/bin/env bash

# we need to set dependency to compilare image.
USERVICE_NAME="docker-openvpn-kube-for-mac"
DOCKER_IMAGE_NAME="docker-openvpn-kube-for-mac"
DOCKER_REPOSITORY="registry.cn-shanghai.aliyuncs.com/kyligence"


CURRENT_FOLDER="${PWD##*/}"
HOME_FOLDER=~

## include the functions
. $(dirname $0)/s-lib.sh

