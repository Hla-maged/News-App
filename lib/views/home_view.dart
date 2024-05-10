import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_mode.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/item.dart';
import 'package:news_app/widgets/item_list_view.dart';
import 'package:news_app/widgets/news_items.dart';
import 'package:news_app/widgets/news_items_listview.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              'Cloud',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
          SliverToBoxAdapter(
            child: ItemListView(),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 25,
          )),
          NewsItemListBuilder(item: 'general',),
        ]),
      ),
    );
  }
}

class NewsItemListBuilder extends StatefulWidget {
 
  final String item;
   NewsItemListBuilder({required this.item});
  @override
  State<NewsItemListBuilder> createState() => _NewsItemListBuilderState();
}

class _NewsItemListBuilderState extends State<NewsItemListBuilder> {
  var f;
  @override
  void initState() {
    super.initState();
    f = NewsService(dio: Dio()).getNews(item:widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: f,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsItemList(articles: snapshot.data!);
          } else if (snapshot.hasError) {
            return SliverToBoxAdapter(
                child:
                    Center(child: Text('Opps there was an error, try again.')));
          } else {
            return SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          }
        });
  }
}
