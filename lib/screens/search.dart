import 'package:newsapp/main.dart';
import 'package:newsapp/providers/search_provider.dart';
import 'package:newsapp/screens/detail.dart';
import 'package:newsapp/widgets/news_list_card.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController(text: '');
  @override
  void initState() {
    super.initState();
    // searchProvider.searchNews(context, "");
  }

  void handleSearch(text) {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);

    searchProvider.searchNews(context, text);
  }

  void clearKeyword() {
    controller.text = '';
  }

  Widget buildHeader() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 16),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        Expanded(
          child: Parent(
            style: ParentStyle()
              ..background.color(const Color.fromRGBO(240, 238, 248, 1))
              ..borderRadius(all: 8)
              ..margin(
                vertical: 13,
                right: 16,
              ),
            child: TextField(
              controller: controller,
              onSubmitted: handleSearch,
              decoration: InputDecoration(
                hintText: "Search...",
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(13),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: InkWell(
                  onTap: clearKeyword,
                  child: Icon(
                    Icons.close_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
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
                pageBuilder: (_, __, ___) => Detail(detail: data[index]),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildHeader(),
            provider.isLoading
                ? CircularProgressIndicator()
                : buildNewsList(provider.news),
          ],
        ),
      ),
    );
  }
}
