import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/color_manager.dart';
import 'package:news_apps/core/utils/height_manager.dart';
import 'package:news_apps/core/utils/padding_manager.dart';
import 'package:news_apps/core/utils/raduis_manager.dart';
import 'package:news_apps/core/utils/styles.dart';
import 'package:news_apps/core/utils/width_manager.dart';
import 'package:news_apps/core/models/card_model.dart';
import 'package:news_apps/features/cards/presentation/view/cardview.dart';

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
        height: HeightManager.h100,
        width: WidthManager.w160,
        margin: const EdgeInsets.symmetric(horizontal: PaddingManager.p8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusManager.r8),
          image: DecorationImage(
            image: AssetImage(card.image),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Text(
            card.nameImage,
            style: Styles.textStyle15.copyWith(color: ColorManager.witheColor),
          ),
        ),
      ),
    );
  }
}
