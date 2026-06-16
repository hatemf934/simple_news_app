import 'package:flutter/material.dart';
import 'package:news_apps/core/helper/share_news.dart';
import 'package:news_apps/core/utils/height_manager.dart';
import 'package:news_apps/core/utils/width_manager.dart';
import 'package:news_apps/features/articaleview/presentation/view/widgets/custom_contaier_icon_button.dart';
import 'package:news_apps/features/home/data/models/news_model.dart';

class CustomAppBarArticaleView extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarArticaleView({super.key, required this.news});
  final NewsModel news;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: CustomContaierIconButton(
        icon: Icons.arrow_back,
        onTap: () => Navigator.pop(context),
        height: HeightManager.h30,
        width: WidthManager.w30,
      ),
      actions: [
        CustomContaierIconButton(
          icon: Icons.share,
          onTap: () => shareNews(news, context),
          height: HeightManager.h37,
          width: WidthManager.w37,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
