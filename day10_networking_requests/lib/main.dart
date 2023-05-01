import 'package:day10_networking_requests/data_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _dataService = DataService();
  var _response;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Builder(builder: (context) {
            if (_response != null) {
              return Text(_response);
            }else{
              return ElevatedButton(
                onPressed: _makeReq,
                child: const Text("Make Request"),
              );
            }
          }),
        ),
      ),
    );
  }

  void _makeReq() async {
    final response = await _dataService.makeReqToApi();
    setState(() {
      _response = response;
    });
  }
}
