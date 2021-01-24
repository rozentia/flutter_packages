import 'package:googleapis/classroom/v1.dart';

class AggregatedCourseWork {
  final Topic topic;
  final CourseWork courseWork;
  final List<StudentSubmission> studentSubmissions;

  AggregatedCourseWork({
    this.topic,
    this.courseWork,
    this.studentSubmissions,
  });

  factory AggregatedCourseWork.fromCourseWork(
    Topic topic,
    CourseWork courseWork,
    List<StudentSubmission> allSubmissions,
  ) =>
      AggregatedCourseWork(
          topic: topic,
          courseWork: courseWork,
          studentSubmissions:
              allSubmissions.where((submission) => submission.courseWorkId == courseWork.id).toList() ?? []);
}
