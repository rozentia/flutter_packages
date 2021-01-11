library flutter_gsuite;

import 'package:flutter_gsuite/src/models.dart';
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
  hive.registerAdapter<Course>(CourseAdapter());
  hive.registerAdapter<Event>(EventAdapter());
  hive.registerAdapter<CalendarListEntry>(CalendarListEntryAdapter());
  hive.registerAdapter<User>(UserAdapter());
  hive.registerAdapter<UserName>(UserNameAdapter());
  hive.registerAdapter<Name>(NameAdapter());
  hive.registerAdapter<UserProfile>(UserProfileAdapter());
  hive.registerAdapter<CourseModel>(CourseModelAdapter());
  hive.registerAdapter<CalendarEvent>(CalendarEventAdapter());
  hive.registerAdapter<EventDateTime>(EventDateTimeAdapter());
  hive.registerAdapter<EventCreator>(EventCreatorAdapter());
  hive.registerAdapter<CourseWork>(CourseWorkAdapter());
  hive.registerAdapter<IndividualStudentsOptions>(
      IndividualStudentsOptionsAdapter());
  hive.registerAdapter<Announcement>(AnnouncementAdapter());
  hive.registerAdapter<YouTubeVideo>(YouTubeVideoMaterialAdapter());
  hive.registerAdapter<Material>(MaterialAdapter());
  hive.registerAdapter<CourseMaterial>(CourseMaterialAdapter());
  hive.registerAdapter<CourseMaterialSet>(CourseMaterialSetAdapter());
  hive.registerAdapter<Link>(LinkMaterialAdapter());
  hive.registerAdapter<Form>(FormMaterialAdapter());
  hive.registerAdapter<SharedDriveFile>(SharedDriveFileAdapter());
  hive.registerAdapter<DriveFile>(DriveFileAdapter());
  hive.registerAdapter<Assignment>(AssignmentAdapter());
  hive.registerAdapter<DriveFolder>(DriveFolderAdapter());
  hive.registerAdapter<AssignmentSubmission>(AssignmentSubmissionAdapter());
  hive.registerAdapter<Attachment>(AttachmentAdapter());
  hive.registerAdapter<Date>(DateAdapter());
  hive.registerAdapter<TimeOfDay>(TimeOfDayAdapter());
  hive.registerAdapter<MultipleChoiceQuestion>(MultipleChoiceQuestionAdapter());
  hive.registerAdapter<MultipleChoiceSubmission>(
      MultipleChoiceSubmissionAdapter());
  hive.registerAdapter<ShortAnswerSubmission>(ShortAnswerSubmissionAdapter());
  hive.registerAdapter<CourseWorkMaterial>(CourseWorkMaterialAdapter());
  hive.registerAdapter<GradeHistory>(GradeHistoryAdapter());
  hive.registerAdapter<StateHistory>(StateHistoryAdapter());
  hive.registerAdapter<SubmissionHistory>(SubmissionHistoryAdapter());
  hive.registerAdapter<StudentSubmission>(StudentSubmissionAdapter());
}
