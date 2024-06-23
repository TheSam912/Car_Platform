import 'package:car_platform/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class myWebview extends StatefulWidget {
  myWebview(this.url);

  String url;

  @override
  State<myWebview> createState() => _myWebviewState();
}

class _myWebviewState extends State<myWebview> {
  late WebViewController controller;
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    // controller = WebViewController()
    //   ..loadRequest(
    //     Uri.parse('https://flutter.dev'),
    //   );
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse('https://pub.dev'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            WebViewWidget(
              controller: controller,
            ),
            loadingPercentage < 100
                ? LinearProgressIndicator(
                    color: Colors.red,
                    value: loadingPercentage / 100.0,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
