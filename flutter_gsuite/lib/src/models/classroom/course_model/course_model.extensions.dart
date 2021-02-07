import 'package:googleapis/classroom/v1.dart';

import 'course_model.m.dart';

extension CourseModelExtensions on Iterable<CourseModel> {
  List<UserProfile> get allUserProfiles =>
      fold<List<UserProfile>>([], (prev, curr) => [...prev, ...curr.teachers, ...curr.students]);

  /// If [withId] is a valid string, returns true when such string equals a course id in the list
  /// otherwise will return false
  // ignore: avoid_bool_literals_in_conditional_expressions
  bool hasCourse(String withId) => withId?.isNotEmpty == true
      ? firstWhere(
            (model) => model?.course?.id == withId,
            orElse: () => null,
          ) !=
          null
      : false;
}
