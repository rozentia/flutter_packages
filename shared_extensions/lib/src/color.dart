import 'dart:ui';

extension SharedExtensionsColor on Color {
  /// The hexadecimal string representation of the color
  String get hexString => '#${(0xFFFFFF & value).toRadixString(16)}';
}
