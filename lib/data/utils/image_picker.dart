import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  File? image;

  Future<File?> getFromGallery() async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return null;
      return File(image.path);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
    return null;
  }

  Future<File?> getFile() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles();
      if(result == null) return null;
      return File(result.files.single.path!);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
    return null;
  }
}
