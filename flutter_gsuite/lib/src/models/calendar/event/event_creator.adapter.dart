import 'package:flutter_gsuite/src/constants/hive_constants.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:hive/hive.dart';

class EventCreatorAdapter extends TypeAdapter<EventCreator> {
  final int _typeId;
  EventCreatorAdapter([this._typeId = TYPE_ID_EVENT_CREATOR]);

  @override
  int get typeId => _typeId;

  @override
  EventCreator read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = EventCreator();
    resource.displayName = fields[0] as String?;
    resource.email = fields[1] as String?;
    resource.id = fields[2] as String?;
    resource.self = fields[3] as bool?;

    return resource;
  }

  @override
  void write(BinaryWriter writer, EventCreator obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.displayName)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.self);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventCreatorAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
