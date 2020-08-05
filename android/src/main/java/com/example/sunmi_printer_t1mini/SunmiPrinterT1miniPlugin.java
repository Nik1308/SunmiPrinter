package com.example.sunmi_printer_t1mini;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

public class SunmiPrinterT1miniPlugin implements FlutterPlugin, MethodCallHandler {
  private MethodChannel channel;
  private static SunmiPrinter sunmiPrinter;

  private String TEXT = "printText";


  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "sunmi_printer_t1mini");
    channel.setMethodCallHandler(this);
    sunmiPrinter = new SunmiPrinter();
    sunmiPrinter.initAidl(flutterPluginBinding.getApplicationContext());
  }


  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "sunmi_printer_t1mini");
    channel.setMethodCallHandler(new SunmiPrinterT1miniPlugin());
    sunmiPrinter = new SunmiPrinter();
    sunmiPrinter.initAidl(registrar.context());
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals(TEXT)){

    }else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
