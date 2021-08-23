import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'grpc/lib/src/client.dart';
import 'configs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IoT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IoTComponent(title: 'Flutter Demo Home Page'),
    );
  }
}

class IoTComponent extends StatefulWidget {
  IoTComponent({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  IoTComponentState createState() => IoTComponentState();
}

class IoTComponentState extends State<IoTComponent> {
  String moisture0 = "";
  String moisture1 = "";
  bool grpcError = false;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    fetchMoisture((String v0,String v1, bool ok) => {
          setState(() {
        moisture0 = v0;
        moisture1 = v1;
        grpcError = ok;
      })
    });
  }

  Widget moistureStatus(bool ok) {
    if (!ok){
      return ElevatedButton(
        child: const Text('reconnection'),
        onPressed: () async {

          fetchMoisture((String v0, String v1, bool ok) => {
              setState(() {
            moisture0 = v0;
            moisture1 = v1;
            grpcError = ok;
          })
        });

        },
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                moistureStatus(grpcError),
                Text("スイカ畑:" + moisture0),
                Text("モロヘイヤ畑:" + moisture1),
            ElevatedButton(
              child: const Text('スイカ芽水やり①'),
              onPressed: ()  async {
                try{
                  print("open0");
                  final uri = Uri.http(serverUrl,"open0");
                  final response = await http.get(uri);
                  print(response.body);
                }catch (e){
                  print(e);
                }
              },
            ),
            ElevatedButton(
              child: const Text('モロヘイヤ水やり'),
              onPressed: ()  async {
                try{
                  print("open1");
                  final uri = Uri.http(serverUrl,"open1");
                  final response = await http.get(uri);
                  print(response.body);
                }catch (e){
                  print(e);
                }
              },
            ),
                ElevatedButton(
                  child: const Text('スイカ芽水やり②'),
                  onPressed: ()  async {
                    try{
                      print("open2");
                      final uri = Uri.http(serverUrl,"open2");
                      final response = await http.get(uri);
                      print(response.body);
                    }catch (e){
                      print(e);
                    }
                  },
                ),
                ElevatedButton(
                  child: const Text('スイカ水やり'),
                  onPressed: ()  async {
                    try{
                      print("open3");
                      final uri = Uri.http(serverUrl,"open3");
                      final response = await http.get(uri);
                      print(response.body);
                    }catch (e){
                      print(e);
                    }
                  },
                ),
            ElevatedButton(
              child: const Text('すべてな水やりを止めます'),
              onPressed: () async {

                try{
                  print("close");
                  final uri = Uri.http(serverUrl,"close");
                  final response = await http.get(uri);
                  print(response.body);
                }catch (e){
                  print(e);
                }

              },
            ),
          ])),
    );
  }
}