import 'package:flutter/material.dart';
import 'package:news_apps/models/card_model.dart';
import 'package:news_apps/features/home/presentation/view/widgets/card_items.dart';

class CardListVeiw extends StatelessWidget {
  const CardListVeiw({super.key});
  final List<CardModel> card = const [
    CardModel(image: "assets/entertaiment.avif", nameImage: "Busines"),
    CardModel(image: "assets/health.avif", nameImage: "Healths"),
    CardModel(image: "assets/entertaiment.avif", nameImage: "Entertainment"),
    CardModel(image: "assets/science.avif", nameImage: "Sciences"),
    CardModel(image: "assets/entertaiment.avif", nameImage: "Sport"),
    CardModel(image: "assets/technology.jpeg", nameImage: "Technologys"),
    CardModel(image: "assets/entertaiment.avif", nameImage: "Generals"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: card.length,
          itemBuilder: (context, index) {
            return CardItems(
              card: card[index],
            );
          }),
    );
  }
}
