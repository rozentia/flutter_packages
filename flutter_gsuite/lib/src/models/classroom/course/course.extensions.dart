import 'package:googleapis/classroom/v1.dart';

extension ExtendedCourse on Course {
  /// Returns true if provided course is ahead of current course
  bool outdated(Course course) =>
      DateTime.parse(updateTime!).isBefore(DateTime.parse(course.updateTime!));
}
