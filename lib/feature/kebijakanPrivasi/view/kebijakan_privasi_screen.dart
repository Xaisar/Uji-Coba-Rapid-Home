import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../theme/pallet_color.dart';

class KebijakanPrivasiScreen extends StatefulWidget {
  const KebijakanPrivasiScreen({super.key});

  @override
  State<KebijakanPrivasiScreen> createState() => _KebijakanPrivasiScreenState();
}

class _KebijakanPrivasiScreenState extends State<KebijakanPrivasiScreen> {
  late final WebViewController controller;
  bool ready = false;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(C3)
    ..setNavigationDelegate(
      NavigationDelegate(
        onPageFinished: (String url) {
          setState(() {
            ready = true;
          });
        },
      ),
    )
    ..loadRequest(Uri.parse('https://www.youtube.com'));
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
      body: ready
      ? WebViewWidget(controller: controller)
      : Center(
        child: CircularProgressIndicator(
          color: C1,
        )
      )
    );
  }
}