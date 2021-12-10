// ignore_for_file: avoid_print

import 'package:better_news/data/models/news.dart';
import 'package:http/http.dart' as http;

class APIService {
  //get news from the API

  static Future<Map<String, dynamic>> getNews() async {
    try {
      http.Response _apiResponse = await http.get(
          Uri.parse(
              "https://script.google.com/macros/s/AKfycbyagLXxnJcmwl-2lkfnD3CweR2ox3U6Y3VJTEQZog0qLsCcm9qJ/exec"),
          headers: {'Accept': 'application/json'});
      print(_apiResponse.body);
      if (_apiResponse.statusCode == 200) {
        final news = newsFromJson(_apiResponse.body);
        return {
          "status": true,
          "message": "News fetched successfully.",
          "data": news
        };
      } else {
        return {
          "status": false,
          "message": "Error in fetching news.",
        };
      }
    } on Exception catch (e) {
      return {
        "status": false,
        "message": "Error in fetching plans.\n${e.toString()}.",
      };
    }
  }
}
