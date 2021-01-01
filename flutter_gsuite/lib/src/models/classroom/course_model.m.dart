import 'package:flutter/foundation.dart';
import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import '../../constants/hive_constants.dart';

part 'course_model.m.g.dart';

@HiveType(typeId: TYPE_ID_COURSE_MODEL)
class CourseModel {
  @HiveField(0)
  final Course course;
  @HiveField(1)
  final List<UserProfile> students;
  @HiveField(2)
  final List<UserProfile> teachers;

  CourseModel({
    @required this.course,
    @required this.students,
    @required this.teachers,
  });

  bool isTeacher({String userId}) =>
      teachers.firstWhere((userProfile) => userProfile.id == userId,
          orElse: () => null) !=
      null;
}
