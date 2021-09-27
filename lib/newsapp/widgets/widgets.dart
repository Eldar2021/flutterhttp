import 'package:flutter/material.dart';
import 'package:sabak0901/newsapp/models/news.dart';


class MyNewsWidget extends StatelessWidget {
  const MyNewsWidget({required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(news.name),
                  Text(news.published),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(news.urlImage),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(news.author),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(news.description),
            ),
          ],
        ),
      ),
    );
  }
}