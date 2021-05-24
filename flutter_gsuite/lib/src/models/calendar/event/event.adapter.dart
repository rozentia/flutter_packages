import 'package:googleapis/calendar/v3.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_constants.dart';

class EventAdapter extends TypeAdapter<Event> {
  final int _typeId;
  EventAdapter([this._typeId = TYPE_ID_EVENT]);

  @override
  int get typeId => _typeId;

  @override
  Event read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = Event();
    resource.colorId = fields[0] as String?;
    resource.created = fields[1] as DateTime?;
    resource.creator = fields[2] as EventCreator?;
    resource.description = fields[3] as String?;
    resource.end = fields[4] as EventDateTime?;
    resource.endTimeUnspecified = fields[5] as bool?;
    resource.hangoutLink = fields[6] as String?;
    resource.htmlLink = fields[7] as String?;
    resource.id = fields[8] as String?;
    resource.location = fields[9] as String?;
    resource.originalStartTime = fields[10] as EventDateTime?;
    resource.recurrence = (fields[11] as List?)?.cast<String>();
    resource.recurringEventId = fields[12] as String?;
    resource.start = fields[13] as EventDateTime?;
    resource.status = fields[14] as String?;
    resource.summary = fields[15] as String?;
    resource.transparency = fields[16] as String?;
    resource.updated = fields[17] as DateTime?;
    resource.visibility = fields[18] as String?;
    return resource;
  }

  @override
  void write(BinaryWriter writer, Event obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.colorId)
      ..writeByte(1)
      ..write(obj.created)
      ..writeByte(2)
      ..write(obj.creator)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.end)
      ..writeByte(5)
      ..write(obj.endTimeUnspecified)
      ..writeByte(6)
      ..write(obj.hangoutLink)
      ..writeByte(7)
      ..write(obj.htmlLink)
      ..writeByte(8)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.location)
      ..writeByte(10)
      ..write(obj.originalStartTime)
      ..writeByte(11)
      ..write(obj.recurrence)
      ..writeByte(12)
      ..write(obj.recurringEventId)
      ..writeByte(13)
      ..write(obj.start)
      ..writeByte(14)
      ..write(obj.status)
      ..writeByte(15)
      ..write(obj.summary)
      ..writeByte(16)
      ..write(obj.transparency)
      ..writeByte(17)
      ..write(obj.updated)
      ..writeByte(18)
      ..write(obj.visibility);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is EventAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
