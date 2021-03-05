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

  /// Return the list of teaching courses
  Iterable<CourseModel> get teachingCourses => where((model) => model.isTeacher);

  /// Return the list of enrolled courses
  Iterable<CourseModel> get enrolledCourses => where((model) => !model.isTeacher);

  /// Returns the assignments not yet turned in
  Map<String, List<StudentSubmission>> get pendingReviewSubmissions => teachingCourses
      .where((model) => model.courseWorkSubmissions?.pendingSubmissions?.isNotEmpty == true)
      .toList()
      .asMap()
      .map((key, model) => MapEntry(model.courseId, model.courseWorkSubmissions.pendingSubmissions));

  /// Returns the assignments not yet turned in
  Map<String, List<StudentSubmission>> get pendingSubmissions => enrolledCourses
      .where((model) => model.courseWorkSubmissions?.pendingSubmissions?.isNotEmpty == true)
      .toList()
      .asMap()
      .map((key, model) => MapEntry(model.courseId, model.courseWorkSubmissions.pendingSubmissions));
}

extension ExtendedCourseWorkSubmissionList on List<StudentSubmission> {
  List<StudentSubmission> get pendingSubmissions =>
      where((submission) => submission.state == 'NEW' || submission.state == 'CREATED')?.toList() ?? [];
  List<StudentSubmission> get completedSubmissions =>
      where((submission) => submission.state == 'RETURNED')?.toList() ?? [];
}
