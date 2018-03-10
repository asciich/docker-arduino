# asciich/arduino container

Containerized version of [Arduino IDE](https://www.arduino.cc/en/Main/Software).

## Run Arduino IDE

Since the [Arduino IDE](https://www.arduino.cc/en/Main/Software) is a graphical tool
several volumes have to be mounted into the container to get it run.
The easiest way is to use the [run_container.sh](https://github.com/asciich/docker-arduino/blob/master/run_container.sh)
script with the path to your arduino project as argument

```
git clone git@github.com:asciich/docker-arduino.git
cd docker-arduino
./run_container.sh /PATH/TO/ARDUINOPROJECTS
```

All projects are then available in the ```/arduino_projects/``` directory inside the container

## Build container localy

To build the asciich/arduino container localy:


```
git clone git@github.com:asciich/docker-arduino.git
cd docker-arduino
./build_container.sh
```