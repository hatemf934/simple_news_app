import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/color_manager.dart';
import 'package:news_apps/core/utils/height_manager.dart';
import 'package:news_apps/core/utils/padding_manager.dart';
import 'package:news_apps/core/utils/route_manager.dart';
import 'package:news_apps/core/utils/styles.dart';
import 'package:news_apps/core/widgets/custom_cached_image.dart';
import 'package:news_apps/features/articaleview/presentation/view/widgets/article_meta_row.dart';
import 'package:news_apps/features/articaleview/presentation/view/widgets/article_source_row.dart';
import 'package:news_apps/features/articaleview/presentation/view/widgets/custom_app_bar_articale_view.dart';
import 'package:news_apps/features/articaleview/presentation/view/widgets/custom_browser_button.dart';
import 'package:news_apps/features/articaleview/presentation/view/widgets/custom_text_by_author.dart';
import 'package:news_apps/features/home/data/models/news_model.dart';

class ArticaleView extends StatelessWidget {
  const ArticaleView({super.key, required this.news, required this.catogery});
  final NewsModel news;
  final String catogery;
  static const String id = RouteManager.article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarArticaleView(
        news: news,
      ),
      body: Padding(
        padding: const EdgeInsets.all(PaddingManager.p16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCachedImage(imageUrl: news.imageNews),
              const SizedBox(height: HeightManager.h30),
              ArticleMetaRow(
                news: news,
                catogery: catogery,
              ),
              const SizedBox(height: HeightManager.h10),
              CustomTextByAutor(news: news),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: PaddingManager.p16),
                child: Text(
                  news.title,
                  style: Styles.textStyle22,
                  // maxLines: 2,
                ),
              ),
              ArticleSourceRow(news: news),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: PaddingManager.p16),
                child: Divider(
                    height: 1, thickness: 0.5, color: ColorManager.mediumGrey),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: PaddingManager.p8),
                child: Text(news.descreption, style: Styles.textStyle18),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: PaddingManager.p8),
                child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    news.content,
                    style: Styles.textStyle18),
              ),
              const SizedBox(height: HeightManager.h10),
              CustomButtonBrowser(news: news),
              const SizedBox(height: HeightManager.h10),
            ],
          ),
        ),
      ),
    );
  }
}
