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
   Printer.getPrinterStatus().then((value) => print(value));
    // Printer.showDoubleLCDtext("Welcome to Gullymart","Tongya");
    // Printer.text("Contact No.: 0123456789",styles: PrintStyle(bold: true,align: PrintAlign.center,size: PrintSize.md));
    // Printer.emptyLines(3);
    // Printer.hr();
    // Printer.text("Nikhil",styles: PrintStyle(align: PrintAlign.left,size: PrintSize.lg));
    // Printer.hr();
    // Printer.text("Nikhil",styles: PrintStyle(align: PrintAlign.right,size: PrintSize.md));
    // Printer.hr();
    // Printer.text("Nikhil");
    // Printer.emptyLines(5);
    // Printer.row(
    //   cols: [
    //     PrintCol(text: 'Contact No.: 0123456789Contact No.: 0123456789', width: 4),
    //     PrintCol(text: 'col2', width: 4, align: PrintAlign.center),
    //     PrintCol(text: 'col3', width: 4, align: PrintAlign.right),
    //   ]
    // );
    // Printer.hr();
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
