import 'package:flutter/material.dart';
import 'package:news_app/models/item_model.dart';
import 'package:news_app/views/item_view.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  ItemCard({required this.item});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ItemView(item:item.name);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
          height: 120,
          width: 180,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(item.image), fit: BoxFit.fill),
              color: Colors.black,
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              item.name,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
