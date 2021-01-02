extension SharedExtensionsInt on int {
  /// Returns last figure of the number:\
  /// 12 => 2\
  /// 13009 => 9\
  /// 250 => 0\
  /// 3 => 3\
  int get lastFigure => this % 10;

  /// A double digit string (zero padded) representation of this number if falls between 0 and 9.
  String get toDoubleDigitString =>
      this >= 0 && this < 10 ? '0$this' : toString();
}
