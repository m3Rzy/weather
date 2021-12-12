import 'dart:convert';

import 'package:weather_app/weather.dart';

import 'package:http/http.dart' as http;

Future<Weather?> getCurrentWeather() async {
  Weather? weather;
  // ключ bb5a4369565ef4017d0fc442e6336c37
  var url =
      "https://api.openweathermap.org/data/2.5/weather?q=Leningrad&units=metric&appid=bb5a4369565ef4017d0fc442e6336c37";

  final response = await http.get(Uri.parse(url));
  print("=================================================== Запрос к АПИ №1");
  print(jsonDecode(response.body));
  print("===================================================");

  if (response.statusCode == 200) {
    weather = Weather.fromJSON(jsonDecode(response.body));
  } else {
    weather = null;
  }
  return weather;
}

Future<List<WeatherForHours?>?> getWeatherHourly() async {
  List<WeatherForHours?> weathers;
  Weather? weather;
  var url2 =
      "https://api.openweathermap.org/data/2.5/weather?q=Leningrad&units=metric&appid=bb5a4369565ef4017d0fc442e6336c37";
  final response = await http.get(Uri.parse(url2));

  weather = Weather.fromJSON(jsonDecode(response.body));
  // var url1 =
  //     "https://api.openweathermap.org/data/2.5/weather?q=Leningrad&units=metric&appid=bb5a4369565ef4017d0fc442e6336c37";

  // final response1 = await http.get(Uri.parse(url1));
  // //var responseJSON = jsonDecode(response1.body);
  //print(jsonDecode(response.body));
  print('КОООООООООООООООООООООООООО');
  var local_lat = weather.lat;
  var local_lon = weather.lon;
  var url =
      // openweather key bb5a4369565ef4017d0fc442e6336c37
      'https://api.openweathermap.org/data/2.5/onecall?lat=$local_lat&lon=$local_lon&exclude=current,minutely,daily,alerts&appid=bb5a4369565ef4017d0fc442e6336c37';
  //https://api.openweathermap.org/data/2.5/onecall?lat=59&lon=30&exclude=hourly,daily&appid=bb5a4369565ef4017d0fc442e6336c37

  // 59, 30
  print(local_lat);
  print(local_lon);

  weathers = [];
  final response2 = await http.get(Uri.parse(url));

  if (response2.statusCode == 200) {
    //print(jsonDecode(response2.body));
    var weathers = jsonDecode(response2.body);
    print(weathers);
    //print(weathers);

    

    //var weather_new = jsonDecode(response2.body);

    //var buf = WeatherForHours.fromJSON(weather_new["hourly"][1]);
    print('----------------------------- код только до сюда идёт');
    //var mass = WeatherForHours.fromJSON(jsonDecode(response2.body)); //[i]

    //var buf = WeatherForHours.fromJSON(weather_new["hourly"][1]);

    //weathers.add(buf);

    return weathers;
  } else {
    weathers = [];
  }
  return weathers;
}
