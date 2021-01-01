import '../../../constants/hive_constants.dart';
import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

class ShortAnswerSubmissionAdapter extends TypeAdapter<ShortAnswerSubmission> {
  @override
  final int typeId = TYPE_ID_SHORT_ANSWER_SUBMISSION;

  @override
  ShortAnswerSubmission read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = ShortAnswerSubmission();
    resource.answer = fields[0] as String;

    return resource;
  }

  @override
  void write(BinaryWriter writer, ShortAnswerSubmission obj) {
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
      other is ShortAnswerSubmissionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
