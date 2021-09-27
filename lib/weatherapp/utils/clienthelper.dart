import 'package:http/http.dart' as http;
import 'package:sabak0901/weatherapp/constants/constants.dart';

class ClientHelper {
  final client = http.Client();
  // client атту озгоулмого http.Client(); ти бер (http китеп канасынан келет)

  Future<http.Response> get(String endpoint) async {
    // http.Response кайтарган get аттуу endpoint текст ала турган функция кур
    String url = MyWeatherApi.baseUrl + endpoint;
    // url аттуу озгорулмого MyWeatherApi теги baseUrl ди жана endpoint ти кошуп бер
    Uri uri = Uri.parse(url);
    // Uri жардамы менен аны парсе кыл (интернет ссылкасына байланыш)
    final response = await client.get(uri);
    // андагы апилерди response бер
    return _getResponse(response);
    // response ни кайтар
  }

  Future<http.Response> post(
      String endpoint, Map<String, String> headers) async {
    // http.Response кайтарган get аттуу endpoint текст ала турган функция кур
    String url = MyWeatherApi.baseUrl + endpoint;
    // url аттуу озгорулмого MyWeatherApi теги baseUrl ди жана endpoint ти кошуп бер
    Uri uri = Uri.parse(url);
    // Uri жардамы менен аны парсе кыл (интернет ссылкасына байланыш)
    final response = await client.post(uri, headers: headers);
    // андагы апилерди response бер
    return _getResponse(response);
    // response ни кайтар
  }

  http.Response _getResponse(http.Response response) {
    // http.Response кайтарган _getResponse аттуу response   ала турган функция кур
    if (response.statusCode == 200 || response.statusCode == 201) {
      // эгер бизге келген response нин statusCode ду (интернет менен байланышы) 200 же 201 болсо
      return response;
      // response ни бер
    } else {
      // эгер андай болбосо
      print("ClientHelper de kata bar");
      // ClientHelper de kata bar деп  жаз
      return response;
    }
  }
}

final ClientHelper clientHelper = ClientHelper();
