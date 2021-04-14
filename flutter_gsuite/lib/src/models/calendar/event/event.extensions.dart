import 'package:googleapis/calendar/v3.dart';

extension ExtendedEvent on Event {
  bool compareTo(Event other) =>
      id == other.id &&
      start!.date == other.start!.date &&
      start!.dateTime == other.start!.dateTime &&
      end!.date == other.end!.date &&
      end!.dateTime == other.end!.dateTime &&
      description == other.description &&
      summary == other.summary &&
      recurringEventId == other.recurringEventId &&
      status == other.status;
}
