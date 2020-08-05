import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:sunmi_printer_t1mini/sunmi_printer_t1mini.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void _print() async{
    Printer.text("Contact No.: 7665651403",styles: PrintStyle(bold: true,align: PrintAlign.center,size: PrintSize.md));
    Printer.text("nikhil",styles: PrintStyle(align: PrintAlign.left,size: PrintSize.lg));
    Printer.text("nikhil",styles: PrintStyle(align: PrintAlign.right,size: PrintSize.md));
    Printer.text("nikhil");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test Sunmi Printer'),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Center(
              child: RaisedButton(
                onPressed: _print,
                child: const Text('Print demo', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
