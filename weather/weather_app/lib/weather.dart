class Weather {
  final double temp;
  final double feels_like;

  Weather({required this.temp, required this.feels_like});

  factory Weather.fromJSON(Map<String, dynamic> json) {
    return Weather(
      temp: double.parse(json["main"]["temp"].toString()),
      feels_like: double.parse(json["main"]["feels_like"].toString()),
    );
  }
}

class WeatherForHours {
  final String description;
  final double temp_day;

  WeatherForHours({required this.temp_day, required this.description});

  factory WeatherForHours.fromJSON(Map<String, dynamic> json) {
    return WeatherForHours(
      temp_day: double.parse(json["temp"].toString()),
      description: json["weather"]["description"].toString(),
    );
  }
}
