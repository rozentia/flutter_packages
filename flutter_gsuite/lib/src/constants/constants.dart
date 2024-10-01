// ignore_for_file: constant_identifier_names
// ignore_for_file: non_constant_identifier_names

import 'package:googleapis/admin/directory_v1.dart';
import 'package:googleapis/admin/reports_v1.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis/classroom/v1.dart';

const String module_name = 'flutter_gsuite';

String logSrc(List<String> source) => '$module_name::${source.join('.')}';

const List<String> SCOPES = [
  //= Calendar
  CalendarApi.calendarScope,
  CalendarApi.calendarEventsScope,
  //= Classroom
  ClassroomApi.classroomAnnouncementsScope,
  ClassroomApi.classroomCoursesScope,
  ClassroomApi.classroomCourseworkMeScope,
  ClassroomApi.classroomCourseworkStudentsScope,
  ClassroomApi.classroomRostersScope,
  ClassroomApi.classroomTopicsScope,
  ClassroomApi.classroomPushNotificationsScope,

  /// THE FOLLOWING SCOPES NEEDS APP VERIFICATION BY GOOGLE
  /// bear in mind that process takes time...
  ClassroomApi.classroomCourseworkmaterialsScope,
  ClassroomApi.classroomProfileEmailsScope,
  ClassroomApi.classroomProfilePhotosScope,
  ClassroomApi.classroomStudentSubmissionsMeReadonlyScope,
  ClassroomApi.classroomStudentSubmissionsStudentsReadonlyScope,
];

const List<String> ADMIN_SCOPES = [
  ...SCOPES,
  //= Admin Directory
  DirectoryApi.adminDirectoryUserScope,
  DirectoryApi.adminDirectoryGroupMemberScope,
  DirectoryApi.adminDirectoryGroupScope,
  //= Admin Reports
  ReportsApi.adminReportsAuditReadonlyScope,
];

/*
https://www.googleapis.com/auth/classroom.coursework.me,
https://www.googleapis.com/auth/classroom.coursework.me.readonly,
https://www.googleapis.com/auth/classroom.coursework.students,
https://www.googleapis.com/auth/classroom.courseworkmaterials,
https://www.googleapis.com/auth/classroom.profile.emails,
https://www.googleapis.com/auth/classroom.profile.photos,
https://www.googleapis.com/auth/classroom.push-notifications,
https://www.googleapis.com/auth/classroom.rosters,
https://www.googleapis.com/auth/classroom.student-submissions.me.readonly,
https://www.googleapis.com/auth/classroom.student-submissions.students.readonly,
https://www.googleapis.com/auth/classroom.topics
*/
