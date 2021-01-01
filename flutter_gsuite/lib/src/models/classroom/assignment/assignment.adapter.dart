import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_constants.dart';

class AssignmentAdapter extends TypeAdapter<Assignment> {
  @override
  final int typeId = TYPE_ID_ASSIGNMENT;

  @override
  Assignment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = Assignment();
    resource.studentWorkFolder = fields[0] as DriveFolder;
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
      other is AssignmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
