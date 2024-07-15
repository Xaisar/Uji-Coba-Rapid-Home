import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_inappwebview/flutter_inappwebview.dart";

import "../../../theme/pallet_color.dart";

class KetentuanPenggunaScreen extends StatefulWidget {
  const KetentuanPenggunaScreen({super.key});

  @override
  State<KetentuanPenggunaScreen> createState() => _KetentuanPenggunaScreenState();
}

class _KetentuanPenggunaScreenState extends State<KetentuanPenggunaScreen> {
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
          "Ketentuan Pengguna",
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
              url: Uri.parse('https://flutter.dev/'),
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