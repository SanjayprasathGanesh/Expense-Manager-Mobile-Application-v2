import 'dart:io';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ImageController extends GetxController {
  Rx<File> image = Rx<File>(File(''));

  void saveImage(File img) {
    image.value = img;
    Logger().i('Image Saved with : ${image.value}');
  }

  File? getImage() {
    Logger().w('Retrive Image : $image');
    return image.value;
  }
}
