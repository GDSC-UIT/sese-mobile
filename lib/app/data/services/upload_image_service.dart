import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';
import 'package:path/path.dart';

class UploadImageService {
  static firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  static Future<String?> uploadImageToFirebase(
      File image, String destination) async {
    try {
      String fileName = basename(image.path);
      firebase_storage.Reference firebaseStorageRef =
          storage.ref().child('$destination/$fileName');
      firebase_storage.UploadTask uploadTask =
          firebaseStorageRef.putFile(image);
      firebase_storage.TaskSnapshot taskSnapshot = await uploadTask;
      String value = await taskSnapshot.ref.getDownloadURL();
      log('image link:$value');
      return value;
    } catch (e) {
      Get.snackbar('Error occurs when upload image', e.toString());
      return 'khong co link';
    }
  }
}
