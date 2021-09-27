import 'package:sabak0901/weatherapp/models/weather.dart';

class WeatherFakeData {
  Future<WeatherModel> getFakeWeatherModel(String city) async {
    // WeatherModel кайтарган city аттуу текст алган getFakeWeatherModel функция кур
    return await Future.delayed(Duration(seconds: 1), () {
      // ушунда суроо бар ??
      WeatherModel weatherModel = WeatherModel(
          id: 1000, cityName: city, windSpeed: 1.5, celcius: 11.05);
      return weatherModel;
    });
  }
}

final WeatherFakeData weatherFakeData = WeatherFakeData();