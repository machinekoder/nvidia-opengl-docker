#!/usr/bin/env bash
BASE=debian:stretch
REPO_NAME=machinekoder/nvidia-opengl-docker
BASE_NAME=base-stretch
RUNTIME_NAME=1.1-glvnd-runtime-stretch
DEVEL_NAME=1.1-glvnd-devel-stretch

ROOT_DIR=$PWD

cd ${ROOT_DIR}/base
docker build -t ${REPO_NAME}:${BASE_NAME} --build-arg from=${BASE} .
cd ${ROOT_DIR}/glvnd/runtime
docker build -t ${REPO_NAME}:${RUNTIME_NAME} --build-arg from=${REPO_NAME}:${BASE_NAME} --build-arg LIBGLVND_VERSION=v1.1.0 .
#cd ${ROOT_DIR}/glvnd/devel
#docker build -t ${REPO_NAME}:${DEVEL_NAME} --build-arg from=${REPO_NAME}:${BASE_NAME} --build-arg LIBGLVND_VERSION=v1.1.0 .
