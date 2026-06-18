import 'package:flutter/material.dart';
import 'package:news_hub/core/utils/color_manager.dart';
import 'package:news_hub/core/utils/styles.dart';
import 'package:news_hub/core/utils/text_manager.dart';

class CustomTextTitleApp extends StatelessWidget {
  const CustomTextTitleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: TextManager.newsText,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          TextSpan(
            text: TextManager.cloudText,
            style: Styles.textStyle24.copyWith(color: ColorManager.lightGrey),
          ),
        ],
      ),
    );
  }
}
