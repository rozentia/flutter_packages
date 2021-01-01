import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_constants.dart';

class NameAdapter extends TypeAdapter<Name> {
  @override
  final int typeId = TYPE_ID_NAME;

  @override
  Name read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final name = Name();
    name.familyName = fields[0] as String;
    name.fullName = fields[1] as String;
    name.givenName = fields[2] as String;
    return name;
  }

  @override
  void write(BinaryWriter writer, Name obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write<String>(obj.familyName)
      ..writeByte(1)
      ..write<String>(obj.fullName)
      ..writeByte(2)
      ..write<String>(obj.givenName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
