import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/padding_manager.dart';
import 'package:news_apps/core/utils/styles.dart';
import 'package:news_apps/core/widgets/custom_cached_image.dart';
import 'package:news_apps/models/news_model.dart';

class OnePageNews extends StatelessWidget {
  const OnePageNews({super.key, required this.news});

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(PaddingManager.p16),
        child: Column(
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: PaddingManager.p20),
                child: CustomCachedImage(imageUrl: news.imageNews)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: PaddingManager.p8),
              child: Text(
                news.title,
                style: Styles.textStyle19,
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: PaddingManager.p8),
              child: Text(
                news.descreption,
                style: Styles.textStyle19,
                maxLines: 4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: PaddingManager.p8),
              child: Text(
                news.publishedAt,
                style: Styles.textStyle19,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: PaddingManager.p8),
              child: Text(
                news.content,
                style: Styles.textStyle19,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
