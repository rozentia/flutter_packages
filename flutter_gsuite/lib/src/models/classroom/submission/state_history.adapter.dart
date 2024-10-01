import 'package:flutter_gsuite/src/constants/hive_constants.dart';
import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

class StateHistoryAdapter extends TypeAdapter<StateHistory> {
  final int _typeId;
  @override
  int get typeId => _typeId;

  StateHistoryAdapter([this._typeId = TYPE_ID_STATE_HISTORY]);

  @override
  StateHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = StateHistory();
    resource.actorUserId = fields[0] as String?;
    resource.state = fields[1] as String?;
    resource.stateTimestamp = fields[2] as String?;

    return resource;
  }

  @override
  void write(BinaryWriter writer, StateHistory obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.actorUserId)
      ..writeByte(1)
      ..write(obj.state)
      ..writeByte(2)
      ..write(obj.stateTimestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StateHistoryAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
