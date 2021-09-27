import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sabak0901/newsapp/models/news.dart';
import 'package:sabak0901/newsapp/widgets/widgets.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({required this.newsList});

  final List<News> newsList;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: ListView.builder(
        itemCount: widget.newsList.length,
        itemBuilder: (context, index) {
          News news = widget.newsList[index];
          return MyNewsWidget(news: news);
        },
      ),
    );
  }
}

