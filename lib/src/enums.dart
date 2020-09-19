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
  static const xss = PrintSize._internal(16);
  static const sm = PrintSize._internal(18);
  static const smm = PrintSize._internal(20);
  static const md = PrintSize._internal(24);
  static const mdd = PrintSize._internal(28);
  static const mlg = PrintSize._internal(32);
  static const lg = PrintSize._internal(36);
  static const xl = PrintSize._internal(42);
}
