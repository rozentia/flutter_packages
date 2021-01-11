import 'package:async/async.dart';
import 'package:dartz/dartz.dart';
// import '../../core/failures.dart';
import 'package:flutter/foundation.dart';
import 'package:googleapis/admin/directory_v1.dart';
import 'package:googleapis/admin/reports_v1.dart' as reports;
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis/classroom/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:shared_extensions/shared_extensions.dart';

import '../constants/constants.dart';
import '../models/calendar_event/calendar_event.m.dart';
import '../models/classroom/course_model.m.dart';
import '../models/meet_event/meet_event.extensions.dart';
import '../models/meet_event/meet_event.m.dart';
import '../value_objects/value_objects.dart';

class GsuiteService {
  /// OAuth scopes required for the user's OAuth consent and GoogleSignIn instance
  static const scopes = SCOPES;

  /// OAuth scopes required for service account and admin user
  static const adminScopes = ADMIN_SCOPES;

  AuthClient _client;
  AuthClient _adminClient;
  String _userEmail;

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
  String get userEmail => _userEmail;

  /// True if the client is set
  bool get hasClient => _client != null;

  /// True is the super admin client is set
  bool get hasAdminClient => _adminClient != null;

  AdminApi get _adminApi => _client != null ? AdminApi(_client) : null;
  AdminApi get _superAdminApi =>
      _adminClient != null ? AdminApi(_adminClient) : null;
  CalendarApi get _calendarApi => _client != null ? CalendarApi(_client) : null;
  ClassroomApi get _classroomApi =>
      _client != null ? ClassroomApi(_client) : null;
  reports.AdminApi get _reportsApi =>
      _adminClient != null ? reports.AdminApi(_adminClient) : null;

  //-                                                  @factoryMethod
  static Future<GsuiteService> init({
    @required String serviceAccountJSONCredentials,
    @required String googleAdminEmail,
  }) async {
    try {
      final gsuiteService = GsuiteService();

      //= Request required scopes consent if already signed in
      // if (await googleSignIn.isSignedIn() &&
      //     scopesRequiringConsent.isNotEmpty) {
      //   await googleSignIn.requestScopes(scopesRequiringConsent);
      // }

      //= Set service account superadmin client
      if (serviceAccountJSONCredentials != null &&
          serviceAccountJSONCredentials.isNotEmpty &&
          googleAdminEmail != null &&
          googleAdminEmail.isNotEmpty) {
        await gsuiteService.setAdminClient(
          serviceAccountJSONCredentials: serviceAccountJSONCredentials,
          adminEmail: googleAdminEmail,
        );
      }
      return gsuiteService;
    } catch (e) {
      rethrow;
    }
  }

  /// Sets the Google Apis http client used by this package either providing the [client] itself or
  /// providing [serviceAccountJSONCredentials] and a [userEmail] for impersonating a user.\
  /// The raw client or the service account must have the required scopes used in this package.
  Future<void> setClient({
    @required String userEmail,
    String serviceAccountJSONCredentials,
    AuthClient client,
  }) async {
    if (client != null) {
      print('using provided client');
      final List<String> scopesRequiringConsent = [];
      for (final scope in SCOPES) {
        if (!client.credentials.scopes.contains(scope)) {
          scopesRequiringConsent.add(scope);
        }
      }
      if (scopesRequiringConsent.isNotEmpty) {
        print(
            'The following scopes are missing in GoogleSignIn:\n${scopesRequiringConsent.join('\n')}\nPlease add them to GoogleSignIn instance');
      }
      _client = client;
      _userEmail = userEmail;
      print('client set? $hasClient');
      print('user email set? ${_userEmail != null}');
      return;
    }
    if (serviceAccountJSONCredentials == null ||
        serviceAccountJSONCredentials.isEmpty ||
        userEmail == null ||
        userEmail.isEmpty) {
      throw Exception('Unable to set client: invalid credentials provided');
    }
    try {
      _client = await getAccessClient(serviceAccountJSONCredentials, userEmail);
      _userEmail = userEmail;
    } catch (e) {
      rethrow;
    }
  }

