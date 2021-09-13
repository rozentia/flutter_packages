import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:googleapis/admin/directory_v1.dart' hide Empty;
import 'package:googleapis/admin/reports_v1.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis/classroom/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:shared_extensions/shared_extensions.dart';

import '../constants/constants.dart';
import '../models/calendar_event/calendar_event.m.dart';
import '../models/classroom/course_model/course_model.m.dart';
import '../models/meet_event/meet_event.extensions.dart';
import '../models/meet_event/meet_event.m.dart';
import '../value_objects/value_objects.dart';

const String _baseSrc = 'gsuiteService';
void _logMsg(String msg, String src, [dynamic err]) => log(
      msg,
      name: logSrc([_baseSrc, src]),
      error: err,
    );
void _logErr(String src, [dynamic err]) => _logMsg('error', src, err);
void _logDone(String src) => _logMsg('success', src);

class GsuiteService {
  /// OAuth scopes required for the user's OAuth consent and GoogleSignIn instance
  static const scopes = SCOPES;

  /// OAuth scopes required for service account and admin user
  static const adminScopes = ADMIN_SCOPES;

  AuthClient? _client;
  AuthClient? _adminClient;
  String? _userEmail;

  GsuiteService();
  // TODO Review this stream subscription
  /*
    {
    if (googleSignIn != null) {
      //= Subscribe to changes in GoogleSignIn to set user client accordingly
      _googleSignIn.onCurrentUserChanged.listen((account) {
        if (account == null) {
          _client = null;
          _userEmail = null;
        } else {
          _userEmail = account.email;
          _googleSignIn
              .authenticatedClient()
              .then((client) => _client = client);
        }
      });
      _googleSignIn.signInSilently();
    }
    }
  */

  /// The scopes that require consent of the user to use this library
  String? get userEmail => _userEmail;

  /// True if the client is set
  bool get hasClient => _client != null;

  /// True is the super admin client is set
  bool get hasAdminClient => _adminClient != null;

  String noClientForApiMsg(String apiName) => 'There is no client available to instantiate $apiName';

  DirectoryApi get _adminApi =>
      _client != null ? DirectoryApi(_client!) : throw Exception(noClientForApiMsg('DirectoryApi'));
  DirectoryApi get _superAdminApi =>
      _adminClient != null ? DirectoryApi(_adminClient!) : throw Exception(noClientForApiMsg('DirectoryApi'));
  CalendarApi get _calendarApi =>
      _client != null ? CalendarApi(_client!) : throw Exception(noClientForApiMsg('CalendarApi'));
  CalendarApi get _adminCalendarApi =>
      _adminClient != null ? CalendarApi(_adminClient!) : throw Exception(noClientForApiMsg('CalendarApi'));
  ClassroomApi get _classroomApi =>
      _client != null ? ClassroomApi(_client!) : throw Exception(noClientForApiMsg('ClassroomApi'));
  ClassroomApi get _adminClassroomApi =>
      _adminClient != null ? ClassroomApi(_adminClient!) : throw Exception(noClientForApiMsg('ClassroomApi'));
  ReportsApi get _reportsApi =>
      _adminClient != null ? ReportsApi(_adminClient!) : throw Exception(noClientForApiMsg('ReportsApi'));

  //-                                                                       @factoryMethod
  static Future<GsuiteService> init({
    required String serviceAccountJSONCredentials,
    required String googleAdminEmail,
  }) async {
    try {
      final gsuiteService = GsuiteService();

      //= Request required scopes consent if already signed in
      // if (await googleSignIn.isSignedIn() &&
      //     scopesRequiringConsent.isNotEmpty) {
      //   await googleSignIn.requestScopes(scopesRequiringConsent);
      // }

      //= Set service account superadmin client
      if (serviceAccountJSONCredentials.isNotEmpty && googleAdminEmail.isNotEmpty) {
        await gsuiteService.setAdminClient(
          serviceAccountJSONCredentials: serviceAccountJSONCredentials,
          adminEmail: googleAdminEmail,
        );
      }
      return gsuiteService;
    } catch (e) {
      _logMsg('error while constructing GsuiteService', 'init(factory constructor)', e);
      rethrow;
    }
  }

