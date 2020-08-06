# sunmi_printer_t1mini

Plugin for printing bills/receipts using inbuilt sunmi devices.


## Tested Printers

SUNMI T1 MINI

## Supported Features

1 → Print text
2 → Print rows
3 → Print empty lines
4 → Print dash line
5 → Display single text on LCD
6 → Display multiple text on LCD
7 → Get printer status

## Printer Status

1 → The printer works normally
2 → Preparing printer
3 → Abnormal communication
4 → Out of paper
5 → Overheated
6 →Open the lid
7 → The paper cutter is abnormal
8 → The paper cutter has been recovered
9 → No black mark has been detected
505 →No printer has been detected
507 →Failed to upgrade the printer firmware

## How to use 

```dart
import 'package:sunmi_printer_t1mini/sunmi_printer_t1mini.dart';

//For getting printer status - 

Printer.getPrinterStatus().then((status) => print(status));

//For Displaying Single Text on LCD - 

Printer.showLCDtext("Test");

//For Displaying Double Text on LCD - 

Printer.showDoubleLCDtext("Welcome","test2");

//For Printing - 

Printer.text("Contact No.: 0123456789",styles: PrintStyle(bold: true,align: PrintAlign.center,size: PrintSize.md));
Printer.emptyLines(3);
Printer.hr();
Printer.text("Test",styles: PrintStyle(align: PrintAlign.left,size: PrintSize.lg));
Printer.hr();
Printer.text("Test",styles: PrintStyle(align: PrintAlign.right,size: PrintSize.md));
Printer.hr();
Printer.text("Test");
Printer.emptyLines(5);
Printer.row(
  cols: [
    PrintCol(text: 'Contact No.: 0123456789Contact No.: 0123456789', width: 4),
    PrintCol(text: 'col2', width: 4, align: PrintAlign.center),
    PrintCol(text: 'col3', width: 4, align: PrintAlign.right),
  ]
);
Printer.hr();
```

## Thanks For
<a href="https://pub.dev/packages/flutter_sunmi_printer">flutter_sunmi_printer</a>

