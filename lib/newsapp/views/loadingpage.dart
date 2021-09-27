import 'package:flutter/material.dart';
import 'package:sabak0901/newsapp/utils/newshelper.dart';
import 'package:sabak0901/newsapp/views/homepage.dart';


class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  NewsHelper newsHelper = NewsHelper();

  void news() async {
    await newsHelper.getNews();
    if (newsHelper.newsList != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(newsList: newsHelper.newsList),
        ),
      );
    } else {
      print("Loading page tegi newsta kata bar");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    news();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading Page"),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
