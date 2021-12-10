// To parse this JSON data, do
// final news = newsFromJson(jsonString);

import 'dart:convert';

List<News> newsFromJson(String str) => List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

String newsToJson(List<News> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class News {
    News({
        this.title,
        this.content,
        this.photoUrl,
    });

    String? title;
    String? content;
    String? photoUrl;

    factory News.fromJson(Map<String, dynamic> json) => News(
        title: json["title"],
        content: json["content"],
        photoUrl: json["photo_url"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "photo_url": photoUrl,
    };
}
