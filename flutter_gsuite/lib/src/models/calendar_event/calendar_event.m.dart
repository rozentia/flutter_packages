import 'package:flutter_gsuite/src/constants/hive_constants.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:hive/hive.dart';

part 'calendar_event.m.g.dart';

// TODO Solve this adapter... (it still uses only the constant values for type id)

@HiveType(typeId: TYPE_ID_CALENDAR_EVENT)
class CalendarEvent {
  @HiveField(0)
  final String? calendarId;
  @HiveField(1)
  final Event? event;

  CalendarEvent({
    required this.calendarId,
    required this.event,
  });
}
