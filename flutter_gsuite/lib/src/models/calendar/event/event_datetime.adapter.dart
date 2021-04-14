import 'package:googleapis/calendar/v3.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_constants.dart';

class EventDateTimeAdapter extends TypeAdapter<EventDateTime> {
  @override
  int get typeId => TYPE_ID_EVENT_DATETIME;

  @override
  EventDateTime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = EventDateTime();
    resource.date = fields[0] as DateTime?;
    resource.dateTime = fields[1] as DateTime?;
    resource.timeZone = fields[2] as String?;

    return resource;
  }

  @override
  void write(BinaryWriter writer, EventDateTime obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.dateTime)
      ..writeByte(2)
      ..write(obj.timeZone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventDateTimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
