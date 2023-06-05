import 'package:day28_calender_picker/calender_picker_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalenderNotifier(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FlutteCalenderPickerView(),
      ),
    );
  }
}
