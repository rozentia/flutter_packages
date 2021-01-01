import 'package:flutter/foundation.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:hive/hive.dart';

import '../../constants/hive_constants.dart';

part 'calendar_event.m.g.dart';

@HiveType(typeId: TYPE_ID_CALENDAR_EVENT)
class CalendarEvent {
  @HiveField(0)
  final String calendarId;
  @HiveField(1)
  final Event event;

  CalendarEvent({
    @required this.calendarId,
    @required this.event,
  });
}
