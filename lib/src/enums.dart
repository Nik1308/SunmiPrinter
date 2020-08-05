class PrintAlign {
  const PrintAlign._internal(this.value);
  final int value;
  static const left = PrintAlign._internal(0);
  static const center = PrintAlign._internal(1);
  static const right = PrintAlign._internal(2);
}

class PrintSize {
  const PrintSize._internal(this.value);
  final int value;
  static const xs = PrintSize._internal(14);
  static const sm = PrintSize._internal(18);
  static const md = PrintSize._internal(24);
  static const lg = PrintSize._internal(36);
  static const xl = PrintSize._internal(42);
}