import 'package:better_news/data/models/news.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  final News news;
  const NewsPage({Key? key, required this.news}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.news.title!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.news.content!,
                style: const TextStyle(fontSize: 24.0),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(80.0),
                child: Image.network(widget.news.photoUrl!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
