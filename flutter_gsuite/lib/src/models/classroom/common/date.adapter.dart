import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_constants.dart';

class DateAdapter extends TypeAdapter<Date> {
  final int _typeId;
  DateAdapter([this._typeId = TYPE_ID_DATE]);

  @override
  int get typeId => _typeId;

  @override
  Date read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = Date();
    resource.day = fields[0] as int?;
    resource.month = fields[1] as int?;
    resource.year = fields[2] as int?;

    return resource;
  }

  @override
  void write(BinaryWriter writer, Date obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.month)
      ..writeByte(2)
      ..write(obj.year);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is DateAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
