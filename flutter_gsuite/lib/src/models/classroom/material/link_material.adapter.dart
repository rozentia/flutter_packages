import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_constants.dart';

class LinkMaterialAdapter extends TypeAdapter<Link> {
  final int _typeId;
  @override
  int get typeId => _typeId;

  LinkMaterialAdapter([this._typeId = TYPE_ID_LINK_MATERIAL]);

  @override
  Link read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = Link();
    resource.thumbnailUrl = fields[0] as String?;
    resource.title = fields[1] as String?;
    resource.url = fields[2] as String?;
    return resource;
  }

  @override
  void write(BinaryWriter writer, Link obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.thumbnailUrl)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LinkMaterialAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
