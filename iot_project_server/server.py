#!/usr/bin/env python3
import RPi.GPIO as GPIO
from flask import Flask
app = Flask(__name__)

GPIO.cleanup()

@app.route('/')
def hello():
    name = "Hello World"
    return name

@app.route("/open0")
def open0():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(21, GPIO.OUT)
    GPIO.output(21, True)
    return "open pump 0"

@app.route("/open1")
def open1():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(16, GPIO.OUT)
    GPIO.output(16, True)
    return "open pump 1"

@app.route("/open2")
def open2():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(12, GPIO.OUT)
    GPIO.output(12, True)
    return "open pump 2"


@app.route("/open3")
def open3():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(26, GPIO.OUT)
    GPIO.output(26, True)
    return "open pump 3"


@app.route("/close")
def close():
    print("closing....")
    GPIO.cleanup()
    return "close pump"


if __name__ == "__main__":
    app.run(host='0.0.0.0')