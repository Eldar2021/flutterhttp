import 'package:http/http.dart' as http;
import 'package:sabak0901/weatherapp/enums/databasetype.dart';
import 'package:sabak0901/weatherapp/models/weather.dart';
import 'package:sabak0901/weatherapp/services/weatherfakedata.dart';
import 'package:sabak0901/weatherapp/services/weatherservices.dart';

class WeatherRepo{
  final DatabaseType databaseType = DatabaseType.API;
  // DatabaseType тибинен DatabaseType.API болгон databaseType атту обьект жарат
  Future <String> getCityName(double latitude, double longitude) async{
    // String кайтарган getCityName аттуу озуно latitude атту болчок сан жана longitude аттуу бочок сан алган функция кур
    return await weatherServices.getCityName(latitude, longitude);
    // алган latitude, longitude терди weatherServices тин getCityName методуна бер да анын иштелишин кутуп кайтар
  }

  Future<http.Response> getWeatherData(String city)async{
    // http.Response кайтарган getWeatherData аттуу озуно city аттуу текст алган функция кур
    return await weatherServices.gerWeatherData(city);
    // алган текстти weatherServices тин gerWeatherData методуна бер да анын иштелишин кутуп кайтар
  }

  Future<WeatherModel> getWeatherModel(String city) async{
    // hWeatherModel кайтарган getWeatherModel аттуу озуно city аттуу текст алган функция кур
    // ignore: unrelated_type_equality_checks
    if (DatabaseType == DatabaseType.FAKE){
      // эгер DatabaseType тиби FAKE болсо
      return weatherFakeData.getFakeWeatherModel(city);
      // алган текстти weatherFakeData тин getFakeWeatherModel методуна бер да анын иштелишин кутуп кайтар
    }else{
      // андай болбосо
      return weatherServices.getWeatherModel(city);
      // алган текстти weatherServices тин getWeatherModel методуна бер да анын иштелишин кутуп кайтар
    }
  }
}

final WeatherRepo weatherRepo = WeatherRepo();