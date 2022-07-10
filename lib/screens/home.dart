import 'package:newsapp/providers/home_provider.dart';
import 'package:newsapp/screens/detail_webview.dart';
import 'package:newsapp/screens/search.dart';
import 'package:newsapp/widgets/news_list_card.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    homeProvider.getHeadlines(context);
  }

  Widget buildHeader() {
    return Parent(
      style: ParentStyle()
        ..margin(
          vertical: 10,
          horizontal: 16,
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Discover",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "News from all over the world",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "search");
            },
            child: Parent(
              style: ParentStyle()
                ..background.color(Color.fromRGBO(240, 238, 248, 1))
                ..padding(horizontal: 8, vertical: 8)
                ..borderRadius(all: 8)
                ..margin(bottom: 10),
              child: Row(
                children: const [
                  Icon(
                    Icons.search_outlined,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Search',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildNewsList(data) {
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => NewsListCard(
          item: data[index],
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(seconds: 1),
                pageBuilder: (_, __, ___) => DetailWebView(data[index].url),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildHeader(),
            buildNewsList(provider.news),
          ],
        ),
      ),
    );
  }
}
