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
  String moisture = "";
  bool grpcError = false;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    fetchMoisture((String v, bool ok) => {
          setState(() {
        moisture = v;
        grpcError = ok;
      })
    });
  }

  Widget moistureStatus(bool ok) {
    if (!ok){
      return ElevatedButton(
        child: const Text('reconnection'),
        onPressed: () async {

          fetchMoisture((String v, bool ok) => {
              setState(() {
            moisture = v;
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
                Text("moisture:" + moisture),
            ElevatedButton(
              child: const Text('open'),
              onPressed: ()  async {
                try{
                  print("open");
                  final uri = Uri.http(serverUrl,"open");
                  final response = await http.get(uri);
                  print(response.body);
                }catch (e){
                  print(e);
                }
              },
            ),
            ElevatedButton(
              child: const Text('close'),
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