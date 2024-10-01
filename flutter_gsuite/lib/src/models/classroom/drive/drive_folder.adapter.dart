import 'package:flutter_gsuite/src/constants/hive_constants.dart';
import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

class DriveFolderAdapter extends TypeAdapter<DriveFolder> {
  final int _typeId;
  @override
  int get typeId => _typeId;

  DriveFolderAdapter([this._typeId = TYPE_ID_DRIVE_FOLDER]);

  @override
  DriveFolder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = DriveFolder();
    resource.alternateLink = fields[0] as String?;
    resource.id = fields[1] as String?;
    resource.title = fields[2] as String?;
    return resource;
  }

  @override
  void write(BinaryWriter writer, DriveFolder obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.alternateLink)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DriveFolderAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
