import 'package:flutter/material.dart';
import "package:webview_universal/webview_universal.dart";


//webview 全平台
void main(List<String> args) {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  WebViewController webViewController = WebViewController();

  @override
  void initState() {
    super.initState();
    webViewController.init(
      context: context,
      setState: setState,
      uri: Uri.parse("http://192.168.2.100/labms/cas/qr/showall"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        controller: webViewController,
      ),
    );
  }
}