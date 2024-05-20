import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/models/article_mode.dart';
import 'package:news_app/models/item_model.dart';
import 'package:news_app/widgets/WebView.dart';

class NewsItem extends StatelessWidget {
  final ArticleModel articleModel;
  NewsItem({required this.articleModel});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        onDoubleTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return WebView(url: articleModel.url!);
          }));
        },
        child: 
      ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: articleModel.image != null
            ? Image.network(
                articleModel.image!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            : Image.asset(
                'assets/noImage.jpg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
      ),),
      Text(
        articleModel.title!,
        maxLines: 2,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      SizedBox(
        height: 1,
      ),
      Text(
        maxLines: 2,
        articleModel.subtitle ?? '',
        style: TextStyle(fontSize: 12, color: Colors.grey),
      ),
    ]);
  }
}
