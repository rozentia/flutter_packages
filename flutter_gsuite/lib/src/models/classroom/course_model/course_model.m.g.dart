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
      userId: fields[4] as String,
      isTeacher: fields[3] as bool,
      announcements: (fields[5] as List)?.cast<Announcement>(),
      topics: (fields[6] as List)?.cast<Topic>(),
      courseWorks: (fields[7] as List)?.cast<CourseWork>(),
      courseWorkMaterials: (fields[9] as List)?.cast<CourseWorkMaterial>(),
      courseWorkSubmissions: (fields[8] as List)?.cast<StudentSubmission>(),
    );
  }

  @override
  void write(BinaryWriter writer, CourseModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.course)
      ..writeByte(1)
      ..write(obj.students)
      ..writeByte(2)
      ..write(obj.teachers)
      ..writeByte(3)
      ..write(obj.isTeacher)
      ..writeByte(4)
      ..write(obj.userId)
      ..writeByte(5)
      ..write(obj.announcements)
      ..writeByte(6)
      ..write(obj.topics)
      ..writeByte(7)
      ..write(obj.courseWorks)
      ..writeByte(8)
      ..write(obj.courseWorkSubmissions)
      ..writeByte(9)
      ..write(obj.courseWorkMaterials);
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