  /// Sets the Google Apis http client used by this package either providing the [client] itself or
  /// providing [serviceAccountJSONCredentials] and a [userEmail] for impersonating a user.\
  /// The raw client or the service account must have the required scopes used in this package.
  Future<void> setClient({
    required String userEmail,
    String? serviceAccountJSONCredentials,
    AuthClient? client,
  }) async {
    if (client != null) {
      final List<String> scopesRequiringConsent = [];
      for (final scope in SCOPES) {
        if (!client.credentials.scopes.contains(scope)) {
          scopesRequiringConsent.add(scope);
        }
      }
      if (scopesRequiringConsent.isNotEmpty) {
        _logMsg(
            'The following scopes are missing in GoogleSignIn:\n${scopesRequiringConsent.join('\n')}\nPlease add them to GoogleSignIn instance',
            'setClient');
      }
      _client = client;
      _userEmail = userEmail;
      _logMsg('client set? $hasClient', 'setClient');
      _logMsg('user email set? ${_userEmail != null}', 'setClient');
      return;
    }
    if (serviceAccountJSONCredentials == null ||
        serviceAccountJSONCredentials.isEmpty ||
        userEmail == null ||
        userEmail.isEmpty) {
      throw Exception(
          'Unable to set client: either [credentials: $serviceAccountJSONCredentials] or [email: $userEmail] are empty or null');
    }
    try {
      _client = await getAccessClient(serviceAccountJSONCredentials, userEmail);
      _userEmail = userEmail;
      _logDone('setClient');
    } catch (e) {
      _logErr('setClient', e);
      rethrow;
    }
  }

