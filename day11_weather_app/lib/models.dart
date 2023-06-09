/*
{
  "weather": [
    {      
      "description": "broken clouds",
      "icon": "04d"
    }
  ],  
  "main": {
    "temp": 26.9,
    
  },  
  "name": "Delhi",  
}

*/
class WeatherInfo {
  final String description;
  final String icon;
  WeatherInfo({required this.description, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json["description"];
    final icon = json["icon"];
    return WeatherInfo(description: description, icon: icon);
  }
}

class TemperatureInfo {
  final double temperature;
  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json["temp"];
    return TemperatureInfo(temperature: temperature);
  }
}

class WeatherResponse {
  final String cityname;
  final TemperatureInfo temperatureinfo;
  final WeatherInfo weatherinfo;

  String get iconUrl {
    return "https://openweathermap.org/img/wn/${weatherinfo.icon}@2x.png";
  }

  WeatherResponse({
    required this.cityname,
    required this.temperatureinfo,
    required this.weatherinfo,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityname = json["name"];

    final tempInfoJson = json["main"];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json["weather"][0];
    final weatherinfo = WeatherInfo.fromJson(weatherInfoJson);
    return WeatherResponse(
      cityname: cityname,
      temperatureinfo: tempInfo,
      weatherinfo: weatherinfo,
    );
  }
}
