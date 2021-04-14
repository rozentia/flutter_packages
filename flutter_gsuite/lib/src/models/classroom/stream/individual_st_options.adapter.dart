import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_constants.dart';

class IndividualStudentsOptionsAdapter extends TypeAdapter<IndividualStudentsOptions> {
  @override
  final int typeId = TYPE_ID_INDIVIDUAL_ST_OPTIONS;

  @override
  IndividualStudentsOptions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = IndividualStudentsOptions();
    resource.studentIds = (fields[0] as List?)?.cast<String>();
    return resource;
  }

  @override
  void write(BinaryWriter writer, IndividualStudentsOptions obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.studentIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IndividualStudentsOptionsAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
