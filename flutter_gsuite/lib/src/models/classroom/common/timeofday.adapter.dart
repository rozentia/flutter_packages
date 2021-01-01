import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_constants.dart';

class TimeOfDayAdapter extends TypeAdapter<TimeOfDay> {
  @override
  final int typeId = TYPE_ID_TIME_OF_DAY;

  @override
  TimeOfDay read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = TimeOfDay();
    resource.hours = fields[0] as int;
    resource.minutes = fields[1] as int;
    resource.nanos = fields[2] as int;
    resource.seconds = fields[3] as int;

    return resource;
  }

  @override
  void write(BinaryWriter writer, TimeOfDay obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.hours)
      ..writeByte(1)
      ..write(obj.minutes)
      ..writeByte(2)
      ..write(obj.nanos)
      ..writeByte(3)
      ..write(obj.seconds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeOfDayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
