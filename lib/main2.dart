import 'package:flutter/material.dart';
import "package:webview_universal/webview_universal.dart";

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
    WebPreferences webPreferences = WebPreferences(javascript: true); // 添加这一行
    webViewController.init(
      context: context,
      setState: setState,
      uri: Uri.parse("http://192.168.2.100/labms"),
      webPreferences: webPreferences, // 将webPreferences传递给WebViewController
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