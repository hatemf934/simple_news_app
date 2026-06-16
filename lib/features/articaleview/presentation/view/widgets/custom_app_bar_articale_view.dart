import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/height_manager.dart';
import 'package:news_apps/core/utils/width_manager.dart';
import 'package:news_apps/features/articaleview/presentation/view/widgets/custom_contaier_icon_button.dart';

class CustomAppBarArticaleView extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarArticaleView({super.key});

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
          onTap: () {},
          height: HeightManager.h37,
          width: WidthManager.w37,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
