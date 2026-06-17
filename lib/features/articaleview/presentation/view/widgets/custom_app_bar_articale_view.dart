import 'package:flutter/material.dart';
import 'package:news_apps/core/helper/share_news.dart';
import 'package:news_apps/core/widgets/custom_flexible_space.dart';
import 'package:news_apps/core/widgets/custom_text_title_app.dart';
import 'package:news_apps/features/articaleview/presentation/view/widgets/custom_contaier_icon_button.dart';
import 'package:news_apps/features/home/data/models/news_model.dart';

class CustomAppBarArticaleView extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarArticaleView({super.key, required this.news});
  final NewsModel news;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: const CustomTextTitleApp(),
      flexibleSpace: const CustomFlexibleSpace(),
      leading: CustomContaierIconButton(
        icon: Icons.arrow_back,
        onTap: () => Navigator.pop(context),
      ),
      actions: [
        CustomContaierIconButton(
          icon: Icons.share,
          onTap: () => shareNews(news, context),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
