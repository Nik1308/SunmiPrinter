import 'dart:async';

import 'package:flutter/services.dart';

class SunmiPrinterT1mini {
  static const MethodChannel _channel =
      const MethodChannel('sunmi_printer_t1mini');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
