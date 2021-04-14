import 'package:googleapis/admin/reports_v1.dart';

import './meet_event.extensions.dart';

class AttendeeData {
  /// The date and time when the `'call_ended'` event took place
  final DateTime? end;

  /// The duration for which the participant stayed in the meeting.
  final Duration? duration;

  /// The unique participant identifier (for example, an email address, phone number, or device ID).
  final String? identifier;

  /// Indicates the type of the participant identifier. Possible values:
  ///
  ///- `'device_id'`: The unique device identifier of the Meet hardware.
  ///- `'email_address'`: The participant's email address. Visible when the participant is in-domain or when their email address is visible in the calendar invite.
  ///- `'phone_number'`: The participant's telephone number.
  final String? identifierType;

  /// Indicates if the participant is external to your organization.
  final bool? isExternal;

  /// The country from which the participant joined.
  final String? locationCountry;

  /// The city or geographical region within a country from which the participant joined.
  final String? locationRegion;

  /// The start date and time when the call was started taking into account the end time and the duration of the call
  DateTime get start => end!.subtract(duration!);

  const AttendeeData({
    this.end,
    this.duration,
    this.identifier,
    this.identifierType,
    this.isExternal,
    this.locationCountry,
    this.locationRegion,
  });

  /// Returns the AttendeeData from an [activity] event if such has a callEndedEvent,
  /// otherwise it will throw
  factory AttendeeData.fromActivityEvent(
    Activity activity,
  ) =>
      activity.callEndedEvent == null
          ? throw Exception('activity has no callEndedEvent')
          : AttendeeData(
              end: activity.id!.time!.toUtc(),
              duration: activity.callEndedEvent!.duration,
              identifier: activity.callEndedEvent!.identifier,
              identifierType: activity.callEndedEvent!.identifierType,
              isExternal: activity.callEndedEvent!.isExternal,
              locationCountry: activity.callEndedEvent!.locationCountry,
              locationRegion: activity.callEndedEvent!.locationRegion,
            );

  @override
  String toString() => '''
  AttendeeData: $identifier [type: $identifierType] 
    time: ${start.toLocal().hour}:${start.toLocal().minute} to ${end!.toLocal().hour}:${end!.toLocal().minute} ($duration)
    location: $locationRegion, $locationCountry
    isExternal: $isExternal
  ''';
}
