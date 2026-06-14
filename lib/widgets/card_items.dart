import 'package:flutter/material.dart';
import 'package:news_apps/models/card_model.dart';
import 'package:news_apps/views/cardview.dart';

class CardItems extends StatelessWidget {
  const CardItems({super.key, required this.card});
  final CardModel card;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Cardview.id,
          arguments: card,
        );
      },
      child: Container(
        height: 100,
        width: 160,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            // color: Colors.amber,
            image: DecorationImage(
              image: AssetImage(card.image),
              fit: BoxFit.fill,
            )),
        child: Center(
            child: Text(
          card.nameImage,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
