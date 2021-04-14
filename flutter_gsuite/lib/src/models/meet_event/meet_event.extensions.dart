import 'package:collection/collection.dart' show IterableExtension;
import 'package:googleapis/admin/reports_v1.dart';
import 'package:shared_extensions/shared_extensions.dart';

import 'meet_event.m.dart';

extension ExtendedMeetEvents on List<MeetEvent> {
  // Future<List<MeetEvent>> checkForClaims() async {
  //   final conferenceIdQueries = toSet()
  //       .map<String>((meetEvent) => meetEvent.conferenceId)
  //       .toList()
  //       .chunk(10) //= divide in chunks of 10 or fit whereIn query
  //       .map<Future<List<Conference>>>((conferenceIdChunk) => CollectionPaging<Conference>(
  //             query: Conference().collectionRef.where(
  //                   Conference.fnConferenceId,
  //                   whereIn: conferenceIdChunk,
  //                 ),
  //             limit: 100,
  //             decode: (snap) => Conference(snapshot: snap),
  //           ).load());

  //   final queryResponses = await Future.wait(conferenceIdQueries);

  //   final claimedConferences = queryResponses.fold<List<Conference>>(
  //     [],
  //     (prev, conferences) => [
  //       ...prev,
  //       if (conferences != null && conferences.isNotEmpty) ...conferences,
  //     ],
  //   );

  //   if (claimedConferences == null || claimedConferences.isEmpty) {
  //     return this;
  //   } else {
  //     return map<MeetEvent>((meetEvent) {
  //       final matchingClaim = claimedConferences.firstWhere(
  //         (conference) => meetEvent.conferenceId == conference.conferenceId,
  //         orElse: () => null,
  //       );
  //       return matchingClaim == null ? meetEvent : meetEvent
  //         ..conferenceClaim = matchingClaim;
  //     }).toList();
  //   }
  // }

  Map<DateTime, List<MeetEvent>> get asTableCalendarEvents => fold<Map<DateTime, List<MeetEvent>>>(
        {},
        (prev, curr) => prev
          ..update(
            curr.start.flattenTime,
            (meetEvents) => meetEvents..add(curr),
            ifAbsent: () => [curr],
          ),
      );
}

extension ActivityMeetEvents on Activity {
  /// Returns the first `'call_ended'` event of the activity or null if none exists
  ActivityEvents? get callEndedEvent => events!.firstWhereOrNull(
        (event) => event.name == 'call_ended',
      );
}

extension ActivityEventsParameterGetter on ActivityEvents {
  String? _getParameter(String name) => parameters!.firstWhereOrNull((p) => p.name == name)?.value;
  String? get conferenceId => _getParameter('conference_id');
  String? get organizerEmail => _getParameter('organizer_email');
  String? get displayName => _getParameter('display_name');
  String? get meetingCode => _getParameter('meeting_code');
  String? get identifier => _getParameter('identifier');
  String? get identifierType => _getParameter('identifier_type');
  String? get locationCountry => _getParameter('location_country');
  String? get locationRegion => _getParameter('location_region');
  bool? get isExternal => parameters!.firstWhereOrNull((p) => p.name == 'is_external')?.boolValue;
  Duration get duration => Duration(
        seconds: int.tryParse((parameters ?? [])
                    .firstWhereOrNull(
                      (p) => p.name == 'duration_seconds',
                    )
                    ?.intValue ??
                '') ??
            0,
      );
}

extension Uniques on Iterable<dynamic> {
  /// Return unique values for this list
  List<dynamic> get uniques => toSet().toList();
}

extension MapIds on Map<String, dynamic> {
  /// Returns a list of unique keys filtered by the provided pattern
  List<String> filterKeys(Pattern pattern) => keys
      .fold<List<String>>(
        [],
        (prev, curr) => curr.contains(pattern) ? [...prev, curr] : [...prev],
      )
      .toSet()
      .toList();
}

extension DateList on List<DateTime?> {
  /// Returs a new list sorted from earliest to latest
  List<DateTime?> get sortAscending => toList()..sort((a, b) => a!.compareTo(b!));

  /// Returns a new list sorted from latest to earliest
  List<DateTime?> get sortDescending => toList()..sort((a, b) => b!.compareTo(a!));

  /// Earliest date item in the list
  DateTime? get earliest => sortAscending.first;

  /// Latest date item in the list
  DateTime? get latest => sortDescending.first;

  /// Duration span of the list from its earliest item to its latest
  Duration get duration => latest!.difference(earliest!);
}
