import 'package:flutter_gsuite/src/constants/hive_constants.dart';
import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

class SubmissionHistoryAdapter extends TypeAdapter<SubmissionHistory> {
  final int _typeId;
  @override
  int get typeId => _typeId;

  SubmissionHistoryAdapter([this._typeId = TYPE_ID_SUBMISSION_HISTORY]);

  @override
  SubmissionHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = SubmissionHistory();
    resource.gradeHistory = fields[0] as GradeHistory?;
    resource.stateHistory = fields[1] as StateHistory?;

    return resource;
  }

  @override
  void write(BinaryWriter writer, SubmissionHistory obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.gradeHistory)
      ..writeByte(1)
      ..write(obj.stateHistory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubmissionHistoryAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
