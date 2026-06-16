import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_apps/core/utils/color_manager.dart';
import 'package:news_apps/core/utils/raduis_manager.dart';
import 'package:news_apps/core/utils/styles.dart';
import 'package:news_apps/core/utils/text_manager.dart';
import 'package:news_apps/features/home/data/models/news_model.dart';

class ArticleMetaRow extends StatelessWidget {
  const ArticleMetaRow({
    super.key,
    required this.news,
  });
  final NewsModel news;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: ColorManager.softRed.withOpacity(0.15),
            borderRadius: BorderRadius.circular(RadiusManager.r4),
            border: Border.all(
              color: ColorManager.softRed.withOpacity(0.4),
              width: 0.8,
            ),
          ),
          child: Center(
            child: Text("sports".toUpperCase(), style: Styles.textStyleBold15),
          ),
        ),
        const SizedBox(width: 8),
        _dot(),
        const SizedBox(width: 8),
        Text(DateFormat('MMMM d, yyyy').format(news.publishedAt),
            style: Styles.textStyle15.copyWith(
              color: ColorManager.mediumGrey,
            )),
      ],
    );
  }

  Widget _dot() => const Text(TextManager.dot, style: Styles.textStyle11);
}
