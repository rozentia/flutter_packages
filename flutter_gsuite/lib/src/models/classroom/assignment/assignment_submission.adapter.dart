import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_constants.dart';

class AssignmentSubmissionAdapter extends TypeAdapter<AssignmentSubmission> {
  @override
  final int typeId = TYPE_ID_ASSIGNMENT_SUBMISSION;

  @override
  AssignmentSubmission read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = AssignmentSubmission();
    resource.attachments = (fields[0] as List)?.cast<Attachment>();
    return resource;
  }

  @override
  void write(BinaryWriter writer, AssignmentSubmission obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.attachments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssignmentSubmissionAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
