import 'dart:async';

import 'package:app_links/app_links.dart';

abstract final class DeepLinkService {
  DeepLinkService._();

  static final AppLinks _appLinks = AppLinks();

  static StreamSubscription<Uri>? _subscription;

  static void init({
    required void Function(Uri uri) onLink,
  }) {
    _subscription?.cancel();

    _subscription = _appLinks.uriLinkStream.listen(
      onLink,
    );
  }

  static Future<Uri?> getInitialLink() {
    return _appLinks.getInitialLink();
  }

  static Future<void> dispose() async {
    await _subscription?.cancel();
  }
}