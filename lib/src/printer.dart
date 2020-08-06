import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sunmi_printer_t1mini/src/print_col.dart';
import 'package:sunmi_printer_t1mini/src/print_styles.dart';
import 'package:sunmi_printer_t1mini/sunmi_printer_t1mini.dart';


class Printer{
  static const String PRINT_TEXT = "printText";
  static const String EMPTY_LINES = "emptyLines";
  static const String PRINT_ROW = "printRow";
  static const String LCD_STRING = "showLCD";
  static const String LCD_DOUBLE_STRING = "showDoubleLCD";
  static const String PRINTER_STATUS = "printerStatus";

  static const MethodChannel _channel =
    const MethodChannel('sunmi_printer_t1mini');

  static Future<int> getPrinterStatus(
    ) async {
     var returnVal;
    await _channel.invokeMethod(PRINTER_STATUS, {
    }).then((value) => {
      returnVal = value
    }) ;
    return returnVal;
  }

  static Future<void> showLCDtext(
    String text
    ) async {
    await _channel.invokeMethod(LCD_STRING, {
      "text": text,
    });
  }

  static Future<void> showDoubleLCDtext(
    String upperText,
    String bottomText,
    ) async {
    await _channel.invokeMethod(LCD_DOUBLE_STRING, {
      "upperText": upperText,
      "bottomText": bottomText
    });
  }

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

  static Future<void> row({
    List<PrintCol> cols,
    bool bold: false,
    PrintSize textSize: PrintSize.md,
  }) async {
    final isSumValid = cols.fold(0, (int sum, col) => sum + col.width) == 12;
    if (!isSumValid) {
      throw Exception('Total columns width must be equal to 12');
    }

    final colsJson = List<Map<String, String>>.from(
        cols.map<Map<String, String>>((PrintCol col) => col.toJson()));

    await _channel.invokeMethod(PRINT_ROW, {
      "cols": json.encode(colsJson),
      "bold": bold,
      "textSize": textSize.value,
    });
  }
}