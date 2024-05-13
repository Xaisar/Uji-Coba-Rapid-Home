import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../theme/pallet_color.dart';

class NotFoundScreen extends StatelessWidget{
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.021 
            ),
            child: AutoSizeText(
              "Page not Found",
              maxLines: 1,
              minFontSize: 15,
              style: TextStyle(
                color: C1,
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
  
}