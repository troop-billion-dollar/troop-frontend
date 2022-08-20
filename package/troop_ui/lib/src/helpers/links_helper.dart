import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

/// Opens the given [url] in a new tab of the host browser
Future<void> openLink(String url, {VoidCallback? onError}) async {
  try {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri))
      await launchUrl(uri);
    else
      throw Exception();
  } catch (_) {
    onError?.call();
  }
}
