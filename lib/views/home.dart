import 'package:cis/controller/account_controller.dart';
import 'package:cis/views/customer_screen.dart';
import 'package:cis/views/nav_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AccountController customerController = Get.put(AccountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CIS'),
        centerTitle: true,
      ),
      drawer: const NavDrawer(),
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
            controller: customerController.account.value,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () => setState(() {
                    if (customerController.account.value.text.isNotEmpty &&
                        customerController.account.value.text.length == 10) {
                      customerController.buttonPressed;
                      Get.to(() => const CustomerScreen());
                    }
                  }),
              child: const Text("Submit")),
        )
      ],
    );
  }
}
