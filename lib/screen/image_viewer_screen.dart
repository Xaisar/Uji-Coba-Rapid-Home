import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../theme/pallet_color.dart';

// ignore: must_be_immutable
class ImageViewerScreen extends StatelessWidget {
  ImageViewerScreen({super.key, this.imageFile, this.imageLink});
  XFile? imageFile;
  String? imageLink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.01),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: InteractiveViewer(
        maxScale: 10.0,
        minScale: 0.1,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          alignment: Alignment.center,
          child: imageFile != null 
          //image file
          ? Image.file(
            File(imageFile!.path),
            fit: BoxFit.cover,
            width: MediaQuery.sizeOf(context).width,
          )
          //image network
          : Image.network(
            imageLink!,
            fit: BoxFit.cover,
            width: MediaQuery.sizeOf(context).width,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                size: MediaQuery.sizeOf(context).width,
                Icons.person,
                color: C6
              );
            },
          ),
        ),
      ),
    );
  }
}