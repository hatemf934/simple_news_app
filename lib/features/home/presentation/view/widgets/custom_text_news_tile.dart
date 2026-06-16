import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/padding_manager.dart';

class CustomTextNewsTile extends StatelessWidget {
  const CustomTextNewsTile(
      {super.key, required this.textTile, required this.styleTile});
  final String textTile;
  final TextStyle styleTile;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p8),
      child: Text(
        textTile,
        style: styleTile,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
