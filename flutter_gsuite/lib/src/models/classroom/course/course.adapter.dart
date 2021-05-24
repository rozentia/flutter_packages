import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_constants.dart';

class CourseAdapter extends TypeAdapter<Course> {
  final int _typeId;
  CourseAdapter([this._typeId = TYPE_ID_COURSE]);

  @override
  int get typeId => _typeId;

  @override
  Course read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = Course();
    resource.alternateLink = fields[0] as String?;
    resource.calendarId = fields[1] as String?;
    resource.courseGroupEmail = fields[2] as String?;
    resource.courseState = fields[3] as String?;
    resource.creationTime = fields[4] as String?;
    resource.description = fields[5] as String?;
    resource.descriptionHeading = fields[6] as String?;
    resource.enrollmentCode = fields[7] as String?;
    resource.id = fields[8] as String?;
    resource.name = fields[9] as String?;
    resource.ownerId = fields[10] as String?;
    resource.room = fields[11] as String?;
    resource.section = fields[12] as String?;
    resource.teacherGroupEmail = fields[13] as String?;
    resource.updateTime = fields[14] as String?;
    return resource;
  }

  @override
  void write(BinaryWriter writer, Course obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.alternateLink)
      ..writeByte(1)
      ..write(obj.calendarId)
      ..writeByte(2)
      ..write(obj.courseGroupEmail)
      ..writeByte(3)
      ..write(obj.courseState)
      ..writeByte(4)
      ..write(obj.creationTime)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.descriptionHeading)
      ..writeByte(7)
      ..write(obj.enrollmentCode)
      ..writeByte(8)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.name)
      ..writeByte(10)
      ..write(obj.ownerId)
      ..writeByte(11)
      ..write(obj.room)
      ..writeByte(12)
      ..write(obj.section)
      ..writeByte(13)
      ..write(obj.teacherGroupEmail)
      ..writeByte(14)
      ..write(obj.updateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CourseAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
