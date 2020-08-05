# sunmi_printer_t1mini

Plugin for printing bills/receipts using inbuilt sunmi devices.


## Tested Printers

SUNMI T1 MINI



## How to use 

```dart
import 'package:sunmi_printer_t1mini/sunmi_printer_t1mini.dart';

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
