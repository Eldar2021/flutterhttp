import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sabak0901/weatherapp/constants/constants.dart';
import 'package:sabak0901/weatherapp/models/weather.dart';
import 'package:sabak0901/weatherapp/utils/clienthelper.dart';

class WeatherServices{
  Future<String> getCityName(double latitude, double longitude) async{
    // String кайтарган latitude жана longitude аттуу болчок сан алган getCityName аттуу функция кур
    final endpoint = "weather?lat=$latitude&lon=$longitude&appid=${MyWeatherApi.openWeatherApiKey}";
    // endpoint озгорулмого ссылканы бердик
    final response = await clientHelper.get(endpoint);
    // ал ссылканы clientHelper дин get методуна бердик да андан келен жоопту response го котордук
    return response.toString();//
    // response текст турундо бер
  }
  Future<http.Response> gerWeatherData(String city) async{
    // http.Response кайтарган  city аттуу текст алган getCityName аттуу функция кур
    String endpoint = "weather?q=$city&appid=${MyWeatherApi.openWeatherApiKey}";
    // endpoint озгорулмого ссылканы бердик
    return await clientHelper.get(endpoint);
    // ал ссылканы clientHelper дин get методуна бердик да андан келен жоопту response го котордук
  }
  Future<WeatherModel> getWeatherModel(String city) async{
    // WeatherModel кайтарган  city аттуу текст алган getWeatherModel аттуу функция кур
    String endpoint = "weather?q=$city&appid=${MyWeatherApi.openWeatherApiKey}";
    // endpoint озгорулмого ссылканы бердик
    http.Response response = await clientHelper.get(endpoint);
    // ал ссылканы clientHelper дин get методуна бердик да андан келен жоопту response го котордук
    Map<String, dynamic> data = json.decode(response.body);
    // String, dynamic тибинде Map куруп келген жоопдун денесин json.decode(интернеттен келген маалыматты декод кылат) кылып Мар ке бер
    WeatherModel weatherModel = WeatherModel.fromMap(data);
    // WeatherModel тибинде  weatherModel куруп ага json дон келген даталарды бер
    return weatherModel;
  }
}

final WeatherServices weatherServices = WeatherServices();