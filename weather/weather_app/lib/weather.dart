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
