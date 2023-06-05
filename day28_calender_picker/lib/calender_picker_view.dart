import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CalenderNotifier extends ChangeNotifier {
  DateTime? pickedDate = DateTime.now();

  void setPickedDate({required DateTime dateTime}) {
    pickedDate = dateTime;
    notifyListeners();
  }
}

class FlutteCalenderPickerView extends StatelessWidget {
  const FlutteCalenderPickerView({super.key});

  @override
  Widget build(BuildContext context) {
    CalenderNotifier calenderNotifier({required bool renderUI}) =>
        Provider.of<CalenderNotifier>(context, listen: renderUI);

    String rendervalue() {
      var format = DateFormat.yMd();
      var dateString =
          format.format(calenderNotifier(renderUI: true).pickedDate!);
      return dateString;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Flutter Calender"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Flutter date picker",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 400,
            width: 500,
            child: CupertinoTheme(
              data: const CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                  dateTimePickerTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (value) {
                  debugPrint(value.toString());
                  calenderNotifier(renderUI: false)
                      .setPickedDate(dateTime: value);
                },
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                rendervalue(),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
