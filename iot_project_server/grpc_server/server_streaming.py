import json
from concurrent import futures
import logging

import grpc
import iot_pb2
import iot_pb2_grpc

import serial

ser = serial.Serial('/dev/ttyACM0', 9600, timeout=1)
ser.flush()

class IoT(iot_pb2_grpc.IoT):
    def ServerStreamingMethod(self, request, context):
        print("ServerStreamingMethod message= %s" % request.request_data)
        def response_messages():
            while True:
                try:
                    if ser.in_waiting > 0:
                        line = ser.readline().decode('utf-8').rstrip()
                        data = json.loads(line)
                        print(data["moisture"])
                        responseData = iot_pb2.ResponseData(moisture=int(data["moisture"]))
                        response = iot_pb2.Response(ResponseData=responseData)
                        yield response

                except Exception as e:
                    print(e)
        return response_messages()

def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    iot_pb2_grpc.add_IoTServicer_to_server(IoT(), server)
    server.add_insecure_port('0.0.0.0:50051')
    server.start()
    server.wait_for_termination()

if __name__ == '__main__':
    logging.basicConfig()
    serve()
