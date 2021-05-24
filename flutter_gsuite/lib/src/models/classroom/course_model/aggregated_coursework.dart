import 'package:googleapis/classroom/v1.dart';

class AggregatedCourseWork {
  final Topic? topic;
  final CourseWork? courseWork;
  final List<StudentSubmission>? studentSubmissions;

  AggregatedCourseWork({
    this.topic,
    this.courseWork,
    this.studentSubmissions,
  });

  /// Coursework Id
  String? get courseWorkId => courseWork?.id;

  factory AggregatedCourseWork.fromCourseWork(
    Topic? topic,
    CourseWork courseWork,
    List<StudentSubmission> allSubmissions,
  ) =>
      AggregatedCourseWork(
          topic: topic,
          courseWork: courseWork,
          studentSubmissions: allSubmissions.where((submission) => submission.courseWorkId == courseWork.id).toList());
}

extension ExtendedAggregatedCourseWork on Iterable<AggregatedCourseWork> {
  Map<String, Iterable<AggregatedCourseWork>> get sortedByCourseWork =>
      where((aggregatedCourseWork) => aggregatedCourseWork.courseWorkId != null)
          .fold<List<String>>([], (prev, curr) => [...prev, curr.courseWorkId!])
          .toSet()
          .toList()
          .asMap()
          .map<String, Iterable<AggregatedCourseWork>>((key, value) =>
              MapEntry(value, where((aggregatedCourseWork) => aggregatedCourseWork.courseWorkId! == value)));
}
