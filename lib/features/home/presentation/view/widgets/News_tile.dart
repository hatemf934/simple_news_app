import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/padding_manager.dart';
import 'package:news_apps/core/utils/styles.dart';
import 'package:news_apps/core/widgets/custom_cached_image.dart';
import 'package:news_apps/features/home/presentation/view/widgets/custom_text_news_tile.dart';
import 'package:news_apps/features/home/data/models/news_model.dart';
import 'package:news_apps/features/articaleview/presentation/view/articale_view.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.news, required this.catogery});
  final NewsModel news;
  final String catogery;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ArticaleView.id,
          arguments: {'news': news, 'catogery': catogery},
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: PaddingManager.p16,
          horizontal: PaddingManager.p16,
        ),
        child: Column(
          children: [
            CustomCachedImage(imageUrl: news.imageNews),
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
