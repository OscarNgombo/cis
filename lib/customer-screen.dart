import 'package:cis/customer_model.dart';
import 'package:cis/database_helper.dart';
import 'package:flutter/material.dart';
import 'my-globals.dart' as globals;

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('CIS'),
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
                child: Card(
                  elevation: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                    ],
                  ),
                ),
              );
            }
            if (snapshot.hasError) {
              return AlertDialog(
                title: const Text('Database Query error'),
                content: const Text('Account Not in System check the account'),
                actions: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    child: const Text('Back'),
                  )
                ],
              );
            } else {
              return Container();
            }
          },
          future: query(globals.customerController.text),
        ),
      ),
    );
  }
}
