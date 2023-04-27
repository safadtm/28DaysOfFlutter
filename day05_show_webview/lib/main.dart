import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final WebViewController _controller;
  @override
  void initState() {
    super.initState();

    final WebViewController controller = WebViewController();
    controller.loadRequest(Uri.parse("https://flutter.dev"));
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter WebView example"),
        ),
        body: WebViewWidget(controller: _controller),
      ),
    );
  }
}
