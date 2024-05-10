import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_mode.dart';
import 'package:news_app/models/item_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_items.dart';

class NewsItemList extends StatelessWidget {
  final List<ArticleModel> articles;
  NewsItemList({required this.articles});
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: articles.length,
            (context, index) {
      return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: NewsItem(articleModel: articles[index]),
      );
    }));
  }
}
