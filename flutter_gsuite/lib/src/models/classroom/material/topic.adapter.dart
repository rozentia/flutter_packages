import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_constants.dart';

class TopicAdapter extends TypeAdapter<Topic> {
  @override
  final int typeId = TYPE_ID_TOPIC;

  @override
  Topic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = Topic();
    resource.courseId = fields[0] as String;
    resource.topicId = fields[1] as String;
    resource.name = fields[2] as String;
    resource.updateTime = fields[3] as String;

    return resource;
  }

  @override
  void write(BinaryWriter writer, Topic obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.courseId)
      ..writeByte(1)
      ..write(obj.topicId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.updateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is TopicAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
