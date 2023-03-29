import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateController extends GetxController {
  Rx<TextEditingController> controller = TextEditingController().obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;

  @override
  void onInit() {
    nameController.value;
    controller.value;
    phoneController.value;
    emailController.value;
    super.onInit();
  }

  @override
  void onClose() {
    nameController.value.dispose();
    controller.value.dispose();
    phoneController.value.dispose();
    emailController.value.dispose();
    super.dispose();
  }

  String? get nameErrorText {
    final text = nameController.value.text;
    if (text.isEmpty) {
      return 'Please name can\'t be empty';
    }
    return null;
  }

  String? get emailErrorText {
    final text = emailController.value.text;
    if (text.isEmpty) {
      return null;
    }
    if (text.isEmail == false) {
      return 'Please enter correct email';
    }
    return null;
  }

  String? get phoneErrorText {
    final text = phoneController.value.text;
    if (text.isEmpty) {
      return null;
    }
    if (text.length < 10) {
      return 'Too shot for  a number';
    }
    if (text.length > 10) {
      return 'Too long for phone number';
    }
    return null;
  }

  String? get errorText {
    final text = controller.value.text;

    if (text.isEmpty) {
      return null;
    }
    if (text.length < 10) {
      return 'Too shot has to be 10 digits';
    }
    if (text.length > 10) {
      return 'Too long has to be 10 digits';
    }
    return null;
  }
}
