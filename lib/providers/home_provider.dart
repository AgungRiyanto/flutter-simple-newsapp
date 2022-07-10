import 'package:newsapp/models/news.dart';
import 'package:newsapp/services/api.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  HttpService httpService = HttpService();
  bool isLoading = false;
  List<News> news = [];

  getHeadlines(context) async {
    isLoading = true;
    news = await httpService.getTopHeadLines();
    isLoading = false;

    notifyListeners();
  }
}
