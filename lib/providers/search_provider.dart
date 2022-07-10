import 'package:newsapp/models/news.dart';
import 'package:newsapp/services/api.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  HttpService httpService = HttpService();
  bool isLoading = false;
  List<News> news = [];

  searchNews(context, q) async {
    isLoading = true;
    news = await httpService.searchNews(q);
    isLoading = false;

    notifyListeners();
  }
}
