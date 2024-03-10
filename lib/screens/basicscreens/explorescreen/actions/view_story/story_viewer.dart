import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewStory extends StatelessWidget {
  final String storyUrl;

  const ViewStory({super.key, required this.storyUrl});

  @override
  Widget build(BuildContext context) {
    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            LinearProgressIndicator(
              value: double.parse(progress.toString()),
              semanticsLabel: 'Linear progress indicator',
            );
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );

    controller.loadRequest(Uri.parse(storyUrl));

    return Scaffold(
      body: SafeArea(child: WebViewWidget(controller: controller)),
    );
  }
}
