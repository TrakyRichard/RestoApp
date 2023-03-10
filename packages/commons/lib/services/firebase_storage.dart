import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

Future<List<String>> uploadFiles(List<XFile> files) async {
  List<String> results = [];
  try {
    for (var i = 0; i < files.length; i++) {
      final file = files[i];
      final uuid = DateTime.now().millisecondsSinceEpoch.toString();
      final String fileName = file.path.split('/').last;
      final image = await FirebaseStorage.instance
          .ref()
          .child("images")
          .child(fileName + uuid)
          .putFile(File(file.path));
      final url = await image.ref.getDownloadURL();
      results.add(url);
    }
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
  }
  return results;
}
