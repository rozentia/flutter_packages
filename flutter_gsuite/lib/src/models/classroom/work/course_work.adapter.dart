import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_constants.dart';

class CourseWorkAdapter extends TypeAdapter<CourseWork> {
  @override
  final int typeId = TYPE_ID_COURSE_WORK;

  @override
  CourseWork read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = CourseWork();
    resource.alternateLink = fields[0] as String;
    resource.assigneeMode = fields[1] as String;
    resource.assignment = fields[2] as Assignment;
    resource.associatedWithDeveloper = fields[3] as bool;
    resource.creationTime = fields[4] as String;
    resource.description = fields[5] as String;
    resource.creatorUserId = fields[6] as String;
    resource.id = fields[7] as String;
    resource.dueDate = fields[8] as Date;
    resource.dueTime = fields[9] as TimeOfDay;
    resource.individualStudentsOptions =
        fields[10] as IndividualStudentsOptions;
    resource.materials = fields[11] as List<Material>;
    resource.maxPoints = fields[12] as double;
    resource.updateTime = fields[13] as String;
    resource.multipleChoiceQuestion = fields[14] as MultipleChoiceQuestion;
    resource.scheduledTime = fields[15] as String;
    resource.state = fields[16] as String;
    resource.submissionModificationMode = fields[17] as String;
    resource.title = fields[18] as String;
    resource.topicId = fields[19] as String;
    resource.workType = fields[20] as String;

    return resource;
  }

  @override
  void write(BinaryWriter writer, CourseWork obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.alternateLink)
      ..writeByte(1)
      ..write(obj.assigneeMode)
      ..writeByte(2)
      ..write(obj.assignment)
      ..writeByte(3)
      ..write(obj.associatedWithDeveloper)
      ..writeByte(4)
      ..write(obj.creationTime)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.creatorUserId)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.dueDate)
      ..writeByte(9)
      ..write(obj.dueTime)
      ..writeByte(10)
      ..write(obj.individualStudentsOptions)
      ..writeByte(11)
      ..write(obj.materials)
      ..writeByte(12)
      ..write(obj.maxPoints)
      ..writeByte(13)
      ..write(obj.updateTime)
      ..writeByte(14)
      ..write(obj.multipleChoiceQuestion)
      ..writeByte(15)
      ..write(obj.scheduledTime)
      ..writeByte(16)
      ..write(obj.state)
      ..writeByte(17)
      ..write(obj.submissionModificationMode)
      ..writeByte(18)
      ..write(obj.title)
      ..writeByte(19)
      ..write(obj.topicId)
      ..writeByte(20)
      ..write(obj.workType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseWorkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
