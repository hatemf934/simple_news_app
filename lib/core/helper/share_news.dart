import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_apps/core/utils/color_manager.dart';
import 'package:news_apps/core/utils/raduis_manager.dart';
import 'package:news_apps/core/utils/styles.dart';
import 'package:news_apps/core/utils/text_manager.dart';
import 'package:news_apps/features/home/data/models/news_model.dart';
import 'package:share_plus/share_plus.dart';

Future<void> shareNews(NewsModel news, BuildContext context) async {
  try {
    final result = await SharePlus.instance.share(
      ShareParams(
        text: "🔗 ${news.url}",
        subject: news.title,
      ),
    );

    if (result.status == ShareResultStatus.dismissed) {
      log('User dismissed the share sheet');
    }
  } on MissingPluginException catch (e) {
    log('Share plugin not available: $e');
    // ignore: use_build_context_synchronously
    showSnackBar(context, TextManager.shareNotSupported);
  } catch (e) {
    log('Unexpected share error: $e');
    // ignore: use_build_context_synchronously
    showSnackBar(context, TextManager.shareError);
  }
}

void showSnackBar(BuildContext context, String message) {
  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: Styles.textStyle18),
      behavior: SnackBarBehavior.floating,
      backgroundColor: ColorManager.offBlack,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RadiusManager.r8)),
    ),
  );
}
