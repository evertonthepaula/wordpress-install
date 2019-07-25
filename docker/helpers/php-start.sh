#!/bin/bash

set -e

[ -z "$1" ] && DIR=$PWD || DIR=$1

[ -z "$2" ] && WORKDIR=/project/ || WORKDIR=$2

[ -z "$3" ] && IMAGE=php_image || IMAGE=$3

[ -z "$4" ] && CMD=bash || CMD=$4

docker run \
--name wp-container \
-v $DIR/$WORKDIR/:/$WORKDIR/ \
-v ~/.ssh/:/root/.ssh/ \
-w $WORKDIR \
--network host \
-it --rm \
$IMAGE $CMD

exit 0