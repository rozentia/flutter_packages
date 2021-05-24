import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_constants.dart';

class FormMaterialAdapter extends TypeAdapter<Form> {
  final int _typeId;
  @override
  int get typeId => _typeId;

  FormMaterialAdapter([this._typeId = TYPE_ID_FORM_MATERIAL]);

  @override
  Form read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = Form();
    resource.formUrl = fields[0] as String?;
    resource.responseUrl = fields[1] as String?;
    resource.thumbnailUrl = fields[2] as String?;
    resource.title = fields[3] as String?;

    return resource;
  }

  @override
  void write(BinaryWriter writer, Form obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.formUrl)
      ..writeByte(1)
      ..write(obj.responseUrl)
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
      other is FormMaterialAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
