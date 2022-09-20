import 'package:googleapis/classroom/v1.dart';

import '../../../value_objects/value_objects.dart';

extension ExtendedCourse on Course {
  /// Returns true if provided course is ahead of current course
  bool outdated(Course course) => DateTime.parse(updateTime!).isBefore(DateTime.parse(course.updateTime!));

  CourseState get status {
    switch (courseState) {
      case 'ACTIVE':
        return const CourseState.active();
      case 'ARCHIVED':
        return const CourseState.archived();
      case 'PROVISIONED':
        return const CourseState.provisioned();
      case 'DECLINED':
        return const CourseState.declined();
      case 'SUSPENDED':
        return const CourseState.suspended();
      default:
        return const CourseState.unspecified();
    }
  }
}
