#!/usr/bin/env python3
import serial
import RPi.GPIO as GPIO
from flask import Flask
app = Flask(__name__)

ser = serial.Serial('/dev/ttyACM0', 9600, timeout=1)
ser.flush()
GPIO.cleanup()

@app.route('/')
def hello():
    name = "Hello World"
    return name

@app.route("/open")
def open():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(21, GPIO.OUT)
    GPIO.output(21, True)
    return "open pump"

@app.route("/close")
def close():
    print("closing....")
    GPIO.cleanup()
    return "close pump"


if __name__ == "__main__":
    app.run(host='0.0.0.0')