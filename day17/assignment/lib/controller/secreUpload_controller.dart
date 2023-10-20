import 'package:assignment/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecretUploadController extends GetxController {
  var textEditingController = TextEditingController();

  secretRecord() async {
    Get.find<AuthController>().getSecretRecord(textEditingController.text);
  }

  back() {
    Get.find<AuthController>().back('secretUpload');
  }
}
