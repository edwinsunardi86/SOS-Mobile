import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewAndroid extends StatefulWidget {
  const WebViewAndroid({Key? key}) : super(key: key);

  @override
  State<WebViewAndroid> createState() => _WebViewAndroidState();
}

class _WebViewAndroidState extends State<WebViewAndroid> {
  @override
  Widget build(BuildContext context) {
    return const WebView(
      //initialUrl: 'http://face.sos.co.id:8069',
      initialUrl: 'flutter.dev',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
