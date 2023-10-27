import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import '../asset/constants.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomeScrseen extends StatelessWidget {

  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          // return NavigationDecision.prevent 콜백 방지 코드
          // if (request.url.startsWith('https://www.youtube.com/')) {
          //   return NavigationDecision.prevent;
          // }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://google.com'));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text('Constants.APPBAR_TITLE'),
            centerTitle: true,
          ),
          body: WebViewWidget(controller: controller),
        ),
    );
  }
}