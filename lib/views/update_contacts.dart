import 'package:cis/controller/update_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<Update> {
  final UpdateController controller = Get.put(UpdateController());
  final databaseReference = FirebaseDatabase.instance.ref("Accounts");
  final message = const SnackBar(
    content: Text("Your data is saved for E-bills"),
    backgroundColor: Colors.blue,
    elevation: 12.0,
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: 3),
    margin: EdgeInsets.only(bottom: 30, left: 10, right: 10),
  );
  final String _text = '';

  void _submit() {
    if (controller.errorText == null) {
      createData();
    }
  }

  void createData() {
    databaseReference.child(controller.controller.value.text).set({
      'name': controller.nameController.value.text,
      'contact': controller.phoneController.value.text,
      'email': controller.emailController.value.text
    }).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(message);
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Your data is not saved"),
        backgroundColor: Colors.red,
        elevation: 12.0,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
        margin: EdgeInsets.only(bottom: 30, left: 10, right: 10),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 30, left: 16, right: 16),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (text) => setState(() => _text),
                      controller: controller.controller.value,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Account',
                        errorText: controller.errorText,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (text) => setState(() => _text),
                      controller: controller.nameController.value,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Account Holder Name',
                        errorText: controller.nameErrorText,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (text) => setState(() => _text),
                      controller: controller.phoneController.value,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Phone Number',
                        errorText: controller.phoneErrorText,
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (text) => setState(() => _text),
                      controller: controller.emailController.value,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Email',
                        errorText: controller.emailErrorText,
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: (controller.controller.value.text.isNotEmpty) &&
                        (controller.phoneController.value.text.isNotEmpty)
                    ? _submit
                    : null,
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
