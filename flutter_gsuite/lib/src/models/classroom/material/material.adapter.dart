import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_constants.dart';

class MaterialAdapter extends TypeAdapter<Material> {
  @override
  final int typeId = TYPE_ID_MATERIAL;

  @override
  Material read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = Material();
    resource.driveFile = fields[0] as SharedDriveFile;
    resource.form = fields[1] as Form;
    resource.link = fields[2] as Link;
    resource.youtubeVideo = fields[3] as YouTubeVideo;
    return resource;
  }

  @override
  void write(BinaryWriter writer, Material obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.driveFile)
      ..writeByte(1)
      ..write(obj.form)
      ..writeByte(2)
      ..write(obj.link)
      ..writeByte(3)
      ..write(obj.youtubeVideo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is MaterialAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
