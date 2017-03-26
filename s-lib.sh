#!/usr/bin/env bash


# this function takes two parameters:
# @param exitcode - it's a last operation exit code 0 -succees
# @param msg - this is optional message to be displayed on error
exit_on_error(){
    local exitcode=$1
    local msg=$2

    if [ $exitcode != 0  ]; then
        echo "Error" $msg
        exit $exitcode
    fi
}


## convert someimage:TAG to someimage
## result in $IMAGE_NAME_STRIP
function image_name_clean () {
    if [ -z "$1" ]
    then
        echo "Parameter #1 for image_name_clean is empty"
        exit 1
    fi

    IMAGE_NAME_STRIP="$1"
    if [[ "$IMAGE_NAME_STRIP" == *\/* ]] || [[ "$IMAGE_NAME_STRIP" == *\\* ]]
    then
         IMAGE_NAME_PARTS=($(echo "$IMAGE_NAME_STRIP" | tr '/:' "\n"))
         IMAGE_NAME_STRIP=${IMAGE_NAME_PARTS[1]}
    else
         if [[ "$IMAGE_NAME_STRIP" == *:* ]]
         then
             IMAGE_NAME_PARTS=($(echo "$IMAGE_NAME_STRIP" | tr '/:' "\n"))
             IMAGE_NAME_STRIP=${IMAGE_NAME_PARTS[0]}
         fi
    fi
    return 0
}

## convert repo/someimage:TAG to repo/someimage
## result in $IMAGE_NAME
function image_name_remove_version () {
    if [ -z "$1" ]
    then
        echo "Parameter #1 for image_name_remove_version is empty"
        exit 1
    fi

    IMAGE_NAME="$1"
    if [[ "$IMAGE_NAME" == *:* ]]
    then
        IMAGE_NAME=($(echo "$IMAGE_NAME" | tr ':' "\n"))
        IMAGE_NAME=${IMAGE_NAME[0]}
    fi
    return 0
}

## convert repo/someimage:TAG to TAG
## result in IMAGE_VERSION
function image_name_version () {
    if [ -z "$1" ]
    then
        echo "Parameter #1 for image_name_version is empty"
        exit 1
    fi

    IMAGE_VERSION=""
    if [[ "$1" == *:* ]]
    then
        IMAGE_VERSION=($(echo "$1" | tr '/:' "\n"))
        IMAGE_VERSION=${IMAGE_VERSION[${#IMAGE_VERSION[@]}-1]}  ## it is ugly for old bash and zsh
    fi
    return 0
}

## get the top level domain
function root_url_domain () {
    if [ -z "$1" ]
    then
        echo "Parameter #1 for root_url_domain is empty"
        exit 1
    fi

    ROOT_URL_PARTS=($(echo $1 | tr '.' "\n"))
    ROOT_URL_DOMAIN=${ROOT_URL_PARTS[@]:1}
    ROOT_URL_DOMAIN="${ROOT_URL_DOMAIN// /.}"
    return 0
}

## get host name from fqdn
function root_url_prefix() {
    if [ -z "$1" ]
    then
        echo "Parameter #1 for root_url_prefix is empty"
        exit 1
    fi

    ROOT_URL_PARTS=($(echo $1 | tr '.' "\n"))
    ROOT_URL_PREFIX=${ROOT_URL_PARTS[0]}
    return 0
}

function local_cache_setup () {
    ## prevent .meteor/local conflicts
    current_os=$(uname)
    echo "Current OS: $current_os"

    if [ "$current_os" == "Linux" ]; then
        if [ -d .meteor/local ]; then
            if [ -e .meteor/local/build/star.json ]; then
                echo "Checking buildinfo.."
                buildinfo=$(cat .meteor/local/build/star.json | grep 'arch": "os.' | awk '{ print $2 }')
                echo "Found $buildinfo expecting $current_os"
                if [[ "$buildinfo" =~ "\"os.osx" ]]; then
                    echo "Moving meteor local to local-osx"
                    if [[ -d .meteor/local-osx ]]; then
                        echo ".meteor/local-osx already exists, can't move"
                    else
                        mv -f .meteor/local .meteor/local-osx
                    fi
                fi
            fi
        fi
        if [ -d .meteor/local-linux ]; then
            echo "Found local-linux, moving to local"
            mv -f .meteor/local-linux .meteor/local
        fi
    else if [ "$current_os" == "Darwin" ]; then
        if [ -d .meteor/local ]; then
            if [ -e .meteor/local/build/star.json ]; then
                echo "Checking buildinfo.."
                buildinfo=$(cat .meteor/local/build/star.json | grep 'arch": "os.' | awk '{ print $2 }')
                echo "Found $buildinfo expecting $current_os"
                if [[ "$buildinfo" =~ "\"os.linux" ]]; then
                    echo "Moving meteor local to local-linux"
                    if [[ -d .meteor/local-linux ]]; then
                        echo ".meteor/local-linux already exists, can't move"
                    else
                        mv -f .meteor/local .meteor/local-linux
                    fi
                fi
            fi
        fi
        if [ -d .meteor/local-osx ]; then
            echo "Found local-osx, moving to local"
            mv -f .meteor/local-osx .meteor/local
        fi
    fi; fi

    return 0
}




function load_docker_image_name_version () {
    ## collect the git and image information if present
    CURRENT_BRANCH=$(git status | sed -n '/On branch /s///p')
    CURRENT_TICKET=""
    TICKET_REGX='.*\/([A-Z]+\-[0-9]+)\-.*'
    if [[ $CURRENT_BRANCH =~ $TICKET_REGX ]]
    then
        CURRENT_TICKET=${BASH_REMATCH[1]}
    fi

    ## if we have no image, try the last by accessing dockerimage.sha
    if [[ $DOCKER_IMAGE_NAME == "" ]] && [[ -f "dockerimage.sha" ]]
    then
        DOCKER_IMAGE_NAME=$(cat "dockerimage.sha" | sed -n 2p)
        if [[ $DOCKER_IMAGE_VERSION == "" ]]
        then
            image_name_version "$DOCKER_IMAGE_NAME"
            DOCKER_IMAGE_VERSION="$IMAGE_VERSION"
        fi
    fi

    ## if no version was detected still, but we have git
    if [[ $IMAGE_VERSION == "" ]] && [[ $CURRENT_BRANCH != "" ]]
    then
        if [[ $CURRENT_BRANCH == "master" ]]
        then
            IMAGE_VERSION=""
        else
            if [[ $CURRENT_BRANCH == "develop" ]]
            then
                IMAGE_VERSION="develop"
            else
                IMAGE_VERSION="$CURRENT_TICKET"
            fi
        fi
    fi
}



function run_docker_compose () {
    ## create temp file for our parsed .yml
    tempfile=$(mktemp "$1.yml.XXXXXXXXXXX")
    ## auto substitute environment vars
    DOCKER_TEMPLATE=$(parse_docker_yml "$1-docker-compose.yml")

    echo "$DOCKER_TEMPLATE" > $tempfile

    echo "$DOCKER_TEMPLATE"

    docker-compose -f $tempfile up -d

    rm -f "$tempfile"
}

