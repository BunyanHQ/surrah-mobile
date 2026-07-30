// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'snack_bar_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:android_intent_plus/android_intent.dart';

abstract final class UrlService {
  UrlService._();

  static Future<void> openGmail({required BuildContext context}) async {
    if (Platform.isAndroid) {
      try {
        const intent = AndroidIntent(
          action: 'android.intent.action.MAIN',
          category: 'android.intent.category.APP_EMAIL',
          package: 'com.google.android.gm',
        );
        await intent.launch();
        return;
      } catch (_) {
        SnackBarService.failure(
          context: context,
          message: 'Could not open Gmail app. Please check if it is installed.',
        );
      }
    }
    final uri = Uri(scheme: 'mailto');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
