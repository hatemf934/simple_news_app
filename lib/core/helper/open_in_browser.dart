import 'package:flutter/material.dart';
import 'package:news_apps/core/helper/show_snakbar.dart';
import 'package:news_apps/core/utils/text_manager.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openInBrowser(String url, BuildContext context) async {
  try {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, TextManager.browserError);
    }
  } catch (e) {
    // ignore: use_build_context_synchronously
    showSnackBar(context, TextManager.browserError);
  }
}
