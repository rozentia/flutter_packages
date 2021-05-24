import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_constants.dart';

class MultipleChoiceSubmissionAdapter extends TypeAdapter<MultipleChoiceSubmission> {
  final int _typeId;
  @override
  int get typeId => _typeId;

  MultipleChoiceSubmissionAdapter([this._typeId = TYPE_ID_MULTIPLE_CHOICE_SUBMISSION]);

  @override
  MultipleChoiceSubmission read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = MultipleChoiceSubmission();
    resource.answer = fields[0] as String?;

    return resource;
  }

  @override
  void write(BinaryWriter writer, MultipleChoiceSubmission obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.answer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MultipleChoiceSubmissionAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
