import 'package:cis/customer-screen.dart';
import 'package:cis/customer_model.dart';
import 'package:cis/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'my-globals.dart' as globals;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CIS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'CIS'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    query(globals.customerController.text);
  }

  @override
  void dispose() {
    super.dispose();
    query(globals.customerController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  controller: globals.customerController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () => setState(() {
                          if (globals.customerController.text.isNotEmpty &&
                              globals.customerController.text.length == 10) {
                            globals.buttonPressed = false;
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const CustomerScreen()));
                          }
                        }),
                    child: const Text("Submit")),
              )
            ],
          )),
    );
  }
}
