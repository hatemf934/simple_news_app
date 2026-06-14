import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/assets_manager.dart';
import 'package:news_apps/core/utils/height_manager.dart';
import 'package:news_apps/core/utils/padding_manager.dart';
import 'package:news_apps/core/utils/raduis_manager.dart';
import 'package:news_apps/core/utils/styles.dart';
import 'package:news_apps/features/home/presentation/view/widgets/custom_text_news_tile.dart';
import 'package:news_apps/models/news_model.dart';
import 'package:news_apps/features/webcard/presentation/view/webview.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.news});
  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Webview.id, arguments: news);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: PaddingManager.p16,
          horizontal: PaddingManager.p16,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(RadiusManager.r8),
              child: Image.network(
                news.imageNews ?? AssetsManager.noImageUrl,
                height: HeightManager.h200,
              ),
            ),
            CustomTextNewsTile(
              textTile: news.title,
              styleTile: Styles.textStyle19,
            ),
            CustomTextNewsTile(
              textTile: news.descreption,
              styleTile: Styles.textStyle15,
            )
          ],
        ),
      ),
    );
  }
}
