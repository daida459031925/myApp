import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Serial Communication',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _serialPort = SerialPort("/dev/ttyS0");

  @override
  void initState() {
    super.initState();
    _serialPort.open(mode: 9600);
  }

  @override
  void dispose() {
    _serialPort.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Serial Communication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Connected: ${_serialPort.isOpen}'),
            ElevatedButton(
              onPressed: () async {
                String data = (await _serialPort.read(1024)) as String;
                print('Received: $data');
              },
              child: Text('Read Data'),
            ),
            ElevatedButton(
              onPressed: () async {
                String data = 'Hello, Serial Port!';
                await _serialPort.write(data as Uint8List);
              },
              child: Text('Write Data'),
            ),
          ],
        ),
      ),
    );
  }
}