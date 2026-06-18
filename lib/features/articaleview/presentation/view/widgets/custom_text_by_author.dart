import 'package:flutter/material.dart';
import 'package:news_hub/core/utils/color_manager.dart';
import 'package:news_hub/core/utils/styles.dart';
import 'package:news_hub/core/utils/text_manager.dart';
import 'package:news_hub/features/home/data/models/news_model.dart';

class CustomTextByAutor extends StatelessWidget {
  const CustomTextByAutor({super.key, required this.news});
  final NewsModel news;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: TextManager.byAuthor,
              style:
                  Styles.textStyle19.copyWith(color: ColorManager.mediumGrey)),
          TextSpan(
              text: news.author ?? TextManager.noAuthor,
              style: Styles.textStyle16),
        ],
      ),
    );
  }
}
