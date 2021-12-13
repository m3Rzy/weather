import 'dart:convert';

import 'package:weather_app/weather.dart';

import 'package:http/http.dart' as http;

Future<Weather?> getCurrentWeather() async {
  Weather? weather;
  var url =
      "https://api.openweathermap.org/data/2.5/weather?q=Leningrad&units=metric&appid=bb5a4369565ef4017d0fc442e6336c37";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    weather = Weather.fromJSON(jsonDecode(response.body));
  } else {
    weather = null;
  }
  return weather;
}

Future<List<WeatherForHours?>> getFilesList() async {
  List<WeatherForHours?> fileslist;
  Weather? files;

  var url =
      "https://api.openweathermap.org/data/2.5/weather?q=Leningrad&units=metric&appid=bb5a4369565ef4017d0fc442e6336c37";

  final response = await http.get(Uri.parse(url));

  files = Weather.fromJSON(jsonDecode(response.body));
  var local_lat = files.lat;
  var local_lon = files.lon;
  var url2 =
      "https://api.openweathermap.org/data/2.5/onecall?lat=$local_lat&lon=$local_lon&exclude=current,minutely,daily,alerts&units=metric&appid=bb5a4369565ef4017d0fc442e6336c37";
  fileslist = [];

  final response2 = await http.get(Uri.parse(url2));

  if (response2.statusCode == 200) {
    var files = jsonDecode(response2.body);
    for (int i = 5; i < 24; i += 6) {
      fileslist.add(WeatherForHours.fromJSON(files["hourly"][i]));
    }
  } else {
    fileslist = [];
  }
  return fileslist;
}
