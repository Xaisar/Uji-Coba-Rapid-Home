import 'dart:io';

import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../theme/pallet_color.dart';

class PusatBantuanScreen extends StatelessWidget {
  PusatBantuanScreen({super.key});

  final Map<String, dynamic> callCenter = {
    'nama' : "M. Arizal Fahmi",
    'phone' : "+6281214745080"
  };

  Future<void> _launchUrl(BuildContext context) async {

    Uri url () {
      if (Platform.isIOS) {
        return Uri.parse("https://wa.me/${callCenter['phone']}");
      } else {
        return Uri.parse("https://wa.me/${callCenter['phone']}");
      }
    }
    
    if (!await launchUrl(url(),mode: LaunchMode.externalApplication)) {
      showTopSnackBar(
        // ignore: use_build_context_synchronously
        Overlay.of(context),
        const CustomSnackBar.error(message: "Tidak dapat terhubung ke Whatsapp")
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C3,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: C1,
        centerTitle: true,
        title: Text(
          "Pusat Bantuan",
          style: TextStyle(
            fontSize: 19,
            color: C3, 
            fontWeight: FontWeight.bold
          ),
        )
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.031,
          left: MediaQuery.sizeOf(context).width * 0.0555,
          right: MediaQuery.sizeOf(context).width * 0.0555,
          bottom: MediaQuery.sizeOf(context).height * 0.0248,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //note
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Butuh Bantuan?",
                style: TextStyle(
                  color: C6,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Silahkan hubungin kami melalui whatsapp untuk mendapat bantuan",
              style: TextStyle(
                color: C6,
                fontSize: 13,
                fontWeight: FontWeight.w400
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                _launchUrl(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF60D669),
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 35
                )
              ),
              child: Text(
                "WhatsApp",
                style: TextStyle(
                  color: C3,
                  fontSize: 15,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}