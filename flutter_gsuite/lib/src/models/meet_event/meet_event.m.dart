import 'package:googleapis/admin/reports_v1.dart';

import 'attendee_data.m.dart';
import 'meet_event.extensions.dart';

class MeetEvent {
  final String conferenceId;

  final Map<String, List<AttendeeData>> attended = {};
  final String? organizerEmail;
  final String? meetingCode;

  MeetEvent({
    required this.conferenceId,
    required this.organizerEmail,
    required this.meetingCode,
  });

  /// List of all identifiers of teachers who attended
  List<String> get teachers => attended.filterKeys(
        RegExp(r'\.[A-Za-z]+?@alicialonso\.org'),
      );

  /// List of all identifiers of students who attended
  List<String> get students => attended.filterKeys(
        RegExp(r'\.\d{2}@alicialonso\.org'),
      );

  /// List of all identifiers of those who attended
  List<String> get others => attended.keys
      .where(
        (key) => !RegExp(r'\.[A-Za-z]+?@alicialonso\.org').hasMatch(key),
      )
      .uniques
      .cast<String>();

  /// Get aggregated data for attendee key (`identifier`) or null if not present
  AttendeeData? getDataOfAttendee(String identifier) {
    if (!attended.containsKey(identifier)) return null;
    final List<AttendeeData> data = attended[identifier]!;
    return AttendeeData(
      end: data.map<DateTime?>((d) => d.end).toList().latest,
      duration: data.fold(
          const Duration(), ((prev, curr) => prev + curr.duration!) as Duration? Function(Duration?, AttendeeData)),
      identifier: data.first.identifier,
      identifierType: data.first.identifierType,
      isExternal: data.first.isExternal,
      locationCountry: data.first.locationCountry,
      locationRegion: data.first.locationRegion,
    );
  }

  List<DateTime> get _callStartTimes => attended.entries
      .fold<List<DateTime>>(
        [],
        (prev, curr) => [...prev, ...curr.value.map<DateTime>((attendeeData) => attendeeData.start)],
      )
      .uniques
      .cast<DateTime>();

  List<DateTime> get _callEndedTimes => attended.entries
      .fold<List<DateTime?>>(
        [],
        (prev, curr) => [
          ...prev,
          ...curr.value.map<DateTime?>((attendeeData) => attendeeData.end),
        ],
      )
      .uniques
      .cast<DateTime>();

  /// Calculated start time of the conference in UTC
  DateTime get start => _callStartTimes.earliest!.toUtc();

  /// Calculated end time of the conference in UTC
  DateTime get end => _callEndedTimes.latest!.toUtc();

  /// Total calculated duration of the conference
  Duration get duration => end.difference(start);

  /// Add an [Activity] item to the [attended] map
  void addAttendee(Activity activity) {
    if (activity == null || activity.callEndedEvent == null) return;

    final identifier = activity.callEndedEvent!.identifier ?? activity.callEndedEvent!.displayName ?? 'unidentifiable';

    if (!attended.containsKey(identifier)) {
      attended.addEntries([MapEntry(identifier, <AttendeeData>[])]);
    }
    attended[identifier]!.add(AttendeeData.fromActivityEvent(activity));
  }

  @override
  String toString() => '''
  MeetEvent:
    conferenceId: $conferenceId
    organizerEmail: $organizerEmail
    time: ${start.toLocal()} ($duration)
    attendees: (${attended.length})
      ${attended.values.map((e) => e.toString())}
  ''';
}
