library flutter_gsuite;

import 'package:flutter_gsuite/src/models.dart';
import 'package:flutter_gsuite/src/models/classroom/material/topic.adapter.dart';
import 'package:googleapis/admin/directory_v1.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

export './src/constants/hive_constants.dart';
export './src/extensions.dart';
export './src/models.dart';
export './src/modules.dart';
export './src/value_objects/value_objects.dart';

void registerAdapters(HiveInterface hive) {
  //= Common
  hive.registerAdapter<TimeOfDay>(TimeOfDayAdapter());
  hive.registerAdapter<Name>(NameAdapter());
  hive.registerAdapter<User>(UserAdapter());
  hive.registerAdapter<Date>(DateAdapter());
  hive.registerAdapter<Topic>(TopicAdapter());
  hive.registerAdapter<UserProfile>(UserProfileAdapter());
  hive.registerAdapter<UserName>(UserNameAdapter());

  //= Calendar
  hive.registerAdapter<CalendarListEntry>(CalendarListEntryAdapter());
  hive.registerAdapter<EventDateTime>(EventDateTimeAdapter());
  hive.registerAdapter<EventCreator>(EventCreatorAdapter());
  hive.registerAdapter<CalendarEvent>(CalendarEventAdapter());
  hive.registerAdapter<Event>(EventAdapter());

  //= Classroom

  hive.registerAdapter<Attachment>(AttachmentAdapter());
  hive.registerAdapter<DriveFile>(DriveFileAdapter());
  hive.registerAdapter<IndividualStudentsOptions>(IndividualStudentsOptionsAdapter());
  hive.registerAdapter<DriveFolder>(DriveFolderAdapter());
  hive.registerAdapter<Link>(LinkMaterialAdapter());
  hive.registerAdapter<Form>(FormMaterialAdapter());
  hive.registerAdapter<YouTubeVideo>(YouTubeVideoMaterialAdapter());
  hive.registerAdapter<SharedDriveFile>(SharedDriveFileAdapter());
  hive.registerAdapter<Material>(MaterialAdapter());
  hive.registerAdapter<Assignment>(AssignmentAdapter());
  hive.registerAdapter<MultipleChoiceQuestion>(MultipleChoiceQuestionAdapter());
  hive.registerAdapter<MultipleChoiceSubmission>(MultipleChoiceSubmissionAdapter());
  hive.registerAdapter<CourseMaterial>(CourseMaterialAdapter());
  hive.registerAdapter<CourseWorkMaterial>(CourseWorkMaterialAdapter());
  hive.registerAdapter<CourseMaterialSet>(CourseMaterialSetAdapter());
  hive.registerAdapter<ShortAnswerSubmission>(ShortAnswerSubmissionAdapter());
  hive.registerAdapter<GradeHistory>(GradeHistoryAdapter());
  hive.registerAdapter<StateHistory>(StateHistoryAdapter());
  hive.registerAdapter<SubmissionHistory>(SubmissionHistoryAdapter());
  hive.registerAdapter<CourseWork>(CourseWorkAdapter());
  hive.registerAdapter<Course>(CourseAdapter());
  hive.registerAdapter<Announcement>(AnnouncementAdapter());
  hive.registerAdapter<AssignmentSubmission>(AssignmentSubmissionAdapter());
  hive.registerAdapter<StudentSubmission>(StudentSubmissionAdapter());
  hive.registerAdapter<CourseModel>(CourseModelAdapter());
}
