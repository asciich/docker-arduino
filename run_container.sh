#!/usr/bin/env bash

set -e

MAIN_WD=$(pwd)
ARDUINO_PROJECT_DIR="${1}"

if [ "${ARDUINO_PROJECT_DIR}" == "" ] ; then
    echo "Usages:"
    echo "     ${0} ARDUINO_PROJECT_DIR"
    exit 1
fi

if ! [ -d ${ARDUINO_PROJECT_DIR} ] ; then
    echo "Arduino project does not exist:"
    echo "  \"${ARDUINO_PROJECT_DIR}\""
fi

ARDUINO_PROJECT_DIR=$(cd ${ARDUINO_PROJECT_DIR} && pwd)
cd ${MAIN_WD}
echo "Mount ${ARDUINO_PROJECT_DIR} as /arduino_projects/"

echo ""
echo "Start container"
VOLUMES="-v ${ARDUINO_PROJECT_DIR}:/arduino_projects/"
VOLUMES="${VOLUMES} -v /tmp/.X11-unix:/tmp/.X11-unix"
VOLUMES="${VOLUMES} -v ${XAUTHORITY}:${XAUTHORITY}"
ENVIRONMENT="-e DISPLAY=${DISPLAY}"
ENVIRONMENT="${ENVIRONMENT} -e XAUTHORITY=${XAUTHORITY}"
CONTAINER=asciich/arduino

docker run --rm --net=host --privileged ${VOLUMES} ${ENVIRONMENT} -it ${CONTAINER} arduino
