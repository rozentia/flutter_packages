import '../../../constants/hive_constants.dart';
import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

class YouTubeVideoMaterialAdapter extends TypeAdapter<YouTubeVideo> {
  @override
  final int typeId = TYPE_ID_YOUTUBEVIDEO_MATERIAL;

  @override
  YouTubeVideo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final course = YouTubeVideo();
    course.alternateLink = fields[0] as String?;
    course.id = fields[1] as String?;
    course.thumbnailUrl = fields[2] as String?;
    course.title = fields[3] as String?;
    return course;
  }

  @override
  void write(BinaryWriter writer, YouTubeVideo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.alternateLink)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.thumbnailUrl)
      ..writeByte(3)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YouTubeVideoMaterialAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
