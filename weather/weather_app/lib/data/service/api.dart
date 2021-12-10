import 'dart:convert';

import 'package:weather_app/weather.dart';

import 'package:http/http.dart' as http;

Future<Weather?> getCurrentWeather() async {
    Weather? weather;
    // ключ bb5a4369565ef4017d0fc442e6336c37
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=Leningrad&units=metric&appid=bb5a4369565ef4017d0fc442e6336c37";

    final response = await http.get(Uri.parse(url));

    print(jsonDecode(response.body));

    print("===================================================Запрос к АПИ №1");

    if (response.statusCode == 200) {
      weather = Weather.fromJSON(jsonDecode(response.body));
    } else {
      weather = null;
    }
    return weather;
  }

  Future<List<WeatherForHours?>?> getWeatherHourly() async {
    List<WeatherForHours?> weathers;

    var url1 =
        "https://api.openweathermap.org/data/2.5/weather?q=Leningrad&units=metric&appid=bb5a4369565ef4017d0fc442e6336c37";

    final response1 = await http.get(Uri.parse(url1));
    var responseJSON = jsonDecode(response1.body);
    var lat = responseJSON['coord']['lat'];
    var lon = responseJSON['coord']['lon'];

    var url2 = //api.weatherbit.io/v2.0/forecast/daily?postal_code=195252&key=7d214942457c4a7daae17a15d9b46f75
    // openweather key bb5a4369565ef4017d0fc442e6336c37
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely,daily&appid=bb5a4369565ef4017d0fc442e6336c37'; //темпа на каждый день

    weathers = [];
    final response2 = await http.get(Uri.parse(url2));
    print('Запрос к АПИ времени');
    print(jsonDecode(response2.body));

    if (response2.statusCode == 200) {
      var weather = jsonDecode(response2.body);
      for (int i = 0; i <= 7; i) {
        print(i.toString() + "------------------------");
        print(weather["hourly"][i]);
        var buf = WeatherForHours.fromJSON(weather["hourly"][i]);
        
        weathers.add(buf);
      }
      return weathers;
    } else {
      weathers = [];
    }
    return null;
  }