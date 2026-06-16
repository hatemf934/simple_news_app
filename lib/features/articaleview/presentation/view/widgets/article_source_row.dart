import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/color_manager.dart';
import 'package:news_apps/core/utils/height_manager.dart';
import 'package:news_apps/core/utils/styles.dart';
import 'package:news_apps/core/utils/width_manager.dart';

class ArticleSourceRow extends StatelessWidget {
  const ArticleSourceRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: WidthManager.w37,
          height: HeightManager.h37,
          decoration: BoxDecoration(
            color: ColorManager.softRed.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            "w".toUpperCase(),
            style: Styles.textStyle19.copyWith(color: ColorManager.softRed),
          ),
        ),

        const SizedBox(width: 8),

        // Source name
        Text("Weerer",
            style: Styles.textStyleBold15
                .copyWith(color: ColorManager.mediumGrey)),
      ],
    );
  }
}
