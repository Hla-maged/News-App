import 'package:flutter/material.dart';
import 'package:news_app/models/item_model.dart';
import 'package:news_app/widgets/item.dart';

class ItemListView extends StatelessWidget {
  @override
  List<Item> items = [
    Item(image: 'assets/news.jpg', name: 'general'),
    Item(image: 'assets/sports.jpg', name: 'sports'),
    Item(image: 'assets/nature.jpg', name: 'entertainment'),
    Item(image: 'assets/health.jpg', name: 'health'),
    Item(image: 'assets/technology.jpg', name: 'technology'),
    Item(image: 'assets/science.jpg', name: 'science'),
  ];
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ItemCard(
              item: items[index],
            );
          }),
    );
  }
}
