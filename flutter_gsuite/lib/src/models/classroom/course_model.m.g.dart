// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.m.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseModelAdapter extends TypeAdapter<CourseModel> {
  @override
  final int typeId = 109;

  @override
  CourseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourseModel(
      course: fields[0] as Course,
      students: (fields[1] as List)?.cast<UserProfile>(),
      teachers: (fields[2] as List)?.cast<UserProfile>(),
    );
  }

  @override
  void write(BinaryWriter writer, CourseModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.course)
      ..writeByte(1)
      ..write(obj.students)
      ..writeByte(2)
      ..write(obj.teachers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
