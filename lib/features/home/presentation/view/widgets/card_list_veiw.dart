import 'package:flutter/material.dart';
import 'package:news_apps/constant.dart';
import 'package:news_apps/core/utils/height_manager.dart';
import 'package:news_apps/features/home/presentation/view/widgets/card_items.dart';

class CardListVeiw extends StatelessWidget {
  const CardListVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HeightManager.h100,
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
