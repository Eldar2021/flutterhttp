import 'package:http/http.dart' as http;
import 'package:sabak0901/newsapp/constants/constants.dart';
import 'dart:convert' as convert;

import 'package:sabak0901/newsapp/models/news.dart';

class NewsHelper {
  List<News> newsList = <News>[];
  Future<News?>? getNews() async {
    for (int i = 0; i <= 24; i++) {
      try {
        Uri url = Uri.parse(MyApi.myUrl1);
        http.Response response = await http.get(url);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var jsonResponse = await convert.jsonDecode(response.body);
          News news = News(
            name: jsonResponse["articles"][i]["source"]["name"],
            author: jsonResponse["articles"][i]["author"],
            title: jsonResponse["articles"][i]["title"],
            description: jsonResponse["articles"][i]["description"],
            newsUrl: jsonResponse["articles"][i]["url"],
            urlImage: jsonResponse["articles"][i]["urlToImage"],
            published: jsonResponse["articles"][i]["publishedAt"],
            content: jsonResponse["articles"][i]["content"],
          );
          print(news.author);
          newsList.add(news);
        } else {}
      } catch (e) {
        print("getNews kelgen errorum $e");
      }
    }
  }
}
