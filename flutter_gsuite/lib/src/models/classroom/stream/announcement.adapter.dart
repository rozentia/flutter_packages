import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_constants.dart';

class AnnouncementAdapter extends TypeAdapter<Announcement> {
  @override
  final int typeId = TYPE_ID_ANNOUNCEMENT;

  @override
  Announcement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final course = Announcement();
    course.alternateLink = fields[0] as String;
    course.assigneeMode = fields[1] as String;
    course.courseId = fields[2] as String;
    course.creatorUserId = fields[3] as String;
    course.creationTime = fields[4] as String;
    course.id = fields[5] as String;
    course.individualStudentsOptions = fields[6] as IndividualStudentsOptions;
    course.materials = (fields[7] as List)?.cast<Material>();
    course.scheduledTime = fields[8] as String;
    course.state = fields[9] as String;
    course.text = fields[10] as String;
    course.updateTime = fields[11] as String;
    return course;
  }

  @override
  void write(BinaryWriter writer, Announcement obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.alternateLink)
      ..writeByte(1)
      ..write(obj.assigneeMode)
      ..writeByte(2)
      ..write(obj.courseId)
      ..writeByte(3)
      ..write(obj.creatorUserId)
      ..writeByte(4)
      ..write(obj.creationTime)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.individualStudentsOptions)
      ..writeByte(7)
      ..write(obj.materials)
      ..writeByte(8)
      ..write(obj.scheduledTime)
      ..writeByte(9)
      ..write(obj.state)
      ..writeByte(10)
      ..write(obj.text)
      ..writeByte(11)
      ..write(obj.updateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnnouncementAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
