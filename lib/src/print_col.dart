import 'enums.dart';

class PrintCol {
  PrintCol({
    this.text = '',
    this.width = 2,
    this.align = PrintAlign.left,
  }) {
    if (width < 1 || width > 12) {
      throw Exception('Column width must be between 1..12');
    }
  }

  String text;
  int width;
  PrintAlign align;

  Map<String, String> toJson() {
    return {
      "text": text,
      "width": width.toString(),
      "align": align.value.toString(),
    };
  }
}
