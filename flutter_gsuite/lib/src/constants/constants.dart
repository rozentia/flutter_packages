// ignore_for_file: constant_identifier_names
// ignore_for_file: non_constant_identifier_names

import 'package:googleapis/admin/directory_v1.dart';
import 'package:googleapis/admin/reports_v1.dart' as report;
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis/classroom/v1.dart';

const List<String> SCOPES = [
  'email',
  //= Calendar
  CalendarApi.CalendarScope,
  CalendarApi.CalendarEventsScope,
  //= Classroom
  ClassroomApi.ClassroomAnnouncementsScope,
  ClassroomApi.ClassroomCoursesScope,
  ClassroomApi.ClassroomCourseworkMeScope,
  ClassroomApi.ClassroomCourseworkStudentsScope,
  ClassroomApi.ClassroomRostersScope,
  ClassroomApi.ClassroomTopicsScope,
  //= Admin Directory
  // AdminApi.AdminDirectoryUserScope,
  // AdminApi.AdminDirectoryGroupMemberScope,
  // AdminApi.AdminDirectoryGroupScope,
  //= Admin Reports
  // report.AdminApi.AdminReportsAuditReadonlyScope
];

const List<String> ADMIN_SCOPES = [
  //= Admin Directory
  AdminApi.AdminDirectoryUserScope,
  AdminApi.AdminDirectoryGroupMemberScope,
  AdminApi.AdminDirectoryGroupScope,
  //= Admin Reports
  report.AdminApi.AdminReportsAuditReadonlyScope
];
