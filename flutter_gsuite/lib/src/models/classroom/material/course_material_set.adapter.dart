import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_constants.dart';

class CourseMaterialSetAdapter extends TypeAdapter<CourseMaterialSet> {
  final int _typeId;
  @override
  int get typeId => _typeId;

  CourseMaterialSetAdapter([this._typeId = TYPE_ID_COURSE_MATERIAL_SET]);

  @override
  CourseMaterialSet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = CourseMaterialSet();
    resource.materials = (fields[0] as List?)?.cast<CourseMaterial>();
    resource.title = fields[1] as String?;
    return resource;
  }

  @override
  void write(BinaryWriter writer, CourseMaterialSet obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.materials)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseMaterialSetAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