  /// Sets the Google Apis http client with administration privileges used by this package
  /// either providing the [client] itself or providing [serviceAccountJSONCredentials]
  /// and a [userEmail] for impersonating a user.\
  /// The raw client or the service account must have the required scopes used in this package.
  Future<void> setAdminClient({
    String? adminEmail,
    String? serviceAccountJSONCredentials,
    AuthClient? client,
  }) async {
    if (client != null) {
      _adminClient = client;
      return;
    }
    if (serviceAccountJSONCredentials == null || serviceAccountJSONCredentials.isEmpty) {
      throw Exception('Unable to set admin client: invalid credentials provided');
    }
    try {
      _adminClient = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson(
          serviceAccountJSONCredentials,
          impersonatedUser: adminEmail,
        ),
        ADMIN_SCOPES,
      );
      // await getAccessClient(serviceAccountJSONCredentials, userEmail);
      _userEmail = userEmail;
      _logDone('setAdminClient');
    } catch (e) {
      _logErr('setAdminClient', e);
      rethrow;
    }
  }

  /// Clear signed in user's client (does not dispose of the superAdmin auth client)
  void clearClient() {
    _client = null;
    _userEmail = null;
  }

  //-                                                                            DIRECTORY

  /// Get own User data or provided email's user if allowed.\
  /// (uses regular client)
  Future<User?> fetchUser({
    String? email,
    UserProjection projection = const UserProjection.basic(),
  }) async {
    final userKey = email ?? _userEmail;
    if (userKey == null) return null;
    try {
      return _adminApi.users.get(
        userKey,
        projection: projection.value,
      );
    } catch (e) {
      _logErr('fetchUser', e);
      rethrow;
    }
  }

  /// Get User for the provided [userEmail] or the currently logged in user\
  /// (requires admin client)
  Future<User?> fetchUserData({String? userEmail, UserProjection projection = const UserProjection.basic()}) async {
    final userKey = userEmail ?? _userEmail;
    if (userKey == null) return null;
    try {
      return _superAdminApi.users.get(
        userKey,
        viewType: 'admin_view',
        projection: projection.value,
      );
    } catch (e) {
      _logErr('fetchUserData', e);
      rethrow;
    }
  }

  /// Get groups whose user with [userId] is member of (requires admin client)
  Future<List<Group>> fetchUserGroups(String userId) async {
    try {
      final groups = await _superAdminApi.groups.list(userKey: userId);
      return groups.groups ?? [];
    } catch (e) {
      _logErr('fetchUserGroup', e);
      rethrow;
    }
  }

  /// Returns the list of members email adresses of given group (requires admin client)
  Future<List<Member>> fetchGroupMembers(String groupKey) async {
    try {
      final result = await _adminApi.members.list(groupKey);
      return result.members ?? [];
    } catch (e) {
      _logErr('fetchGroupMembers', e);
      rethrow;
    }
  }

  /// Returns the full list of users (requires admin client)
  Future<List<User>> searchForUser(String query) async {
    try {
      final result = await _superAdminApi.users.list(
        query: query,
        domain: 'alicialonso.org',
        maxResults: 100,
      );
      return result.users ?? [];
    } catch (e) {
      _logErr('searchForUser', e);
      rethrow;
    }
  }

  //-                                                                             CALENDAR

  /// Returns all calendars available for the user the auth client is impersonating
  Future<List<CalendarListEntry>> fetchUserCalendars([minAccessRole]) async {
    try {
      final calendarList = await _calendarApi.calendarList.list();
      return calendarList.items ?? [];
    } catch (e) {
      _logErr('fetchUserCalendars', e);
      rethrow;
    }
  }

  /// Returns the calendar for the provided Id if premissions allow it
  Future<CalendarListEntry> fetchSingleCalendar(String id) async => _calendarApi.calendarList.get(id);

  /// Returns all events of the specified calendarId
  Future<List<Event>> fetchCalendarEvents(String calendarId) async {
    try {
      final events = await _calendarApi.events.list(calendarId);
      return events.items ?? [];
    } catch (e) {
      _logErr('fetchCalendarEvents', e);
      rethrow;
    }
  }

  /// Returns events using admin credentials
  Future<List<Event>> fetchCalendarEventsAsAdmin(String calendarId) async {
    try {
      final events = await _adminCalendarApi.events.list(calendarId, maxResults: 300);
      return events.items ?? [];
    } catch (e) {
      _logErr('fetchCalendarEventsAsAdmin', e);
      rethrow;
    }
  }

  /// Returns all events that are programmed to take place from the request moment
  /// to end of day (23:59h) from all calendars of the impersonated user
  /// or those ids if provided
  Future<List<Tuple2<String?, Event>>> fetchTodayEvents({
    List<String> calendars = const <String>[],
  }) async {
    try {
      if (calendars.isEmpty) {
        final fetched = await _calendarApi.calendarList.list();
        calendars.addAll(
            (fetched.items ?? []).where((element) => element.id != null).map<String>((calendar) => calendar.id!));
      }
      if (calendars.isEmpty) {
        return [];
      }

      final List<Tuple2<String, Event>> response = [];
      for (final calendarId in calendars) {
        final events = await _calendarApi.events.list(
          calendarId,
          singleEvents: true,
          timeMin: DateTime.now().toUtc(),
          timeMax: DateTime.now().endOfToday.toUtc(),
        );
        if ((events.items ?? []).isEmpty) continue;

        response.addAll(events.items!.map((event) => Tuple2(calendarId, event)));
      }
      return response
        ..sort(
          (t1, t2) => t1.value2.start!.dateTime != null && t2.value2.start!.dateTime != null
              ? t1.value2.start!.dateTime!.compareTo(t2.value2.start!.dateTime!)
              : 1,
        );
    } catch (e) {
      _logErr('fetchTodayEvents', e);
      rethrow;
    }
  }

  /// Returns all events from all calendars available to the impersonated
  /// user or those ids if provided
  Future<List<CalendarEvent>> fetchAllEvents({
    List<String?> calendars = const [],
  }) async {
    try {
      final fetched = await _calendarApi.calendarList.list();
      calendars.addAll([
        // TODO make a way to include a set of calendar ids to accomodate this
        //!...CALENDAR_ID_OFFICIAL_DEFAULT_LIST,
        ...fetched.items!.map((calendar) => calendar.id),
      ]);
      final calendarIds = calendars.clean.toSet().toList();

      final List<CalendarEvent> response = [];

      for (final calendarId in calendarIds) {
        final events = await _calendarApi.events.list(
          calendarId,
          singleEvents: true,
        );
        if (events.items!.isEmpty) continue;

        response.addAll(events.items!.map((event) => CalendarEvent(calendarId: calendarId, event: event)));
      }
      return response;
    } catch (e) {
      _logErr('fetchAllEvents', e);
      rethrow;
    }
  }

  /// Returns all events from all calendars available to the impersonated
  /// user or those ids if provided
  Future<CalendarEvent?> fetchSingle(String jointCalendarAndEventId) async {
    try {
      if (jointCalendarAndEventId.isEmpty) {
        return null;
      }
      final ids = jointCalendarAndEventId.split('|');
      final event = await _calendarApi.events.get(ids[0], ids[1]);
      return CalendarEvent(calendarId: ids[0], event: event);
    } catch (e) {
      _logErr('fetchSingle', e);
      rethrow;
    }
  }

  /// Fetch event's attendees
  Future<List<EventAttendee>> fetchEventAttendees(String calendarId, String eventId) async {
    try {
      final event = await _calendarApi.events.get(calendarId, eventId);
      return event.attendees ?? [];
    } catch (e) {
      _logErr('fetchEventAttendees', e);
      rethrow;
    }
  }

  //-                                                                            CLASSROOM

  /// Returns all available teaching [Course] of the signed in user
  Future<List<Course>> fetchUserCourses() async {
    try {
      final result = await Future.wait<List<Course>?>([
        fetchUserTeachingCourses(),
        fetchUserEnrolledCourses(),
      ]);

      final allCourses = result.fold<List<Course>>(
        [],
        (prev, curr) => [...prev, ...curr!],
      );

      _logMsg('fetched ${allCourses.length} courses', 'fetchUserCourses');
      return allCourses;
    } catch (e) {
      _logErr('fetchUserCourses', e);
      rethrow;
    }
  }

  /// Returns all available teaching courses of the signed in user
  Future<List<Course>> fetchUserTeachingCourses() async {
    try {
      final coursesResponse = await _classroomApi.courses.list(teacherId: 'me');
      return (coursesResponse.courses ?? []).where((course) => course.id != null && course.id!.isNotEmpty).toList();
    } catch (e) {
      _logErr('fetchUserCourses', e);
      rethrow;
    }
  }

  /// Returns all available enrolled of the signed in user
  Future<List<Course>> fetchUserEnrolledCourses() async {
    try {
      final coursesResponse = await _classroomApi.courses.list(studentId: 'me');
      return (coursesResponse.courses ?? []).where((course) => course.id != null && course.id!.isNotEmpty).toList();
    } catch (e) {
      _logErr('fetchUserCourses', e);
      rethrow;
    }
  }

  /// Returns all CourseModels available for the signed in users
  Future<Map<dynamic, CourseModel>> fetchUserCourseModels() async {
    try {
      if (_userEmail == null) throw Exception('User not authenticated, unable to make the request');
      final coursesTeaching = await fetchUserTeachingCourses();
      final coursesEnrolled = await fetchUserEnrolledCourses();
      final models = [
        ...coursesTeaching.map((course) => CourseModel(course: course, isTeacher: true, userId: _userEmail!)),
        ...coursesEnrolled.map((course) => CourseModel(course: course, isTeacher: false, userId: _userEmail!)),
      ];

      _logMsg('resolved ${(coursesTeaching.length) + (coursesEnrolled.length)} CourseModels', 'fetchUserCourseModels');
      return models.isNotEmpty != true
          ? {}
          : models.asMap().map((key, courseModel) => MapEntry(courseModel.course.id, courseModel));
    } catch (e) {
      _logErr('fetchUsercourseModels', e);
      rethrow;
    }
  }

  /// Returns a single course model if available for the signed in user
  Future<CourseModel> fetchSingleUserCourseModel(
    String courseId, {
    Course? course,
    bool isTeacher = false,
  }) async {
    try {
      if (_userEmail == null) throw Exception('User not authenticated, unable to make the request');
      final _course = course ?? await fetchSingleCourse(courseId);
      //= Return model without roster for enrolled courses
      if (isTeacher == false) {
        return CourseModel(
          course: _course,
          teachers: [],
          students: [],
          userId: _userEmail!,
          isTeacher: isTeacher,
        );
      }
      final result = await Future.wait<List<UserProfile>>([
        fetchCourseTeachers(courseId),
        fetchCourseStudents(courseId),
      ]);

      return CourseModel(
        course: _course,
        teachers: result[0],
        students: result[1],
        userId: _userEmail!,
        isTeacher: isTeacher,
      );
    } catch (e) {
      _logErr('fetchSingleUserCourseModel', e);
      rethrow;
    }
  }

  /// Returns a single [Course] by its id
  Future<Course> fetchSingleCourse(String id) async {
    try {
      return _classroomApi.courses.get(id);
    } catch (e) {
      _logErr('fetchSingleCourse', e);
      rethrow;
    }
  }

  /// Returns a list of [UserProfile] of all students of the specified courseId
  /// * requires admin client
  Future<List<UserProfile>> fetchCourseStudents(String courseId) async {
    try {
      final response = await _adminClassroomApi.courses.students.list(courseId);
      return (response.students ?? []).map<UserProfile?>((student) => student.profile).toList().clean;
    } catch (e) {
      _logErr('fetchCourseStudents', e);
      rethrow;
    }
  }

  /// Returns a list of [UserProfile] of all teachers of the specified courseId
  /// * requires admin client
  Future<List<UserProfile>> fetchCourseTeachers(String courseId) async {
    try {
      final response = await _adminClassroomApi.courses.teachers.list(courseId);
      return (response.teachers ?? []).map<UserProfile?>((teacher) => teacher.profile).toList().clean;
    } catch (e) {
      _logErr('fetchCourseTeachers', e);
      rethrow;
    }
  }

  /// Returns the topics for a [courseId] that the user is permitted to view
  Future<List<Topic>> fetchCourseTopics(String courseId) async {
    try {
      final response = await _classroomApi.courses.topics.list(courseId);
      return response.topic ?? [];
    } catch (e) {
      _logErr('fetchCourseTopics', e);
      rethrow;
    }
  }

  /// Returns the course announcements for a [courseId] that the user is permitted to view
  Future<List<Announcement>> fetchCourseAnnouncements(String courseId) async {
    try {
      final response = await _classroomApi.courses.announcements.list(courseId);
      return response.announcements ?? [];
    } catch (e) {
      _logErr('fetchCourseAnnouncements', e);
      rethrow;
    }
  }

  /// Returns the course work for a [courseId] that the user is permitted to view
  Future<List<CourseWork>> fetchCourseWorks(String courseId) async {
    try {
      final result = await _classroomApi.courses.courseWork.list(courseId);
      return result.courseWork ?? [];
    } catch (e) {
      _logErr('fetchCourseWorks', e);
      rethrow;
    }
  }

  /// Returns the course work materials that the user is permitted to view for [courseId]
  Future<List<CourseWorkMaterial>> fetchCourseworkMaterials(String courseId) async {
    try {
      final result = await _classroomApi.courses.courseWorkMaterials.list(courseId);
      return result.courseWorkMaterial ?? [];
    } catch (e) {
      _logErr('fetchCourseworkMaterials', e);
      rethrow;
    }
  }

  /// Returns the student submissions for multiple courseWork or the ones for [courseworkId]
  /// that the user is permitted to view.\
  ///
  /// * [courseId] - Identifier of the course. This identifier can be either the
  /// Classroom-assigned identifier or an alias.
  ///
  /// * [courseWorkId] - Identifier of the student work to request. This may be
  /// set to the string literal `"-"` to request student work for all course
  /// work in the specified course.
  /// * [states] - Requested submission states. If specified, returned student
  /// submissions match one of the specified submission states.
  Future<List<StudentSubmission>> fetchCourseworkSubmission(
    String courseId, [
    String courseWorkId = '-',
    String? userId,
  ]) async {
    try {
      final response = await _classroomApi.courses.courseWork.studentSubmissions.list(
        courseId,
        courseWorkId,
      );
      return response.studentSubmissions ?? [];
    } catch (e) {
      _logErr('fetchCourseworkSubmission', e);
      rethrow;
    }
  }

  /// Returns a list of invitations that the requesting user is permitted to view
  Future<List<Invitation>> fetchUserInvitations() async {
    try {
      final response = await _classroomApi.invitations.list(userId: 'me');
      return response.invitations ?? [];
    } catch (e) {
      _logErr('fetchUserInvitations', e);
      rethrow;
    }
  }

  Future<bool> acceptInvitation(String invitationId) async {
    try {
      final Empty response = await _classroomApi.invitations.accept(invitationId);
      return response is Empty;
    } catch (e) {
      _logErr('acceptInvitation', e);
      rethrow;
    }
  }

  //-                                                                              REPORTS

  /// Returns a list of google meet conference events for the specified [start]
  /// time and [end] time or the last day if not provided.
  ///
  /// **Requires [client] with SuperAdmin privileges**
  Future<List<MeetEvent>> getMeetReport({
    DateTime? start,
    DateTime? end,
    String? userId,
  }) async {
    try {
      final String startTime = start != null && start.isBefore(end!)
          ? start.toUtc().toIso8601String()
          : DateTime.now().subtract(const Duration(days: 7)).toUtc().toIso8601String();
      final String endTime =
          end != null && end.isAfter(start!) ? end.toUtc().toIso8601String() : DateTime.now().toUtc().toIso8601String();

      final response = await _reportsApi.activities.list(
        'all',
        'meet',
        maxResults: 1000,
        eventName: 'call_ended',
        startTime: startTime,
        endTime: endTime,
      );

      if (response.items == null || response.items!.isEmpty) {
        return [];
      }

      final List<MeetEvent> conferences = [];

      for (final activity in response.items!) {
        // ignore activity items without callEndedEvent.conferenceId
        if (activity.callEndedEvent == null || activity.callEndedEvent!.conferenceId == null) continue;

        // find activity's related MeetEvent
        int index = conferences.indexWhere(
          (conference) => conference.conferenceId == activity.callEndedEvent!.conferenceId,
        );

        // if no MeetEvent found for the activity
        if (index == -1) {
          // add new MeetEvent
          conferences.add(MeetEvent(
            conferenceId: activity.callEndedEvent!.conferenceId!,
            organizerEmail: activity.callEndedEvent!.organizerEmail,
            meetingCode: activity.callEndedEvent!.meetingCode,
          ));
          // set index to last item's index
          index = conferences.length - 1;
        }
        // add the activity data to the related MeetEvent
        conferences[index].addAttendee(activity);
      }

      // Filter by userId
      if (userId != null) {
        return conferences.where((conference) => conference.attended.containsKey(userId)).toList();
      }
      // If no userId provided just return all fetched conferences
      return conferences;
    } catch (e) {
      _logErr('getMeetReport', e);
      rethrow;
    }
  }
}

/// Obtains oauth2 credentials by providing [serviceAccountJSONCredentials]
/// and optionally [userEmail] if impersonating a user,
/// and returns an authenticated HTTP client
/// with all the required google apis scopes used in this package.\
/// The service account must have access to those scopes.
Future<AuthClient> getAccessClient(
  String serviceAccountJSONCredentials,
  String userEmail,
) async {
  try {
    return await clientViaServiceAccount(
      ServiceAccountCredentials.fromJson(
        serviceAccountJSONCredentials,
        impersonatedUser: userEmail,
      ),
      SCOPES,
    );
  } catch (err) {
    _logMsg('error', 'getAccessClient', err);
    rethrow;
  }
}
