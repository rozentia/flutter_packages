import 'package:collection/collection.dart' show IterableExtension;
import '../date_time.dart';

extension SharedExtensionsIterableDateTime on Iterable<DateTime> {
  bool hasNext(DateTime date) =>
      firstWhereOrNull((other) => other.flattenTime == date.add(const Duration(days: 1)).flattenTime) != null;
  bool hasPrevious(DateTime date) =>
      firstWhereOrNull((other) => other.flattenTime == date.subtract(const Duration(days: 1)).flattenTime) != null;
  bool hasDate(DateTime date) => firstWhereOrNull((other) => other.flattenTime == date.flattenTime) != null;
}
