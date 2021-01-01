import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'conference.m.flamingo.dart';

class Conference extends Document<Conference> {
  @Field()
  String conferenceId;
  static const fnConferenceId = 'conferenceId';
  @Field()
  String recordId;
  static const fnRecordId = 'recordId';
  @Field()
  Timestamp start;
  static const fnStart = 'start';
  @Field()
  Timestamp end;
  static const fnEnd = 'end';

  Conference({
    this.recordId,
    this.conferenceId,
    this.start,
    this.end,
    String id,
    DocumentSnapshot snapshot,
    Map<String, dynamic> values,
  }) : super(id: id, snapshot: snapshot, values: values);

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
