import '../date_time.dart';

extension SharedExtensionsIterableDateTime on Iterable<DateTime> {
  bool hasNext(DateTime date) =>
      firstWhere(
          (other) =>
              other.flattenTime ==
              date.add(const Duration(days: 1)).flattenTime,
          orElse: () => null) !=
      null;
  bool hasPrevious(DateTime date) =>
      firstWhere(
          (other) =>
              other.flattenTime ==
              date.subtract(const Duration(days: 1)).flattenTime,
          orElse: () => null) !=
      null;
  bool hasDate(DateTime date) =>
      firstWhere((other) => other.flattenTime == date.flattenTime,
          orElse: () => null) !=
      null;
}
