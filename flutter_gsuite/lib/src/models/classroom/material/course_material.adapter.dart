import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_constants.dart';

class CourseMaterialAdapter extends TypeAdapter<CourseMaterial> {
  final int _typeId;
  @override
  int get typeId => _typeId;

  CourseMaterialAdapter([this._typeId = TYPE_ID_COURSE_MATERIAL]);

  @override
  CourseMaterial read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = CourseMaterial();
    resource.driveFile = fields[0] as DriveFile?;
    resource.form = fields[1] as Form?;
    resource.link = fields[2] as Link?;
    resource.youTubeVideo = fields[3] as YouTubeVideo?;
    return resource;
  }

  @override
  void write(BinaryWriter writer, CourseMaterial obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.driveFile)
      ..writeByte(1)
      ..write(obj.form)
      ..writeByte(2)
      ..write(obj.link)
      ..writeByte(3)
      ..write(obj.youTubeVideo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseMaterialAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
