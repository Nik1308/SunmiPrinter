import 'enums.dart';

class PrintStyle{

  const PrintStyle({
    this.bold = false,
    this.align = PrintAlign.left,
    this.size = PrintSize.md,
  });

  final bool bold;
  final PrintAlign align;
  final PrintSize size;
}