import 'package:flutter_gsuite/src/models/calendar_event/calendar_event.m.dart';
import 'package:shared_extensions/shared_extensions.dart';

extension ExtendedCalendarEvent on Iterable<CalendarEvent> {
  /// Returns a map with date as key and a list of events for that date as value
  Map<DateTime, List<CalendarEvent>> get events => fold<Map<DateTime, List<CalendarEvent>>>(
        {},
        (prev, curr) => prev
          ..update(
            curr.event!.start!.dateTime?.flattenTime ??
                curr.event!.start!.date?.flattenTime ??
                DateTime.now().flattenTime,
            (calendarEvents) => calendarEvents..add(curr),
            ifAbsent: () => [curr],
          ),
      );
}
