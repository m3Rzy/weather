class Weather {
  final double temp;
  final double feels_like;
  final double speed;
  final double pressure;
  final double humidity;
  final double lat;
  final double lon;


  Weather({required this.temp, required this.feels_like, required this.speed, required this.pressure, required this.humidity, required this.lat, required this.lon});

  factory Weather.fromJSON(Map<String, dynamic> json) {
    return Weather(
      temp: double.parse(json["main"]["temp"].toString()),
      feels_like: double.parse(json["main"]["feels_like"].toString()),
      speed: double.parse(json["wind"]["speed"].toString()),
      pressure: double.parse(json["main"]["pressure"].toString()),
      humidity: double.parse(json["main"]["humidity"].toString()),
      lat: double.parse(json["coord"]["lat"].toString()),
      lon: double.parse(json["coord"]["lon"].toString()),
      
    );
  }
}

class WeatherForHours {
  //final String description;
  final double temp;

  WeatherForHours({required this.temp});

  factory WeatherForHours.fromJSON(Map<String, dynamic> json) {
    return WeatherForHours(
      temp: double.parse(json["hourly"]["temp"].toString().split('.')[0]),
      
    );
  }
}
