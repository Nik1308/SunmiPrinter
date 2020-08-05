import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sunmi_printer_t1mini/sunmi_printer_t1mini.dart';

void main() {
  const MethodChannel channel = MethodChannel('sunmi_printer_t1mini');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await SunmiPrinterT1mini.platformVersion, '42');
  });
}
