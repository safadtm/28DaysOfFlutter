import 'package:day11_weather_app/data_service.dart';
import 'package:day11_weather_app/models.dart';
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
  final _cityTextController = TextEditingController();
  final _dataService = DataService();
  WeatherResponse? _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_response != null)
                Column(
                  children: [
                    Image.network(_response!.iconUrl),
                    Text(
                      _response!.tempInfo.temperature.toString(),
                      style: const TextStyle(fontSize: 40),
                    ),
                    Text(_response!.weatherInfo.description),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: SizedBox(
                  width: 250,
                  child: TextField(
                    controller: _cityTextController,
                    decoration: const InputDecoration(labelText: "City"),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _search,
                child: const Text("Search"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    print(response.cityname);
    print(response.tempInfo.temperature);
    print(response.weatherInfo.description);
    setState(() {
      _response = response;
    });
  }
}
