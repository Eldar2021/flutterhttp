class WeatherModel {
  final int id;
  final String cityName;
  final dynamic windSpeed;
  final double celcius;

  WeatherModel({
    required this.id,
    required this.cityName,
    required this.windSpeed,
    required this.celcius,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    // ушул жерде суроо бар???
    // WeatherModel ди  Мар менен толтурабыз
    print('map wind speed:' + map['wind']['speed'].runtimeType.toString());
    return WeatherModel(
      id: map["id"],
      cityName: map["name"],
      windSpeed: map["wind"]["speed"],
      celcius: (map["main"]["temp"] - 273.15),
    );
  }
}
