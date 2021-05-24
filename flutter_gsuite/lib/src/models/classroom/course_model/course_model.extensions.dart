import 'package:collection/collection.dart' show IterableExtension;
import 'package:googleapis/classroom/v1.dart';

import 'course_model.m.dart';

const emptySubmissionList = <StudentSubmission>[];

extension CourseModelExtensions on Iterable<CourseModel> {
  List<UserProfile?> get allUserProfiles =>
      fold<List<UserProfile?>>([], (prev, curr) => [...prev, ...curr.teachers!, ...curr.students!]);

  /// If [withId] is a valid string, returns true when such string equals a course id in the list
  /// otherwise will return false
  // ignore: avoid_bool_literals_in_conditional_expressions
  bool hasCourse(String withId) => withId.isNotEmpty == true
      ? firstWhereOrNull(
            (model) => model.course.id == withId,
          ) !=
          null
      : false;

  //-                                                           Teacher Section

  /// Return the list of teaching courses
  Iterable<CourseModel> get teachingCourses => where((model) => model.isTeacher);

  /// Returns the assignments not yet turned in organized by courseId
  Map<String, List<StudentSubmission>> get pendingReviewSubmissions => teachingCourses
      .where(
          (model) => (model.courseWorkSubmissions ?? emptySubmissionList).pendingReviewSubmissions.isNotEmpty == true)
      .toList()
      .asMap()
      .map((key, model) =>
          MapEntry(model.courseId, (model.courseWorkSubmissions ?? emptySubmissionList).pendingSubmissions));

  /// Returns all reviewable (pending) submissions accross all teaching courses
  List<StudentSubmission> get allReviewableSubmissions => teachingCourses.fold<List<StudentSubmission>>(
      [], (prev, curr) => [...prev, ...curr.courseWorkSubmissions ?? []]).pendingReviewSubmissions;

  /// Returns all reviewed submissions accross all teaching courses
  List<StudentSubmission> get allReviewedSubmissions => allReviewableSubmissions.completedSubmissions;

  /// Returns the percentage of all courses' reviewed submissions
  int get percentReviewedTotal => ((allReviewedSubmissions.length / allReviewableSubmissions.length) * 100).round();

  //-                                                           Student Section

  /// Return the list of enrolled courses
  Iterable<CourseModel> get enrolledCourses => where((model) => !model.isTeacher);

  /// Returns all reviewable (pending) submissions accross all teaching courses
  List<StudentSubmission> get allPendingSubmissions => enrolledCourses.fold<List<StudentSubmission>>(
      [], (prev, curr) => [...prev, ...curr.courseWorkSubmissions ?? []]).pendingSubmissions;

  /// Returns all assignement submissions accross all enrolled courses
  List<StudentSubmission> get allAssignmentSubmissions =>
      enrolledCourses.fold<List<StudentSubmission>>([], (prev, curr) => [...prev, ...curr.courseWorkSubmissions ?? []]);

  /// All student's completed submissions (state is RETURNED) of all courses
  List<StudentSubmission> get allCompletedSubmissions => allAssignmentSubmissions.completedSubmissions;

  /// Returns the percentage of all courses' completed submissions
  int get percentCompletedTotal => ((allCompletedSubmissions.length / allAssignmentSubmissions.length) * 100).round();
}

extension ExtendedCourseWorkSubmissionList on List<StudentSubmission> {
  /// Returns all submissions that are either NEW, CREATED or RECLAIMED_BY_STUDENT:\
  /// NEW: The student has never accessed this submission. Attachments are not returned and timestamps is not set.\
  /// CREATED: Has been created.\
  /// RECLAIMED_BY_STUDENT: Student chose to "unsubmit" the assignment.
  List<StudentSubmission> get pendingSubmissions => where((submission) =>
          submission.state == 'NEW' || submission.state == 'CREATED' || submission.state == 'RECLAIMED_BY_STUDENT')
      .toList();

  /// Returns all submissions that are marked as RETURNED:\
  /// RETURNED: Has been returned to the student.
  List<StudentSubmission> get completedSubmissions => where((submission) => submission.state == 'RETURNED').toList();

  /// Returns all submissions waiting for the teacher's review (state is TURNED_IN):\
  /// TURNED_IN: Has been turned in to the teacher.
  List<StudentSubmission> get pendingReviewSubmissions =>
      where((submission) => submission.state == 'TURNED_IN').toList();

  /// Returns a map representation of the list where keys are courseWorkId and values
  /// are the list of submissions of that courseWorkId
  Map<String, List<StudentSubmission>> get sortedByCourseWork => where((e) => e.courseWorkId != null)
      .map<String>((e) => e.courseWorkId!)
      .toSet()
      .toList()
      .asMap()
      .map((key, value) => MapEntry(value, where((s) => s.courseWorkId == value).toList()))
        ..removeWhere((key, value) => value.isEmpty);

  /// Completed submissions percentage
  int get percentCompleted => ((completedSubmissions.length / length) * 100).round();
}
