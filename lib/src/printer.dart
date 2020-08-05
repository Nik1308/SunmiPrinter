import 'package:flutter/services.dart';

class Printer{
  static const String PRINT_TEXT = "printText";

  static const MethodChannel _channel =
    const MethodChannel('sunmi_printer_t1mini');

  static Future<void> text(
    String text) async {
    await _channel.invokeMethod(PRINT_TEXT, {
      "text": text,
    });
  }
}