import 'package:flutter/services.dart';
import 'package:sunmi_printer_t1mini/src/print_styles.dart';

class Printer{
  static const String PRINT_TEXT = "printText";
  static const String EMPTY_LINES = "emptyLines";

  static const MethodChannel _channel =
    const MethodChannel('sunmi_printer_t1mini');

  static Future<void> text(
    String text,{
      PrintStyle styles = const PrintStyle(),
    }
    ) async {
    await _channel.invokeMethod(PRINT_TEXT, {
      "text": text,
      "bold": styles.bold,
      "align": styles.align.value,
      "size": styles.size.value,
    });
  }

  static Future<void> hr({
      String ch = '-',
      int len = 31,
      linesAfter = 0,
    }) async {
      await text(List.filled(len, ch[0]).join());
  }

  static Future<void> emptyLines(int n) async {
    if (n > 0) {
      await _channel.invokeMethod(EMPTY_LINES, {"n": n});
    }
  }
}