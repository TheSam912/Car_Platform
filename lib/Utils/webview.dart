import 'package:car_platform/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'navigagion_control.dart';

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
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(onPageStarted: (url) {
        setState(() {
          loadingPercentage = 0;
        });
      }, onProgress: (progress) {
        setState(() {
          loadingPercentage = progress;
        });
      }, onPageFinished: (url) {
        setState(() {
          loadingPercentage = 100;
        });
      },

          // Keeping track of navigation uisng NavigationDelegate
          onNavigationRequest: (navigation) {
        final host = Uri.parse(navigation.url).host;
        if (host.contains('youtube.com')) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Blocking navigation to $host',
              ),
            ),
          );
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      }))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'SnackBar',
        onMessageReceived: (message) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            message.message,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )));
        },
      )
      ..loadRequest(
        Uri.parse('https://flutter.dev'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 40),
          child: Container(
            color: mainColor,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 50, left: 16),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
          )),
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
                : Container(),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 70,
                  decoration: BoxDecoration(color: mainColor),
                  child: Center(
                    child: NavigationControl(controller: controller),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
