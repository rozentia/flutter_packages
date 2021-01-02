// ignore_for_file: prefer_interpolation_to_compose_strings

extension SharedExtensionsDuration on Duration {
  /// String representation of the duration in HM format:
  /// * Duration(hours: 2, minutes: 25) => 2h 25m
  /// * Duration(seconds: 10) => 0m
  /// * Duration(minutes: 50) => 50m
  String get timeSpanHM =>
      (inHours <= 0
          ? ''
          : inHours == 1
              ? '${inHours}h '
              : '${inHours}h ') +
      '${inMinutes - (inHours * 60)}m';

  /// String representation of the duration in HHMM format:
  /// * Duration(hours: 2, minutes: 25) => 2 horas 25 minutos
  /// * Duration(seconds: 10) => 0 minutos
  /// * Duration(minutes: 50) => 50 minutos
  /// * Duration(minutes: 1) => 1 minuto
  /// * Duration(hours: 1) => 1 hora
  String get timeSpanHHMM => ((inHours <= 0
              ? ''
              : inHours == 1
                  ? '$inHours hora'
                  : '$inHours horas') +
          '${inHours != 0 ? ' ' : ''}${inMinutes - (inHours * 60)} minuto${inMinutes - (inHours * 60) == 1 ? '' : 's'}')
      .trim();

  /// String representation of the duration in HH \n MM format:
  /// * Duration(hours: 2, minutes: 25) => "2 horas\
  /// 25 minutos"
  /// * Duration(seconds: 10) => 0 minutos
  String get timeSpanSplitHHMM =>
      (inHours <= 0
          ? ''
          : inHours == 1
              ? '$inHours hora'
              : '$inHours horas') +
      (inHours > 0 ? '\n' : '') +
      '${inMinutes - (inHours * 60)} minuto${inMinutes - (inHours * 60) == 1 ? '' : 's'}';
}
