import 'package:flutter_gsuite/src/constants/hive_constants.dart';
import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

class MultipleChoiceQuestionAdapter extends TypeAdapter<MultipleChoiceQuestion> {
  final int _typeId;
  @override
  int get typeId => _typeId;

  MultipleChoiceQuestionAdapter([this._typeId = TYPE_ID_MULTIPLE_CHOICE_QUESTION]);

  @override
  MultipleChoiceQuestion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final resource = MultipleChoiceQuestion();
    resource.choices = (fields[0] as List?)?.cast<String>();

    return resource;
  }

  @override
  void write(BinaryWriter writer, MultipleChoiceQuestion obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.choices);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MultipleChoiceQuestionAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
