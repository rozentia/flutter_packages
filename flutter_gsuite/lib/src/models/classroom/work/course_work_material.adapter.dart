import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_constants.dart';

class CourseWorkMaterialAdapter extends TypeAdapter<CourseWorkMaterial> {
  @override
  final int typeId = TYPE_ID_COURSE_WORK_MATERIAL;

  @override
  CourseWorkMaterial read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = CourseWorkMaterial();
    resource.alternateLink = fields[0] as String;
    resource.assigneeMode = fields[1] as String;
    resource.courseId = fields[2] as String;
    resource.individualStudentsOptions = fields[3] as IndividualStudentsOptions;
    resource.creationTime = fields[4] as String;
    resource.description = fields[5] as String;
    resource.creatorUserId = fields[6] as String;
    resource.id = fields[7] as String;
    resource.materials = fields[8] as List<Material>;
    resource.updateTime = fields[9] as String;
    resource.scheduledTime = fields[10] as String;
    resource.state = fields[11] as String;
    resource.title = fields[12] as String;
    resource.topicId = fields[13] as String;

    return resource;
  }

  @override
  void write(BinaryWriter writer, CourseWorkMaterial obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.alternateLink)
      ..writeByte(1)
      ..write(obj.assigneeMode)
      ..writeByte(2)
      ..write(obj.courseId)
      ..writeByte(3)
      ..write(obj.individualStudentsOptions)
      ..writeByte(4)
      ..write(obj.creationTime)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.creatorUserId)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.materials)
      ..writeByte(9)
      ..write(obj.updateTime)
      ..writeByte(10)
      ..write(obj.scheduledTime)
      ..writeByte(11)
      ..write(obj.state)
      ..writeByte(12)
      ..write(obj.title)
      ..writeByte(13)
      ..write(obj.topicId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseWorkMaterialAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
