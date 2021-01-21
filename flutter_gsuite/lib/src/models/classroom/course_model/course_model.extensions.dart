import 'package:googleapis/classroom/v1.dart';

import 'course_model.m.dart';

extension CourseModelExtensions on Iterable<CourseModel> {
  List<UserProfile> get allUserProfiles =>
      fold<List<UserProfile>>([], (prev, curr) => [...prev, ...curr.teachers, ...curr.students]);
}