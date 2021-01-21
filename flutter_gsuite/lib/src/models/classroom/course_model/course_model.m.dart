import 'dart:developer';

import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import 'package:flutter/foundation.dart';
import '../../../constants/constants.dart';
import '../../../constants/hive_constants.dart';

part 'course_model.m.g.dart';

@HiveType(typeId: TYPE_ID_COURSE_MODEL)
class CourseModel extends HiveObject {
  @HiveField(0)
  final Course course;
  @HiveField(1)
  List<UserProfile> students;
  @HiveField(2)
  List<UserProfile> teachers;
  @HiveField(3)
  final bool isTeacher;
  @HiveField(4)
  final String userId;
  @HiveField(5)
  List<Announcement> announcements;
  @HiveField(6)
  List<Topic> topics;
  @HiveField(7)
  List<CourseWork> courseWorks;
  @HiveField(8)
  List<StudentSubmission> courseWorkSubmissions;
  @HiveField(9)
  List<CourseWorkMaterial> courseWorkMaterials;

  CourseModel({
    @required this.course,
    this.students = const [],
    this.teachers = const [],
    @required this.userId,
    @required this.isTeacher,
    this.announcements = const [],
    this.topics = const [],
    this.courseWorks = const [],
    this.courseWorkMaterials = const [],
    this.courseWorkSubmissions = const [],
  });

  /// Retursn either the [data] provided or the resolved [dataFuture] or null if either is null
  Future<T> _dataOr<T>(T data, Future<T> dataFuture) async {
    try {
      return data ?? (dataFuture != null ? await dataFuture : null);
    } catch (e) {
      log('Error', name: logSrc(['DataModel', 'updateField']), error: e);
      return null;
    }
  }

  Future<void> updateRoster({
    List<UserProfile> studentsInput,
    List<UserProfile> teachersInput,
    Future<List<UserProfile>> studentsFuture,
    Future<List<UserProfile>> teachersFuture,
  }) async {
    final studentsData = await _dataOr(studentsInput, studentsFuture);
    if (studentsData != null) {
      students = studentsData;
      await save();
    }
    final teachersData = await _dataOr(teachersInput, teachersFuture);
    if (teachersData != null) {
      teachers = teachersData;
      await save();
    }
  }

  Future<void> updateAnnouncements({
    List<Announcement> input,
    Future<List<Announcement>> future,
  }) async {
    final data = await _dataOr(input, future);
    if (data != null) {
      announcements = data;
      await save();
    }
  }

  Future<void> updateCourseTopics({
    List<Topic> input,
    Future<List<Topic>> future,
  }) async {
    final data = await _dataOr(input, future);
    if (data != null) {
      topics = data;
      await save();
    }
  }

  Future<void> updateCourseworks({
    List<CourseWork> input,
    Future<List<CourseWork>> future,
  }) async {
    final data = await _dataOr(input, future);
    if (data != null) {
      courseWorks = data;
      await save();
    }
  }

  Future<void> updateCourseworkMaterials({
    List<CourseWorkMaterial> input,
    Future<List<CourseWorkMaterial>> future,
  }) async {
    final data = await _dataOr(input, future);
    if (data != null) {
      courseWorkMaterials = data;
      await save();
    }
  }
}
