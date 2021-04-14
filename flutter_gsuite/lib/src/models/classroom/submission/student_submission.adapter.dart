import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_constants.dart';

class StudentSubmissionAdapter extends TypeAdapter<StudentSubmission> {
  @override
  final int typeId = TYPE_ID_STUDENT_SUBMISSION;

  @override
  StudentSubmission read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = StudentSubmission();
    resource.alternateLink = fields[0] as String?;
    resource.assignedGrade = fields[1] as double?;
    resource.assignmentSubmission = fields[2] as AssignmentSubmission?;
    resource.associatedWithDeveloper = fields[3] as bool?;
    resource.creationTime = fields[4] as String?;
    resource.courseId = fields[5] as String?;
    resource.courseWorkId = fields[6] as String?;
    resource.id = fields[7] as String?;
    resource.courseWorkType = fields[8] as String?;
    resource.late = fields[9] as bool?;
    resource.draftGrade = fields[10] as double?;
    resource.updateTime = fields[11] as String?;
    resource.multipleChoiceSubmission = fields[12] as MultipleChoiceSubmission?;
    resource.shortAnswerSubmission = fields[13] as ShortAnswerSubmission?;
    resource.state = fields[14] as String?;
    resource.submissionHistory = (fields[15] as List?)?.cast<SubmissionHistory>();
    resource.userId = fields[16] as String?;

    return resource;
  }

  @override
  void write(BinaryWriter writer, StudentSubmission obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.alternateLink)
      ..writeByte(1)
      ..write(obj.assignedGrade)
      ..writeByte(2)
      ..write(obj.assignmentSubmission)
      ..writeByte(3)
      ..write(obj.associatedWithDeveloper)
      ..writeByte(4)
      ..write(obj.creationTime)
      ..writeByte(5)
      ..write(obj.courseId)
      ..writeByte(6)
      ..write(obj.courseWorkId)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.courseWorkType)
      ..writeByte(9)
      ..write(obj.late)
      ..writeByte(10)
      ..write(obj.draftGrade)
      ..writeByte(11)
      ..write(obj.updateTime)
      ..writeByte(12)
      ..write(obj.multipleChoiceSubmission)
      ..writeByte(13)
      ..write(obj.shortAnswerSubmission)
      ..writeByte(14)
      ..write(obj.state)
      ..writeByte(15)
      ..write(obj.submissionHistory)
      ..writeByte(16)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentSubmissionAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
