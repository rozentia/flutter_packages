DateTime endOfToday() => DateTime.now()
    .subtract(
      Duration(
        hours: DateTime.now().hour,
        minutes: DateTime.now().minute,
      ),
    )
    .add(const Duration(days: 1));

extension ExtendedDateTime on DateTime {
  String formatedTime() =>
      '${intToDoubleDigitString(toLocal().hour)}:${intToDoubleDigitString(toLocal().minute)}';

  bool isSameDateAs(DateTime other) =>
      day == other.day && month == other.month && year == other.year;

  DateTime get flattenTime => DateTime(year, month, day);

  DateTime get lastDayOfMonth => DateTime(year, month == 12 ? 1 : month + 1, 0);
}

String intToDoubleDigitString(int value) =>
    value >= 0 && value < 10 ? '0$value' : value.toString();
