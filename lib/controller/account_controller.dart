import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  Rx<TextEditingController> account = TextEditingController().obs;
  RxBool buttonPressed = false.obs;
  Rx<TextEditingController> meter = TextEditingController().obs;

  @override
  void onInit() {
    account.value;
    meter.value;
    buttonPressed;
    super.onInit();
  }

  @override
  void onClose() {
    account.value.dispose();
    meter.value.dispose();
    buttonPressed;
    super.onClose();
  }
}
