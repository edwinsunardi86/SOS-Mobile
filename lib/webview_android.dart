import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewAndroid extends StatelessWidget {
  final String? url;
  const WebViewAndroid({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
      debuggingEnabled: true,
    );
  }
}
