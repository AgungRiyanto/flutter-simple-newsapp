import 'package:newsapp/widgets/news_list_card.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

import '../models/news.dart';

class Detail extends StatefulWidget {
  final News detail;
  const Detail({Key? key, required this.detail}) : super(key: key);

  @override
  _DetailState createState() => _DetailState(detail: detail);
}

class _DetailState extends State<Detail> {
  late final News detail;
  _DetailState({required this.detail});
  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Parent(
          style: ParentStyle()..margin(vertical: 16, horizontal: 16),
          child: Row(
            children: [
              InkWell(
                child: const Icon(Icons.arrow_back_ios),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                "Detail",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
        ),
        Hero(
          tag: detail.title ?? "",
          child: Image.network(
            detail.urlToImage ?? "https://images.wsj.net/im-568851/social",
            width: double.maxFinite,
            height: 300,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }

  Widget buildContent() {
    return Parent(
      style: ParentStyle()..padding(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detail.title ?? "",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(Icons.people),
              const SizedBox(
                width: 5,
              ),
              Flexible(child: Text(detail.author ?? "")),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(detail.content ?? "")
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: ListView(
            children: [buildHeader(), buildContent()],
          ),
        ),
      ),
    );
  }
}
