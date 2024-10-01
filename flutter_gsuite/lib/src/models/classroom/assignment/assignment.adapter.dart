import 'package:flutter_gsuite/src/constants/hive_constants.dart';
import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

class AssignmentAdapter extends TypeAdapter<Assignment> {
  final int _typeId;
  AssignmentAdapter([this._typeId = TYPE_ID_ASSIGNMENT]);

  @override
  int get typeId => _typeId;

  @override
  Assignment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = Assignment();
    resource.studentWorkFolder = fields[0] as DriveFolder?;
    return resource;
  }

  @override
  void write(BinaryWriter writer, Assignment obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.studentWorkFolder);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssignmentAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
