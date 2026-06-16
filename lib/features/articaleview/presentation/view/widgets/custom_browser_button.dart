import 'package:flutter/material.dart';
import 'package:news_apps/core/helper/open_in_browser.dart';
import 'package:news_apps/core/utils/color_manager.dart';
import 'package:news_apps/core/utils/font_manager.dart';
import 'package:news_apps/core/utils/padding_manager.dart';
import 'package:news_apps/core/utils/raduis_manager.dart';
import 'package:news_apps/core/utils/styles.dart';
import 'package:news_apps/core/utils/text_manager.dart';
import 'package:news_apps/core/utils/width_manager.dart';
import 'package:news_apps/features/home/data/models/news_model.dart';

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
          color: ColorManager.offBlack,
          borderRadius: BorderRadius.circular(RadiusManager.r8),
          border: Border.all(color: ColorManager.offBlack, width: 0.5),
        ),
        child: Row(
          children: [
            const Icon(Icons.language_rounded,
                color: ColorManager.darkGreyModifier, size: FontManager.font24),
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
                      style: Styles.textStyle15
                          .copyWith(color: ColorManager.darkGreyModifier)),
                ],
              ),
            ),
            const Icon(Icons.open_in_new_rounded,
                color: ColorManager.darkGreyModifier, size: FontManager.font24),
          ],
        ),
      ),
    );
  }
}
