import 'package:cis/controller/account_controller.dart';
import 'package:cis/models/customer_model.dart';
import 'package:cis/db/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Meter extends StatefulWidget {
  const Meter({super.key});

  @override
  State<Meter> createState() => _MeterState();
}

class _MeterState extends State<Meter> {
  final AccountController controller = Get.put(AccountController());
  String pageTitle = "Meter Query";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(pageTitle),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.teal[50]),
          child: FutureBuilder(
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data as CustomerModel;
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('ACCOUNT NO:'),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text('${data.cUSTKEY}')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('NAME:'),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text('${data.nAME}')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('BOOK NO:'),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text('${data.zONE}')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('STATUS:'),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text('${data.sTATUS}')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('METER NO:'),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text('${data.mETERREF}')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Contact:'),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text('${data.cELLTELNO}')
                        ],
                      ),
                    ],
                  ),
                );
              }
              if (snapshot.hasError) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  buttonPadding: const EdgeInsets.all(4.0),
                  title: const Text('Database Query error',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  content: const Text(
                    'Meter Not in System',
                    style: TextStyle(color: Colors.red),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      child: const Text('Back', style: TextStyle(fontSize: 18)),
                    )
                  ],
                );
              } else {
                return Container();
              }
            },
            future: queryMeter(controller.meter.value.text).catchError(
              (error) {
              },
            ),
          )),
    );
  }
}
