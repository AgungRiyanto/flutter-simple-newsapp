import 'package:newsapp/screens/detail.dart';
import 'package:newsapp/screens/detail_webview.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'dart:async';

import '../models/news.dart';

class NewsListCard extends StatelessWidget {
  final News item;
  final void Function() onTap;

  const NewsListCard({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Parent(
        style: ParentStyle()..margin(horizontal: 16, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: item.title ?? "",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  width: 80,
                  height: 80,
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    item.urlToImage ??
                        "https://images.wsj.net/im-568851/social",
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    item.description ?? "",
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  Text(
                    timeago
                        .format(DateTime.parse(item.publishedAt ?? ""))
                        .toString(),
                    style: const TextStyle(
                      fontSize: 11,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
