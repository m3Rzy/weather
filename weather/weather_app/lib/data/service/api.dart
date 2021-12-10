import 'dart:convert';

import 'package:weather_app/weather.dart';

import 'package:http/http.dart' as http;

Future<Weather?> getCurrentWeather() async {
    Weather? weather;
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=Leningrad&units=metric&appid=bb5a4369565ef4017d0fc442e6336c37";

    final response = await http.get(Uri.parse(url));

    print(jsonDecode(response.body));

    print("zapors");

    if (response.statusCode == 200) {
      weather = Weather.fromJSON(jsonDecode(response.body));
    } else {
      weather = null;
    }
    return weather;
  }

  Future<List<WeatherForHours?>?> getWeatherHourly() async {
    List<WeatherForHours?> weathers;

    var url = //ключ d47ca48de00b43d5926125919210512
        "https://api.weatherbit.io/v2.0/forecast/daily?postal_code=195252&key=7d214942457c4a7daae17a15d9b46f75"; //темпа на каждый день

    weathers = [];
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var weather = jsonDecode(response.body);
      for (int i = 0; i < 4; i++) {
        weathers.add(WeatherForHours.fromJSON(weather["data"][i]));
      }
      return weathers;
    } else {
      weathers = [];
    }
    return null;
  }