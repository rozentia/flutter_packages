import 'package:flutter_gsuite/src/constants/hive_constants.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:hive/hive.dart';

class CalendarListEntryAdapter extends TypeAdapter<CalendarListEntry> {
  final int _typeId;
  CalendarListEntryAdapter([this._typeId = TYPE_ID_CALENDAR]);

  @override
  int get typeId => _typeId;

  @override
  CalendarListEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = CalendarListEntry();
    resource.accessRole = fields[0] as String?;
    resource.backgroundColor = fields[1] as String?;
    resource.colorId = fields[2] as String?;
    resource.deleted = fields[3] as bool?;
    resource.description = fields[4] as String?;
    resource.foregroundColor = fields[5] as String?;
    resource.hidden = fields[6] as bool?;
    resource.id = fields[7] as String?;
    resource.location = fields[8] as String?;
    resource.primary = fields[9] as bool?;
    resource.summary = fields[10] as String?;
    resource.summaryOverride = fields[11] as String?;
    resource.timeZone = fields[12] as String?;
    return resource;
  }

  @override
  void write(BinaryWriter writer, CalendarListEntry obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.accessRole)
      ..writeByte(1)
      ..write(obj.backgroundColor)
      ..writeByte(2)
      ..write(obj.colorId)
      ..writeByte(3)
      ..write(obj.deleted)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.foregroundColor)
      ..writeByte(6)
      ..write(obj.hidden)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.location)
      ..writeByte(9)
      ..write(obj.primary)
      ..writeByte(10)
      ..write(obj.summary)
      ..writeByte(11)
      ..write(obj.summaryOverride)
      ..writeByte(12)
      ..write(obj.timeZone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarListEntryAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
