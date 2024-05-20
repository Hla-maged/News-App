import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatelessWidget {
  final String url;
  WebView({required this.url});
  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
   ..setJavaScriptMode(JavaScriptMode.disabled)
   ..loadRequest(Uri.parse(url));
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
