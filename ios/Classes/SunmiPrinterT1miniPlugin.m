#import "SunmiPrinterT1miniPlugin.h"
#if __has_include(<sunmi_printer_t1mini/sunmi_printer_t1mini-Swift.h>)
#import <sunmi_printer_t1mini/sunmi_printer_t1mini-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "sunmi_printer_t1mini-Swift.h"
#endif

@implementation SunmiPrinterT1miniPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSunmiPrinterT1miniPlugin registerWithRegistrar:registrar];
}
@end
