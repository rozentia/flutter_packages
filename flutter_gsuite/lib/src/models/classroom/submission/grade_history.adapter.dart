import 'package:flutter_gsuite/src/constants/hive_constants.dart';
import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

class GradeHistoryAdapter extends TypeAdapter<GradeHistory> {
  final int _typeId;
  @override
  int get typeId => _typeId;

  GradeHistoryAdapter([this._typeId = TYPE_ID_GRADE_HISTORY]);

  @override
  GradeHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = GradeHistory();
    resource.actorUserId = fields[0] as String?;
    resource.gradeChangeType = fields[1] as String?;
    resource.gradeTimestamp = fields[2] as String?;
    resource.maxPoints = fields[3] as double?;
    resource.pointsEarned = fields[4] as double?;

    return resource;
  }

  @override
  void write(BinaryWriter writer, GradeHistory obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.actorUserId)
      ..writeByte(1)
      ..write(obj.gradeChangeType)
      ..writeByte(2)
      ..write(obj.gradeTimestamp)
      ..writeByte(3)
      ..write(obj.maxPoints)
      ..writeByte(4)
      ..write(obj.pointsEarned);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GradeHistoryAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