  /// Sets the Google Apis http client with administration privileges used by this package
  /// either providing the [client] itself or providing [serviceAccountJSONCredentials]
  /// and a [userEmail] for impersonating a user.\
  /// The raw client or the service account must have the required scopes used in this package.
  Future<void> setAdminClient({
    String adminEmail,
    String serviceAccountJSONCredentials,
    AuthClient client,
  }) async {
    if (client != null) {
      _adminClient = client;
      return;
    }
    if (serviceAccountJSONCredentials == null ||
        serviceAccountJSONCredentials.isEmpty) {
      throw Exception(
          'Unable to set admin client: invalid credentials provided');
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
    } catch (e) {
      rethrow;
    }
  }

  /// Clear signed in user's client (does not dispose of the superAdmin auth client)
  void clearClient() {
    _client = null;
    _userEmail = null;
  }

  //-                                   DIRECTORY

  /// Get own User data or provided email's user if allowed.\
  /// (uses regular client)
  Future<User> fetchUser({
    String email,
    UserProjection projection = const UserProjection.undefined(),
  }) async {
    final userKey = email ?? _userEmail;
    if (userKey == null) return null;
    return _adminApi?.users?.get(
      userKey,
      projection: projection.value,
    );
  }

  /// Get User for the provided [userEmail] or the currently logged in user\
  /// (requires admin client)
  Future<User> fetchUserData(
      {String userEmail,
      UserProjection projection = const UserProjection.undefined()}) async {
    final userKey = userEmail ?? _userEmail;
    if (userKey == null) return null;
    return _superAdminApi?.users?.get(
      userKey,
      projection: projection.value,
    );
  }

/*
  /// Get person data (throws)
  Future<Person> resolvePersonData() async {
    if (_userEmail == null) return Person();
    final groups = await fetchUserGroups(_userEmail);
    final groupIds = groups.map((group) => group.email);

    final role = resolvePersonRole(groupIds);
    if (role == null) return null;

    switch (role) {
      case PersonRole.teacher:
        return Person(
            role: role, teacherDepartment: resolveTeacherDepartment(groupIds));
        break;
      case PersonRole.student:
        final academicYear = resolveAcademicYear(groupIds);
        final academicTrack = resolveAcademicTrack(groupIds);
        return Person(
          role: role,
          academicYear: academicYear,
          academicTrack: academicTrack,
          studentCalendarId: resolveStudentCalendarId(
            academicYear,
            academicTrack,
          ),
        );
        break;
      default:
        return Person();
    }
  }
*/

  /// Get groups whose user with [userId] is member of (requires admin client)
  Future<List<Group>> fetchUserGroups(String userId) async {
    final groups = await _superAdminApi?.groups?.list(userKey: userId);
    return groups?.groups;
  }

  // TODO delete this
  /// Get user is teacher (uses admin client) by checking
  /// if user is member of teachers group
  // Future<bool> userIsTeacher() async {
  //   if (_userEmail == null) return false;
  //   final adminApi = AdminApi(_adminClient);
  //   final result =
  //       await adminApi.members.hasMember(GSUITE_TEACHERS_GROUP_KEY, _userEmail);
  //   return result.isMember;
  // }

  /// Returns the list of members email adresses of given group (requires admin client)
  Future<List<Member>> fetchGroupMembers(String groupKey) async {
    final result = await _adminApi.members.list(groupKey);
    return result.members;
  }

  /// Returns the full list of users (requires admin client)
  Future<List<User>> searchForUser(String query) async {
    final directory = AdminApi(_adminClient);
    final result = await directory.users.list(
      query: query,
      domain: 'alicialonso.org',
      maxResults: 100,
    );
    return result.users;
  }

  //-                                 CALENDAR

  /// Returns all calendars available for the user the auth client is impersonating
  Future<List<CalendarListEntry>> fetchUserCalendars([minAccessRole]) async {
    final calendarList = await _calendarApi.calendarList.list();
    return calendarList.items;
  }

  /// Returns the calendar for the provided Id if premissions allow it
  Future<CalendarListEntry> fetchSingleCalendar(String id) async =>
      _calendarApi.calendarList.get(id);

  /// Returns all events of the specified calendarId
  Future<List<Event>> fetchCalendarEvents(String calendarId) async {
    final events = await _calendarApi.events.list(calendarId);
    return events.items;
  }

