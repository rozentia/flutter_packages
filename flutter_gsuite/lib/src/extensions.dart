import 'package:googleapis/classroom/v1.dart';

extension GSuiteExtendedDateTime on Date {
  DateTime asDateTime([TimeOfDay? time]) => DateTime(year!, month!, day!, time?.hours ?? 0, time?.minutes ?? 0);
}

extension ExtendedCoursework on CourseWork {
  DateTime get dueDateTime => dueDate!.asDateTime(dueTime);
}
