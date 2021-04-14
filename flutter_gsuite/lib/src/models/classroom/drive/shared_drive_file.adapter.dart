import '../../../constants/hive_constants.dart';
import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

class SharedDriveFileAdapter extends TypeAdapter<SharedDriveFile> {
  @override
  final int typeId = TYPE_ID_SHARED_DRIVE_FILE;

  @override
  SharedDriveFile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = SharedDriveFile();
    resource.driveFile = fields[0] as DriveFile?;
    resource.shareMode = fields[1] as String?;
    return resource;
  }

  @override
  void write(BinaryWriter writer, SharedDriveFile obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.driveFile)
      ..writeByte(1)
      ..write(obj.shareMode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SharedDriveFileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
