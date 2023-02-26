import 'package:cis/controller/account_controller.dart';
import 'package:cis/views/meter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeterScreen extends StatefulWidget {
  const MeterScreen({super.key});

  @override
  State<MeterScreen> createState() => _MeterScreenState();
}

class _MeterScreenState extends State<MeterScreen> {
  final AccountController meterController = Get.put(AccountController());
  String pageTitle = "Meter Query";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: homePage(),
      ),
    );
  }

  Widget homePage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            textCapitalization: TextCapitalization.characters,
            controller: meterController.meter.value,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () => setState(() {
                    if (meterController.meter.value.text.isNotEmpty) {
                      meterController.buttonPressed;
                      Get.to(const Meter());
                    }
                  }),
              child: const Text("Submit")),
        )
      ],
    );
  }
}
