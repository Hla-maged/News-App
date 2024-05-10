import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:news_app/models/article_mode.dart';

class NewsService {
  final Dio dio;
  NewsService({required this.dio});

  Future<List<ArticleModel>> getNews({required String item}) async {
    //method that will return list of articleData of Articlodel
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=685530d363784bb598efcb97a2410753&category=$item');
      Map<String, dynamic> jasonData = response.data;
      List<dynamic> articles =
          jasonData['articles']; // return list of maps'articles --our data'
      List<ArticleModel> articleL =
          []; //create list to store every article as an object with attributes
      for (var elemnt in articles) {
        ArticleModel articleModel = ArticleModel.fromjson(elemnt);
        articleL.add(articleModel);
      }
      ;
      return articleL;
    } catch (e) {
      return [];
    }
  }
}
