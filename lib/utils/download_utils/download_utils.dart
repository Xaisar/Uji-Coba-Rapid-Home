import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';

class DownloadUtils {
  
  Future<void> downloadImages (String link) async {
    try {
      //get image
      final http.Response response = await http.get(Uri.parse(link));
      
      final dir = await getTemporaryDirectory();

      var filename = '${dir.path}/qris-code-$link.png';

      //create file
      final file = File(filename);
      if (!file.existsSync()) {
        await file.create(recursive: true);
      }

      //write temporary file
      await file.writeAsBytes(response.bodyBytes);
      debugPrint(file.path);

      final params = SaveFileDialogParams(sourceFilePath: file.path);
      final finalPath = await FlutterFileDialog.saveFile(params: params);

      if(finalPath != null) {
        debugPrint("gambar telah disimpan");
      } else {
        debugPrint("gambar tidak disimpan");
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
