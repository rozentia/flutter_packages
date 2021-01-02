import './num/int.dart';

extension SharedExtensionsDateTime on DateTime {
  /// The last time of the date
  DateTime get endOfToday => DateTime.now()
      .subtract(
        Duration(
          hours: DateTime.now().hour,
          minutes: DateTime.now().minute,
        ),
      )
      .add(const Duration(days: 1));

  /// The string representation of time in the format hh:mm
  String formatedTime() =>
      '${(toLocal().hour).toDoubleDigitString}:${(toLocal().minute).toDoubleDigitString}';

  /// Return true if other is the same date (igonring time) as this
  bool isSameDateAs(

          /// The DateTime to compare against
          DateTime other) =>
      day == other.day && month == other.month && year == other.year;

  /// The date at 0 time
  DateTime get flattenTime => DateTime(year, month, day);

  /// The date for the last day of this date's month
  DateTime get lastDayOfMonth => DateTime(year, month == 12 ? 1 : month + 1, 0);
}
