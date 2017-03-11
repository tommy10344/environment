#!/bin/bash

name="tomiyosi"

build-base() {
    # cd base && docker build -t ${name}/devenv-base .
    cd base
    docker-compose build
    cd ..
}

usage() {
    echo "Usage: $0 TARGET"
    echo "Targets:"
    echo "    dotnet"
}

target=$1

if [ -z ${target} ]; then
    usage
    exit
fi

case ${target} in
    "dotnet")
        build-base
        # cd base && docker build -t ${name}/devenv-dotnet .
        cd dotnet
        docker-compose build
        cd ..
        ;;
    "dotnet")
        build-base
        # cd base && docker build -t ${name}/devenv-haskell .
        cd haskell
        docker-compose build
        cd ..
        ;;
    *)
        echo "Invalid target: ${target}"
        usage
        ;;
esac
