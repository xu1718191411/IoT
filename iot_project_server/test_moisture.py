#!/usr/bin/env python3
import serial
import json


def read_moisture():
    ser = serial.Serial('/dev/ttyACM0', 9600, timeout=1)
    ser.flush()

    while True:
        try:
            if ser.in_waiting > 0:
                line = ser.readline().decode('utf-8').rstrip()
                data = json.loads(line)
                print(data["moisture"])
        except Exception as e:
            print(e)


read_moisture()
