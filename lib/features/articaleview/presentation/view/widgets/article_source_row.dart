import 'package:flutter/material.dart';
import 'package:news_hub/core/utils/color_manager.dart';
import 'package:news_hub/core/utils/height_manager.dart';
import 'package:news_hub/core/utils/styles.dart';
import 'package:news_hub/core/utils/width_manager.dart';
import 'package:news_hub/features/home/data/models/news_model.dart';

class ArticleSourceRow extends StatelessWidget {
  const ArticleSourceRow({
    super.key,
    required this.news,
  });
  final NewsModel news;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: WidthManager.w37,
          height: HeightManager.h37,
          decoration: BoxDecoration(
            color: ColorManager.softRed.withAlpha(51),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            news.sourceModel.name[0].toUpperCase(),
            style: Styles.textStyle19.copyWith(color: ColorManager.softRed),
          ),
        ),
        const SizedBox(width: 8),
        Text(news.sourceModel.name,
            style: Styles.textStyleBold15
                .copyWith(color: ColorManager.mediumGrey)),
      ],
    );
  }
}
