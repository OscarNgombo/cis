import 'package:cis/views/meter_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(254, 254, 254, 254),
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage(
                    'http://mombasawater.co.ke/wp-content/uploads/2021/01/revised_logo.jpg'),
              ),
            ),
            child: Center(
              child: Text(
                ' ',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          Center(
            child: ListTile(
              leading: const Icon(
                Icons.account_circle_outlined,
                size: 36,
                color: Colors.blueAccent,
              ),
              title: const Text('Account Query'),
              onTap: () => Get.back(),
            ),
          ),
          const Spacer(),
          Center(
            child: ListTile(
              leading: const Icon(
                Icons.gas_meter_outlined,
                size: 36,
                color: Colors.blueAccent,
              ),
              title: const Text('Meter Query'),
              onTap: () => Get.to(MeterScreen()),
            ),
          ),
          const Spacer(),
          Center(
            child: ListTile(
              leading: const Icon(
                Icons.dynamic_form_outlined,
                size: 36,
                color: Colors.blueAccent,
              ),
              title: const Text('Update Contacts'),
              onTap: () => Get.to(MeterScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
