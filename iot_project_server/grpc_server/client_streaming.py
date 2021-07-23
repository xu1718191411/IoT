from __future__ import print_function
import grpc
import iot_pb2
import iot_pb2_grpc

def server_streaming_method(stub):
    request = iot_pb2.Request(request_data="called by Python client")
    response_iterator = stub.ServerStreamingMethod(request)
    for response in response_iterator:
        print("message=%s" % response.ResponseData)

def run():
    url = '192.168.2.104:50051'
    with grpc.insecure_channel(url) as channel:
        stub = iot_pb2_grpc.IoTStub(channel)
        server_streaming_method(stub)


if __name__ == '__main__':
    run()
