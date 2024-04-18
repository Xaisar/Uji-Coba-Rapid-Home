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
          child: Text(
            "Page not Found",
            style: TextStyle(
              color: C1,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
  
}