  /// Returns events using admin credentials
  Future<List<Event>> fetchCalendarEventsAsAdmin(String calendarId) async {
    final calendarAdminApi = CalendarApi(_adminClient);
    final events =
        await calendarAdminApi.events.list(calendarId, maxResults: 300);
    return events.items;
  }

  /// Returns all events that are programmed to take place from the request moment
  /// to end of day (23:59h) from all calendars of the impersonated user
  /// or those ids if provided
  Future<List<Tuple2<String, Event>>> fetchTodayEvents({
    List<String> calendars = const <String>[],
  }) async {
    try {
      if (calendars.isEmpty) {
        final fetched = await _calendarApi.calendarList.list();
        calendars.addAll(fetched.items.map((calendar) => calendar.id));
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
        if (events.items.isEmpty) continue;

        response.addAll(events.items.map((event) => Tuple2(calendarId, event)));
      }
      return response
        ..sort(
          (t1, t2) => t1.value2.start.dateTime != null &&
                  t2.value2.start.dateTime != null
              ? t1.value2.start.dateTime.compareTo(t2.value2.start.dateTime)
              : 1,
        );
    } catch (e) {
      rethrow;
    }
  }

  /// Returns all events from all calendars available to the impersonated
  /// user or those ids if provided
  Future<List<CalendarEvent>> fetchAllEvents({
    List<String> calendars = const [],
  }) async {
    try {
      final fetched = await _calendarApi.calendarList.list();
      calendars.addAll([
        // TODO make a way to include a set of calendar ids to accomodate this
        //!...CALENDAR_ID_OFFICIAL_DEFAULT_LIST,
        ...fetched.items.map((calendar) => calendar.id),
      ]);
      final calendarIds = calendars.toSet().toList();

      final List<CalendarEvent> response = [];

      for (final calendarId in calendarIds) {
        final events = await _calendarApi.events.list(
          calendarId,
          singleEvents: true,
        );
        if (events.items.isEmpty) continue;

        response.addAll(events.items.map(
            (event) => CalendarEvent(calendarId: calendarId, event: event)));
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// Returns all events from all calendars available to the impersonated
  /// user or those ids if provided
  Future<CalendarEvent> fetchSingle(String jointCalendarAndEventId) async {
    try {
      if (jointCalendarAndEventId == null || jointCalendarAndEventId.isEmpty) {
        return null;
      }
      final ids = jointCalendarAndEventId.split('|');
      final event = await _calendarApi.events.get(ids[0], ids[1]);
      return CalendarEvent(calendarId: ids[0], event: event);
    } catch (e) {
      rethrow;
    }
  }

  /// Fetch event's attendees
  Future<List<EventAttendee>> fetchEventAttendees(
      String calendarId, String eventId) async {
    try {
      final event = await _calendarApi.events.get(calendarId, eventId);
      return event.attendees;
    } catch (e) {
      rethrow;
    }
  }

  //-                                 CLASSROOM

  /// Returns all available teaching [Course] of the signed in user
  Future<List<Course>> fetchUserCourses() async {
    try {
      final coursesResponse = await _classroomApi.courses.list(
        teacherId: _userEmail,
      );
      if (coursesResponse.courses == null || coursesResponse.courses.isEmpty) {
        final studentCourses =
            await _classroomApi.courses.list(studentId: _userEmail);
        return studentCourses.courses ?? [];
      }
      return coursesResponse.courses;
    } catch (e) {
      rethrow;
    }
  }

  /// Returns all CourseModels available for the signed in users
  Future<Map<dynamic, CourseModel>> fetchUserCourseModels() async {
    try {
      final courses = await fetchUserCourses();
      if (courses == null || courses.isEmpty) return {};
      final futureGroup = FutureGroup<CourseModel>();
      for (final course in courses) {
        futureGroup.add(fetchSingleUserCourseModel(null, course: course));
      }
      futureGroup.close();
      final models = await futureGroup.future;
      return models.asMap().map(
          (key, courseModel) => MapEntry(courseModel.course.id, courseModel));
    } catch (e) {
      rethrow;
    }
  }

  /// Returns a single course model if available for the signed in user
  Future<CourseModel> fetchSingleUserCourseModel(String courseId,
      {Course course}) async {
    final _course = course ?? await fetchSingleCourse(courseId);
    final result = await Future.wait<List<UserProfile>>([
      fetchCourseTeachers(courseId ?? course.id),
      fetchCourseStudents(courseId ?? course.id),
    ]);

    return CourseModel(
      course: _course,
      teachers: result[0],
      students: result[1],
    );
  }

  /// Returns a single [Course] by its id
  Future<Course> fetchSingleCourse(String id) async =>
      _classroomApi.courses.get(id);

  /// Returns a list of [UserProfile] of all students of the specified courseId
  Future<List<UserProfile>> fetchCourseStudents(String courseId) async {
    try {
      final response =
          await ClassroomApi(_adminClient).courses.students.list(courseId);
      return response == null || response.students == null
          ? []
          : response.students.map((student) => student.profile).toList();
    } catch (e) {
      rethrow;
    }
  }

  /// Returns a list of [UserProfile] of all teachers of the specified courseId
  Future<List<UserProfile>> fetchCourseTeachers(String courseId) async {
    try {
      final response =
          await ClassroomApi(_adminClient).courses.teachers.list(courseId);
      return response.teachers.map((teacher) => teacher.profile).toList();
    } catch (e) {
      rethrow;
    }
  }

  /// Returns true if the provided email is a teacher of the specified course
  Future<bool> checkTeacher(String courseId, String userEmail) async {
    try {
      final teachers = await fetchCourseTeachers(courseId);
      return teachers
          .where((teacher) => teacher.emailAddress == userEmail)
          .isNotEmpty;
    } catch (e) {
      rethrow;
    }
  }

  //-                                 REPORTS

  /// Returns a list of google meet conference events for the specified [start]
  /// time and [end] time or the last day if not provided.
  ///
  /// **Requires [client] with SuperAdmin privileges**
  Future<List<MeetEvent>> getMeetReport({
    DateTime start,
    DateTime end,
    String userId,
  }) async {
    try {
      final String startTime = start != null && start.isBefore(end)
          ? start.toUtc().toIso8601String()
          : DateTime.now()
              .subtract(const Duration(days: 7))
              .toUtc()
              .toIso8601String();
      final String endTime = end != null && end.isAfter(start)
          ? end.toUtc().toIso8601String()
          : DateTime.now().toUtc().toIso8601String();

      final response = await _reportsApi.activities.list(
        'all',
        'meet',
        maxResults: 1000,
        eventName: 'call_ended',
        startTime: startTime,
        endTime: endTime,
      );

      if (response == null ||
          response?.items == null ||
          response.items.isEmpty) {
        return [];
      }

      final List<MeetEvent> conferences = [];

      for (final activity in response.items) {
        // ignore activity items without callEndedEvent.conferenceId
        if (activity.callEndedEvent == null ||
            activity.callEndedEvent.conferenceId == null) continue;

        int index = conferences.indexWhere(
          (conference) =>
              conference.conferenceId == activity.callEndedEvent.conferenceId,
        );

        // if no MeetEvent found for the activity
        if (index == -1) {
          // add new MeetEvent
          conferences.add(MeetEvent(
            conferenceId: activity.callEndedEvent.conferenceId,
            organizerEmail: activity.callEndedEvent.organizerEmail,
            meetingCode: activity.callEndedEvent.meetingCode,
          ));
          index = conferences.length - 1;
        }

        conferences[index].addAttendee(activity);
      }

      //= Filter by userId attended
      if (userId != null) {
        return conferences
            .where((conference) => conference.attended.containsKey(userId))
            .toList();
      }

      return conferences;
    } catch (e) {
      print(e);
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
  if (userEmail == null) {
    throw Exception(
      'Google Authorization Failure: email cannot be null',
    );
  }
  if (serviceAccountJSONCredentials == null) {
    throw Exception(
      'Google Authorization Failure: JSON credentials cannot be null',
    );
  }
  try {
    final AuthClient client = await clientViaServiceAccount(
      ServiceAccountCredentials.fromJson(
        serviceAccountJSONCredentials,
        impersonatedUser: userEmail,
      ),
      SCOPES,
    );
    if (client == null) {
      throw Exception(
        'Google Authorization Failure: client could not be resolved',
      );
    }
    return client;
  } catch (err) {
    rethrow;
  }
}
