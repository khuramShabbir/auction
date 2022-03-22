import 'dart:async';
import 'dart:io';
import 'package:auction/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {
  String? initUrl;

  PaymentWebView({Key? key, required this.initUrl}) : super(key: key);

  @override
  _PaymentWebViewState createState() => _PaymentWebViewState(initUrl);
}

class _PaymentWebViewState extends State<PaymentWebView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true;
  String? initUrl;
  int progress = 0;

  _PaymentWebViewState(this.initUrl);

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(title: "Payment"),
      body: Builder(builder: (BuildContext context) {
        return Stack(
          children: <Widget>[
            WebView(
              initialUrl: initUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onProgress: (int progress) {
                setState(() {
                  this.progress = progress;
                });
              },
              javascriptChannels: <JavascriptChannel>{
                _toasterJavascriptChannel(context),
              },
              navigationDelegate: (NavigationRequest request) {
                if (request.url.startsWith('https://www.youtube.com/')) {
                  print('blocking navigation to $request}');
                  return NavigationDecision.prevent;
                }
                print('allowing navigation to $request');
                return NavigationDecision.navigate;
              },
              onPageStarted: (String url) {
                print('Page started loading: $url');
              },
              onPageFinished: (String url) {
                if(url.contains("status=success")) {
                  Get.back(result: true);

                }
                setState(() {
                  isLoading = false;
                });
              },
              gestureNavigationEnabled: true,
              backgroundColor: const Color(0x00000000),
            ),
            isLoading
                ? Center(
                    child: CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 5.0,
                    percent: 1.0,
                    center: Text(progress.toString()),
                    progressColor: Colors.green,
                  ))
                : Stack()
          ],
        );
      }),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}
