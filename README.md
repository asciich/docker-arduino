# asciich/arduino container

Containerized version of [Arduino IDE](https://www.arduino.cc/en/Main/Software).

## Run Arduino IDE

Since the [Arduino IDE](https://www.arduino.cc/en/Main/Software) is a graphical tool
several volumes have to be mounted into the container to get it running.
The easiest way is to use the [run_container.sh](https://github.com/asciich/docker-arduino/blob/master/run_container.sh)
script which collects all mounts automatically.

### Open a single .ino project file

To open a single .ino file simply call the [run_container.sh](https://github.com/asciich/docker-arduino/blob/master/run_container.sh)
with the path to the .ino file as argument

```
git clone git@github.com:asciich/docker-arduino.git
cd docker-arduino
./run_container.sh MY-ARDUINO-PROJECT.ino
```

### Access to project directory

Instead of opening a single .ino project a complete directory including several arduino projects can be given as parameter.

```
git clone git@github.com:asciich/docker-arduino.git
cd docker-arduino
./run_container.sh /MY/ARDUINO/PROJECTS
```

All projects are then available in the ```/arduino_projects/``` directory inside the container.
Use the open function in the IDE to open the needed project.

## Installation

1. Checkout the helper script into the ```/opt/``` directory

```
# Normally this needs root access
mkdir -p /opt/asciich/arduino/
cd /opt/asciich/arduino/ && git clone git@github.com:asciich/docker-arduino.git
```

2. Link the run script into the execution path:

```
# Normally this needs root access
ln -s /opt/asciich/arduino/run_container.sh /usr/bin/arduino
```

## Troubleshooting

If uploading the firmware fails it can help to write manually to the serial device node:

```
echo "hello" > /dev/ttyARDUINOSERIAL # normally its /dev/ttyAMC0 for the first Arduino board
```

Then try uploading the project again.


## Build container localy

To build the asciich/arduino container localy:

```
git clone git@github.com:asciich/docker-arduino.git
cd docker-arduino
./build_container.sh
```