#!/bin/bash

if [ ! -f .env ]; then
    cp .env.example .env;

    if [ "$(uname)" = "Darwin" ]; then
        HOST_UID=1000
        HOST_GID=1000
    else
        HOST_UID=$(id -u)
        HOST_GID=$(id -g)
    fi

    echo "" >> .env
    echo "# DO NOT CHANGE THIS" >> .env
    echo "HOST_UID=$HOST_UID" >> .env
    echo "HOST_GID=$HOST_GID" >> .env
fi
