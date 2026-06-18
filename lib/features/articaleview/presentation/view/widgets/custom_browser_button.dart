import 'package:flutter/material.dart';
import 'package:news_hub/core/helper/open_in_browser.dart';
import 'package:news_hub/core/utils/color_manager.dart';
import 'package:news_hub/core/utils/font_manager.dart';
import 'package:news_hub/core/utils/padding_manager.dart';
import 'package:news_hub/core/utils/raduis_manager.dart';
import 'package:news_hub/core/utils/styles.dart';
import 'package:news_hub/core/utils/text_manager.dart';
import 'package:news_hub/core/utils/width_manager.dart';
import 'package:news_hub/features/home/data/models/news_model.dart';

class CustomButtonBrowser extends StatelessWidget {
  const CustomButtonBrowser({super.key, required this.news});
  final NewsModel news;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openInBrowser(news.url, context),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: PaddingManager.p14, vertical: PaddingManager.p12),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.circular(RadiusManager.r8),
          border: Border.all(color: Theme.of(context).primaryColor, width: 0.5),
        ),
        child: Row(
          children: [
            Icon(Icons.language_rounded,
                color: Theme.of(context).primaryColorLight,
                size: FontManager.font24),
            const SizedBox(width: WidthManager.w10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(TextManager.openInBrowser,
                      style: Styles.textStyle18.copyWith(
                          color: ColorManager.lightGrey,
                          fontWeight: FontWeight.bold)),
                  Text(news.sourceModel.name,
                      style: Styles.textStyle15.copyWith(
                          color: Theme.of(context).primaryColorLight)),
                ],
              ),
            ),
            Icon(Icons.open_in_new_rounded,
                color: Theme.of(context).primaryColorLight,
                size: FontManager.font24),
          ],
        ),
      ),
    );
  }
}
