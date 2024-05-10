import 'package:flutter/material.dart';
import 'package:news_app/views/home_view.dart';

class ItemView extends StatelessWidget {
  ItemView({required this.item});
  final String item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NewsItemListBuilder(
            item: item,
          ),
        ],
      ),
    );
  }
}
