import 'package:googleapis/admin/directory_v1.dart';
import 'package:hive/hive.dart';

import '../../constants/hive_constants.dart';

class UserAdapter extends TypeAdapter<User> {
  @override
  int get typeId => TYPE_ID_GOOGLE_USER;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = User();
    resource.archived = fields[0] as bool?;
    resource.customerId = fields[1] as String?;
    resource.id = fields[2] as String?;
    resource.includeInGlobalAddressList = fields[3] as bool?;
    resource.isAdmin = fields[4] as bool?;
    resource.isDelegatedAdmin = fields[5] as bool?;
    resource.isMailboxSetup = fields[6] as bool?;
    resource.name = fields[7] as UserName?;
    resource.orgUnitPath = fields[8] as String?;
    resource.primaryEmail = fields[9] as String?;
    resource.recoveryEmail = fields[10] as String?;
    resource.recoveryPhone = fields[11] as String?;
    resource.suspended = fields[12] as bool?;
    resource.suspensionReason = fields[13] as String?;
    return resource;
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write<bool?>(obj.archived)
      ..writeByte(1)
      ..write<String?>(obj.customerId)
      ..writeByte(2)
      ..write<String?>(obj.id)
      ..writeByte(3)
      ..write<bool?>(obj.includeInGlobalAddressList)
      ..writeByte(4)
      ..write<bool?>(obj.isAdmin)
      ..writeByte(5)
      ..write<bool?>(obj.isDelegatedAdmin)
      ..writeByte(6)
      ..write<bool?>(obj.isMailboxSetup)
      ..writeByte(7)
      ..write<UserName?>(obj.name)
      ..writeByte(8)
      ..write<String?>(obj.orgUnitPath)
      ..writeByte(9)
      ..write<String?>(obj.primaryEmail)
      ..writeByte(10)
      ..write<String?>(obj.recoveryEmail)
      ..writeByte(11)
      ..write<String?>(obj.recoveryPhone)
      ..writeByte(12)
      ..write<bool?>(obj.suspended)
      ..writeByte(13)
      ..write<String?>(obj.suspensionReason);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
