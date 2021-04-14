import '../../../constants/hive_constants.dart';
import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

class DriveFileAdapter extends TypeAdapter<DriveFile> {
  @override
  final int typeId = TYPE_ID_DRIVE_FILE;

  @override
  DriveFile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = DriveFile();
    resource.alternateLink = fields[0] as String?;
    resource.id = fields[1] as String?;
    resource.thumbnailUrl = fields[2] as String?;
    resource.title = fields[3] as String?;
    return resource;
  }

  @override
  void write(BinaryWriter writer, DriveFile obj) {
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
      other is DriveFileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
