import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../theme/pallet_color.dart';

class KebijakanPrivasiScreen extends StatefulWidget {
  const KebijakanPrivasiScreen({super.key});

  @override
  State<KebijakanPrivasiScreen> createState() => _KebijakanPrivasiScreenState();
}

class _KebijakanPrivasiScreenState extends State<KebijakanPrivasiScreen> {
  late final InAppWebViewController inAppWebViewController;

  bool ready = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C3,
      appBar:AppBar(
        centerTitle: true,
        title: Text(
          "Kebijakan Privasi",
          style: TextStyle(
              fontSize: 18,
              color: C3, 
              fontWeight: FontWeight.bold
            ),
          ),
        backgroundColor: C1,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          //loading
          Visibility(
            visible: ready,
            child: Container(
              color: C3,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: C9,
              ),
            )
          ),
          // web view
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse('https://www.youtube.com'),
            ),
            onLoadStop: (controller, url) {
              setState(() async {
                ready = false;
              });
            },
            onWebViewCreated: (controller) {
              inAppWebViewController = controller;
            },
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                javaScriptEnabled: true,
                transparentBackground: true
              ),
              android: AndroidInAppWebViewOptions(
                useHybridComposition: false,
              ),
              ios: IOSInAppWebViewOptions(
                allowsInlineMediaPlayback: true
              )
            ),
            pullToRefreshController: PullToRefreshController(
              onRefresh: () async {
                if (Platform.isAndroid) {
                  inAppWebViewController.reload();
                } else if (Platform.isIOS) {
                  inAppWebViewController.loadUrl(
                    urlRequest: URLRequest(url: await inAppWebViewController.getUrl()));
                }
              },
            ),
          ),
        ],
      )
    );
  }
}