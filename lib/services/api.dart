import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:newsapp/models/news.dart';

class HttpService {
  final String baseUrl = "https://newsapi.org/v2/";
  final String apiKey = "d13a7b6467d44d7883ac9076e15986ed";
  final Dio dio = Dio();

  Future<List<News>> getTopHeadLines() async {
    Response res =
        await dio.get(baseUrl + 'top-headlines?sources=espn&apiKey=$apiKey');

    try {
      return (res.data['articles'] as List)
          .map((x) => News.fromJson(x))
          .toList();
    } on DioError catch (e) {
      if (e.response != null) {
        throw "e.response?.statusCode.";
      } else {
        // Error due to setting up or sending the request
        throw "${e.message}";
      }
    }
  }

  Future<List<News>> searchNews(String q) async {
    Response res = await dio.get(baseUrl + 'everything?q=$q&apiKey=$apiKey');

    try {
      return (res.data['articles'] as List)
          .map((x) => News.fromJson(x))
          .toList();
    } on DioError catch (e) {
      if (e.response != null) {
        throw "e.response?.statusCode.";
      } else {
        // Error due to setting up or sending the request
        throw "${e.message}";
      }
    }
  }
}
