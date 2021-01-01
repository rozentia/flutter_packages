import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import '../../../constants/hive_constants.dart';

class UserProfileAdapter extends TypeAdapter<UserProfile> {
  @override
  final int typeId = TYPE_ID_USER_PROFILE;

  @override
  UserProfile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final userProfile = UserProfile();
    userProfile.emailAddress = fields[0] as String;
    userProfile.id = fields[1] as String;
    userProfile.name = fields[2] as Name;
    userProfile.photoUrl = fields[3] as String;
    return userProfile;
  }

  @override
  void write(BinaryWriter writer, UserProfile obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write<String>(obj.emailAddress)
      ..writeByte(1)
      ..write<String>(obj.id)
      ..writeByte(2)
      ..write<Name>(obj.name)
      ..writeByte(3)
      ..write<String>(obj.photoUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
