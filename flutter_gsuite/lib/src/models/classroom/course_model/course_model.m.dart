import 'dart:developer';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';
import 'package:quiver/iterables.dart';

import '../../../constants/constants.dart';
import '../../../constants/hive_constants.dart';
import 'aggregated_coursework.dart';
import 'course_model.extensions.dart';

part 'course_model.m.g.dart';

const noTopicKey = 'No Topic';

@HiveType(typeId: TYPE_ID_COURSE_MODEL)
class CourseModel extends HiveObject {
  @HiveField(0)
  final Course course;
  @HiveField(1)
  List<UserProfile?>? students;
  @HiveField(2)
  List<UserProfile?>? teachers;
  @HiveField(3)
  final bool isTeacher;
  @HiveField(4)
  final String userId;
  @HiveField(5)
  List<Announcement>? announcements;
  @HiveField(6)
  List<Topic>? topics;
  @HiveField(7)
  List<CourseWork>? courseWorks;
  @HiveField(8)
  List<StudentSubmission>? courseWorkSubmissions;
  @HiveField(9)
  List<CourseWorkMaterial>? courseWorkMaterials;

  CourseModel({
    required this.course,
    this.students = const [],
    this.teachers = const [],
    required this.userId,
    required this.isTeacher,
    this.announcements = const [],
    this.topics = const [],
    this.courseWorks = const [],
    this.courseWorkMaterials = const [],
    this.courseWorkSubmissions = const [],
  });

  //-                                                                              Getters

  /// The id of the course this model referes to or null if the model is empty
  String get courseId => course.id!;

  /// The name of the course (if course had no name it will return 'Untitled course')
  String get name => course.name ?? 'Untitled course';

  /// Returns a map where keys are with a list of StudentSubmissions for each CourseWorkId
  Map<String, List<StudentSubmission>> get submissions =>
      courseWorkSubmissions == null ? {} : courseWorkSubmissions!.sortedByCourseWork;

  Map<String, List<AggregatedCourseWork>> get sortedAggregatedCourseWorks =>
      (topics ?? []).where((topic) => topic.topicId != null).toList().asMap().map(
            (key, topic) => MapEntry(
              topic.topicId!,
              courseWorks!
                  .where((courseWork) => courseWork.topicId == topic.topicId)
                  .map<AggregatedCourseWork>(
                    (courseWork) => AggregatedCourseWork.fromCourseWork(
                      topic,
                      courseWork,
                      courseWorkSubmissions ?? [],
                    ),
                  )
                  .toList(),
            ),
          );

  /// Returns all CourseWorkMaterial organized by Topic
  Map<String?, List<CourseWorkMaterial>> get sortedCourseWorkMaterials => topics!.asMap().map(
        (key, topic) => MapEntry(
          topic.topicId,
          courseWorkMaterials!.where((material) => material.topicId == topic.topicId).toList(),
        ),
      );

  /// Returns a map representation of the topics data where the keys are the topic name and
  /// the value is a dynamic list holding either CourseWorkMaterial or AggregatedCourseWork
  Map<String?, List<dynamic>> get topicData => topics!.asMap().map(
        (key, topic) => MapEntry(
          topic.name,
          concat([
            sortedAggregatedCourseWorks[topic.topicId] ?? [],
            sortedCourseWorkMaterials[topic.topicId] ?? [],
          ]).toList(),
        ),
      )..addAll({
      noTopicKey: concat([
        courseWorks!.where((courseWork) => courseWork.topicId == null).map(
              (courseWork) => AggregatedCourseWork.fromCourseWork(
                null,
                courseWork,
                courseWorkSubmissions!,
              ),
            ),
        courseWorkMaterials!.where((material) => material.topicId == null),
      ]).toList()
    });

  //-                                                                            Functions

  /// Return a user by its [userIdOrEmailOrFullName] or null if not found
  UserProfile? findRosterUser(
    String userIdOrEmailOrFullName, {
    bool excludeStudents = false,
    bool excludeTeachers = true,
  }) =>
      !excludeStudents && !excludeTeachers
          ? null
          : concat([if (!excludeTeachers) teachers!, if (!excludeStudents) students!]).firstWhere(
              (user) =>
                  user!.id == userIdOrEmailOrFullName ||
                  user.emailAddress == userIdOrEmailOrFullName ||
                  user.name!.fullName == userIdOrEmailOrFullName,
              orElse: () => null,
            );

  /// Returns the topic by tis [topicIdOrName] or null if not found
  Topic? findCourseTopic(String topicIdOrName) => topics!.firstWhereOrNull(
        (topic) => topic.topicId == topicIdOrName || topic.name == topicIdOrName,
      );

  /// Returns the course work for [courseWorkId] or null if not found
  CourseWork? findCourseWork(String courseWorkId) =>
      courseWorks?.firstWhereOrNull((courseWork) => courseWork.id == courseWorkId);

  /// Returns either the [data] provided or the resolved [dataFuture] or null if either is null
  Future<T?> _dataOr<T>(T data, Future<T>? dataFuture) async {
    try {
      return data ?? (dataFuture != null ? await dataFuture : null);
    } catch (e) {
      log('Error', name: logSrc(['DataModel', 'updateField']), error: e);
      return null;
    }
  }

  /// Fill/replaces and saves the the profiles in students and teachers with either the [studentsInput] and [teachersInput]
  /// of the results of the [studentsFuture] and the [teachersFuture]
  Future<void> updateRoster({
    List<UserProfile>? studentsInput,
    List<UserProfile>? teachersInput,
    Future<List<UserProfile>>? studentsFuture,
    Future<List<UserProfile>>? teachersFuture,
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

  /// Fill/replaces and saves the course announcements with either the [input] provided or the results of the [future]
  Future<void> updateAnnouncements({
    List<Announcement>? input,
    Future<List<Announcement>>? future,
  }) async {
    final data = await _dataOr(input, future);
    if (data != null) {
      announcements = data;
      await save();
    }
  }

  /// Fill/replaces and saves the course topics with either the [input] provided or the results of the [future]
  Future<void> updateCourseTopics({
    List<Topic>? input,
    Future<List<Topic>>? future,
  }) async {
    final data = await _dataOr(input, future);
    if (data != null) {
      topics = data;
      await save();
    }
  }

  /// Fill/replaces and saves the the courseWorks of the course either with the [input] provided or the results of the [future]
  Future<void> updateCourseworks({
    List<CourseWork>? input,
    Future<List<CourseWork>>? future,
  }) async {
    final data = await _dataOr(input, future);
    if (data != null) {
      courseWorks = data;
      await save();
    }
  }

  /// Fill/replaces and saves the the courseworkMaterials of the course either with the [input] provided or the results of the [future]
  Future<void> updateCourseworkMaterials({
    List<CourseWorkMaterial>? input,
    Future<List<CourseWorkMaterial>>? future,
  }) async {
    final data = await _dataOr(input, future);
    if (data != null) {
      courseWorkMaterials = data;
      await save();
    }
  }

  /// Fill/replaces and saves the the courseworkSubmissions of the cours eeither with the [input] provided or the results of the [future]
  Future<void> updateCourseworkSubmission({
    List<StudentSubmission>? input,
    Future<List<StudentSubmission>>? future,
  }) async {
    final data = await _dataOr(input, future);
    if (data != null) {
      courseWorkSubmissions = data;
      await save();
    }
  }
}
