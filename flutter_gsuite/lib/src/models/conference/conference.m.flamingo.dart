// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conference.m.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum ConferenceKey {
  conferenceId,
  recordId,
  start,
  end,
}

extension ConferenceKeyExtension on ConferenceKey {
  String get value {
    switch (this) {
      case ConferenceKey.conferenceId:
        return 'conferenceId';
      case ConferenceKey.recordId:
        return 'recordId';
      case ConferenceKey.start:
        return 'start';
      case ConferenceKey.end:
        return 'end';
      default:
        return null;
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(Conference doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'conferenceId', doc.conferenceId);
  Helper.writeNotNull(data, 'recordId', doc.recordId);
  Helper.writeNotNull(data, 'start', doc.start);
  Helper.writeNotNull(data, 'end', doc.end);

  return data;
}

/// For load data
void _$fromData(Conference doc, Map<String, dynamic> data) {
  doc.conferenceId = Helper.valueFromKey<String>(data, 'conferenceId');
  doc.recordId = Helper.valueFromKey<String>(data, 'recordId');
  if (data['start'] is Map) {
    doc.start = Helper.timestampFromMap(data, 'start');
  } else {
    doc.start = Helper.valueFromKey<Timestamp>(data, 'start');
  }

  if (data['end'] is Map) {
    doc.end = Helper.timestampFromMap(data, 'end');
  } else {
    doc.end = Helper.valueFromKey<Timestamp>(data, 'end');
  }
}
