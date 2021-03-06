#!/bin/bash

# doesnt search /dev/cu.usbserial-A50285BI - chinese arduino uno

if [ `uname` == "Darwin" ]; then
  if  ls /dev/tty.usb* 1> /dev/null 2>&1; then
    SERIAL=`ls -f /dev/tty.usb*`
  elif ls /tmp/ttyRERETX 1> /dev/null 2>&1; then
    SERIAL=`ls -f /tmp/ttyRERERX` 
  else 
    echo "no serial ports detected"
    exit 1
  fi
elif [ `uname` == "Linux" ]; then
  if ls /dev/ttyACM? 1> /dev/null 2>&1; then
    SERIAL=`ls -f /dev/ttyACM?`
  elif ls /dev/ttyUSB? 1> /dev/null 2>&1; then
    SERIAL=`ls -f /dev/ttyUSB?`
  else 
    echo "no serial ports detected"
    exit 1
  fi
fi
echo $SERIAL
