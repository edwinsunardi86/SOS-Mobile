import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// class WebViewAndroid extends StatelessWidget {
//   final String? url;
//   const WebViewAndroid({Key? key, this.url}) : super(key: key);
//   Future main() async{
//     WidgetsFlutterBinding.ensureInitialized();
//     if(Platform.isAndroid){
//       await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
//     }

//   }
//   @override
//   Widget build(BuildContext context) {
//     return WebView(
//       initialUrl: url,
//       javascriptMode: JavascriptMode.unrestricted,
//       debuggingEnabled: true,
//     );
//   }
// }

class WebViewAndroid extends StatefulWidget {
  final String? url;
  const WebViewAndroid({Key? key, this.url}) : super(key: key);
  Future main() async {
    WidgetsFlutterBinding.ensureInitialized();
    if (Platform.isAndroid) {
      await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
    }
  }

  @override
  State<WebViewAndroid> createState() => _WebViewAndroidState();
}

class _WebViewAndroidState extends State<WebViewAndroid> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
          useShouldOverrideUrlLoading: true,
          mediaPlaybackRequiresUserGesture: false),
      android: AndroidInAppWebViewOptions(useHybridComposition: true),
      ios: IOSInAppWebViewOptions(allowsInlineMediaPlayback: true));

  late PullToRefreshController pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    pullToRefreshController = PullToRefreshController(
        options: PullToRefreshOptions(color: Colors.blue),
        onRefresh: () async {
          if (Platform.isAndroid) {
            webViewController?.reload();
          } else if (Platform.isIOS) {
            webViewController?.loadUrl(
                urlRequest: URLRequest(url: await webViewController?.getUrl()));
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      key: webViewKey,
      initialUrlRequest: URLRequest(url: Uri.parse(url)),
      initialOptions: options,
      pullToRefreshController: pullToRefreshController,
      onWebViewCreated: (controller) {
        webViewController = controller;
      },
      onLoadStart: (controller, url) {
        setState(() {
          this.url = url.toString();
          urlController.text = this.url;
        });
      },
    );
  }
}
