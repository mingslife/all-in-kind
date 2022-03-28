#!/bin/sh

source ./.env

executor -c `pwd` -f `pwd`/Dockerfile \
  -d $registry/$image_name:$APP_VERSION \
  --cache-dir=/share/kaniko --cache --insecure
