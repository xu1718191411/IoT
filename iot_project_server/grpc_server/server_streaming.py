import json
from concurrent import futures
import logging

import grpc
import iot_pb2
import iot_pb2_grpc

import serial

def initSerail() -> serial.SerialBase:
    ser = serial.Serial('/dev/ttyACM0', 9600, timeout=1)
    ser.flush()
    return ser

class IoT(iot_pb2_grpc.IoT):
    def __init__(self, ser: serial.SerialBase):
        self.ser = ser

    def ServerStreamingMethod(self, request, context):
        print("ServerStreamingMethod message= %s" % request.request_data)
        def response_messages():
            while True:
                try:
                    if self.ser.in_waiting > 0:
                        line = self.ser.readline().decode('utf-8').rstrip()
                except Exception as e:
                    print(e)
                    context.set_details("error at serial communication with Arduino")
                    context.set_code(grpc.StatusCode.INVALID_ARGUMENT)
                    return response
                try:
                    data = json.loads(line)
                    print(data["moisture"])
                    responseData = iot_pb2.ResponseData(moisture=int(data["moisture"]))
                    response = iot_pb2.Response(ResponseData=responseData)
                    yield response

                except Exception as e:
                    print("error at parsing response from arduino")
        return response_messages()


def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    ser = initSerail()
    iot_pb2_grpc.add_IoTServicer_to_server(IoT(ser), server)
    server.add_insecure_port('0.0.0.0:50051')
    server.start()
    server.wait_for_termination()

if __name__ == '__main__':
    logging.basicConfig()
    serve()
