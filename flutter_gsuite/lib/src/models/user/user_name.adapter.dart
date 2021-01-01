import 'package:googleapis/admin/directory_v1.dart';
import 'package:hive/hive.dart';

import '../../constants/hive_constants.dart';

class UserNameAdapter extends TypeAdapter<UserName> {
  @override
  final int typeId = TYPE_ID_GOOGLE_USER_USERNAME;

  @override
  UserName read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final Map<dynamic, dynamic> json = {
      'familyName': fields[0] as String,
      'fullName': fields[1] as String,
      'givenName': fields[2] as String,
    };
    return UserName.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, UserName obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write<String>(obj.familyName)
      ..writeByte(1)
      ..write<String>(obj.fullName)
      ..writeByte(2)
      ..write<String>(obj.givenName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserNameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
