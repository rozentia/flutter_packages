import 'dart:developer';

import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import 'package:flutter/foundation.dart';
import 'package:quiver/iterables.dart';
import '../../../constants/constants.dart';
import '../../../constants/hive_constants.dart';
import 'aggregated_coursework.dart';

part 'course_model.m.g.dart';

const noTopicKey = 'No Topic';

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

  /// The id of the course this model referes to or null if the model is empty
  String get courseId => course?.id;

  Map<String, List<AggregatedCourseWork>> get sortedAggregatedCourseWorks => topics.asMap().map(
        (key, topic) => MapEntry(
          topic.topicId,
          courseWorks
              .where((courseWork) => courseWork.topicId == topic.topicId)
              .map<AggregatedCourseWork>(
                (courseWork) => AggregatedCourseWork.fromCourseWork(
                  topic,
                  courseWork,
                  courseWorkSubmissions,
                ),
              )
              .toList(),
        ),
      );
  Map<String, List<CourseWorkMaterial>> get sortedCourseWorkMaterials => topics.asMap().map((key, topic) => MapEntry(
        topic.topicId,
        courseWorkMaterials.where((material) => material.topicId == topic.topicId).toList(),
      ));

  /// Returns a map representation of the topics data where the keys are the topic name and
  /// the value is a dynamic list holding either CourseWorkMaterial or AggregatedCourseWork
  Map<String, List<dynamic>> get topicData => topics.asMap().map(
        (key, topic) => MapEntry(
            topic.name,
            concat([
              sortedAggregatedCourseWorks[topic.topicId] ?? [],
              sortedCourseWorkMaterials[topic.topicId] ?? [],
            ]).toList()),
      )..addAll({
          noTopicKey: concat([
            courseWorks
                .where((courseWork) => courseWork.topicId == null)
                .map((courseWork) => AggregatedCourseWork.fromCourseWork(
                      null,
                      courseWork,
                      courseWorkSubmissions,
                    )),
            courseWorkMaterials.where((material) => material.topicId == null),
          ]).toList()
        });

  /// Return a user by its [userIdOrEmailOrFullName] or null if not found
  UserProfile findRosterUser(String userIdOrEmailOrFullName,
          {bool excludeStudents = false, bool excludeTeachers = true}) =>
      !excludeStudents && !excludeTeachers
          ? null
          : concat([if (!excludeTeachers) teachers, if (!excludeStudents) students]).firstWhere(
              (user) =>
                  user.id == userIdOrEmailOrFullName ||
                  user.emailAddress == userIdOrEmailOrFullName ||
                  user.name.fullName == userIdOrEmailOrFullName,
              orElse: () => null);

  Topic findCourseTopic(String topicIdOrName) => topics.firstWhere(
        (topic) => topic.topicId == topicIdOrName || topic.name == topicIdOrName,
        orElse: () => null,
      );

  /// Returns either the [data] provided or the resolved [dataFuture] or null if either is null
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

  Future<void> updateCourseworkSubmission({
    List<StudentSubmission> input,
    Future<List<StudentSubmission>> future,
  }) async {
    final data = await _dataOr(input, future);
    if (data != null) {
      courseWorkSubmissions = data;
      await save();
    }
  }
}
