library flutter_gsuite;

import 'package:flutter_gsuite/src/models.dart';
import 'package:flutter_gsuite/src/models/classroom/material/topic.adapter.dart';
import 'package:googleapis/admin/directory_v1.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis/classroom/v1.dart';
import 'package:hive/hive.dart';

import 'src/constants/hive_constants.dart';

export './src/constants/hive_constants.dart';
export './src/extensions.dart';
export './src/models.dart';
export './src/models/calendar_event/calendar_event.extensions.dart';
export './src/models/classroom/course_model/course_model.extensions.dart';
export './src/modules.dart';
export './src/value_objects/value_objects.dart';

void registerAdapters(
  HiveInterface hive, {
  int timeOfDay = TYPE_ID_TIME_OF_DAY,
  int name = TYPE_ID_NAME,
  int user = TYPE_ID_GOOGLE_USER,
  int date = TYPE_ID_DATE,
  int topic = TYPE_ID_TOPIC,
  int userProfile = TYPE_ID_USER_PROFILE,
  int userName = TYPE_ID_GOOGLE_USER_USERNAME,
  int calendarListEntry = TYPE_ID_CALENDAR,
  int eventDatetime = TYPE_ID_EVENT_DATETIME,
  int eventCreator = TYPE_ID_EVENT_CREATOR,
  // int calendarEvent = TYPE_ID_CALENDAR_EVENT,
  int event = TYPE_ID_EVENT,
  int attachment = TYPE_ID_ATTACHMENT,
  int driveFile = TYPE_ID_DRIVE_FILE,
  int individualStudentOptions = TYPE_ID_INDIVIDUAL_ST_OPTIONS,
  int driveFolder = TYPE_ID_DRIVE_FOLDER,
  int linkMaterial = TYPE_ID_LINK_MATERIAL,
  int formMaterial = TYPE_ID_FORM_MATERIAL,
  int youtubeVideoMaterial = TYPE_ID_YOUTUBEVIDEO_MATERIAL,
  int sharedDriveFile = TYPE_ID_SHARED_DRIVE_FILE,
  int material = TYPE_ID_MATERIAL,
  int assignment = TYPE_ID_ASSIGNMENT,
  int multipleChoiceQuestion = TYPE_ID_MULTIPLE_CHOICE_QUESTION,
  int multipleChoiceSubmission = TYPE_ID_MULTIPLE_CHOICE_SUBMISSION,
  int courseMaterial = TYPE_ID_COURSE_MATERIAL,
  int courseMaterialSet = TYPE_ID_COURSE_MATERIAL_SET,
  int courseWorkMaterial = TYPE_ID_COURSE_WORK_MATERIAL,
  int shortAnswerSubmission = TYPE_ID_SHORT_ANSWER_SUBMISSION,
  int gradeHistory = TYPE_ID_GRADE_HISTORY,
  int stateHistory = TYPE_ID_STATE_HISTORY,
  int submissionHistory = TYPE_ID_SUBMISSION_HISTORY,
  int courseWork = TYPE_ID_COURSE_WORK,
  int course = TYPE_ID_COURSE,
  int announcement = TYPE_ID_ANNOUNCEMENT,
  int assignmentSubmission = TYPE_ID_ASSIGNMENT_SUBMISSION,
  int studentSubmission = TYPE_ID_STUDENT_SUBMISSION,
  // int courseModel = TYPE_ID_COURSE_MODEL,
}) {
  //= Common
  if (!hive.isAdapterRegistered(timeOfDay)) hive.registerAdapter<TimeOfDay>(TimeOfDayAdapter(timeOfDay));
  if (!hive.isAdapterRegistered(name)) hive.registerAdapter<Name>(NameAdapter(name));
  if (!hive.isAdapterRegistered(user)) hive.registerAdapter<User>(UserAdapter(user));
  if (!hive.isAdapterRegistered(date)) hive.registerAdapter<Date>(DateAdapter(date));
  if (!hive.isAdapterRegistered(topic)) hive.registerAdapter<Topic>(TopicAdapter(topic));
  if (!hive.isAdapterRegistered(userProfile)) hive.registerAdapter<UserProfile>(UserProfileAdapter(userProfile));
  if (!hive.isAdapterRegistered(userName)) hive.registerAdapter<UserName>(UserNameAdapter(userName));

  //= Calendar
  if (!hive.isAdapterRegistered(calendarListEntry)) {
    hive.registerAdapter<CalendarListEntry>(CalendarListEntryAdapter(calendarListEntry));
  }
  if (!hive.isAdapterRegistered(eventDatetime)) {
    hive.registerAdapter<EventDateTime>(EventDateTimeAdapter(eventDatetime));
  }
  if (!hive.isAdapterRegistered(eventCreator)) hive.registerAdapter<EventCreator>(EventCreatorAdapter(eventCreator));
  hive.registerAdapter<CalendarEvent>(CalendarEventAdapter());
  if (!hive.isAdapterRegistered(event)) hive.registerAdapter<Event>(EventAdapter(event));

  //= Classroom

  if (!hive.isAdapterRegistered(attachment)) hive.registerAdapter<Attachment>(AttachmentAdapter(attachment));
  if (!hive.isAdapterRegistered(driveFile)) hive.registerAdapter<DriveFile>(DriveFileAdapter(driveFile));
  if (!hive.isAdapterRegistered(individualStudentOptions)) {
    hive.registerAdapter<IndividualStudentsOptions>(IndividualStudentsOptionsAdapter(individualStudentOptions));
  }
  if (!hive.isAdapterRegistered(driveFolder)) hive.registerAdapter<DriveFolder>(DriveFolderAdapter(driveFolder));
  if (!hive.isAdapterRegistered(linkMaterial)) hive.registerAdapter<Link>(LinkMaterialAdapter(linkMaterial));
  if (!hive.isAdapterRegistered(formMaterial)) hive.registerAdapter<Form>(FormMaterialAdapter(formMaterial));
  if (!hive.isAdapterRegistered(youtubeVideoMaterial)) {
    hive.registerAdapter<YouTubeVideo>(YouTubeVideoMaterialAdapter(youtubeVideoMaterial));
  }
  if (!hive.isAdapterRegistered(sharedDriveFile)) {
    hive.registerAdapter<SharedDriveFile>(SharedDriveFileAdapter(sharedDriveFile));
  }
  if (!hive.isAdapterRegistered(material)) hive.registerAdapter<Material>(MaterialAdapter(material));
  if (!hive.isAdapterRegistered(assignment)) hive.registerAdapter<Assignment>(AssignmentAdapter(assignment));
  if (!hive.isAdapterRegistered(multipleChoiceQuestion)) {
    hive.registerAdapter<MultipleChoiceQuestion>(MultipleChoiceQuestionAdapter(multipleChoiceQuestion));
  }
  if (!hive.isAdapterRegistered(multipleChoiceSubmission)) {
    hive.registerAdapter<MultipleChoiceSubmission>(MultipleChoiceSubmissionAdapter(multipleChoiceSubmission));
  }
  if (!hive.isAdapterRegistered(courseMaterial)) {
    hive.registerAdapter<CourseMaterial>(CourseMaterialAdapter(courseMaterial));
  }
  if (!hive.isAdapterRegistered(courseMaterialSet)) {
    hive.registerAdapter<CourseWorkMaterial>(CourseWorkMaterialAdapter(courseWorkMaterial));
  }
  if (!hive.isAdapterRegistered(courseMaterial)) {
    hive.registerAdapter<CourseMaterialSet>(CourseMaterialSetAdapter(courseMaterial));
  }
  if (!hive.isAdapterRegistered(shortAnswerSubmission)) {
    hive.registerAdapter<ShortAnswerSubmission>(ShortAnswerSubmissionAdapter(shortAnswerSubmission));
  }
  if (!hive.isAdapterRegistered(gradeHistory)) hive.registerAdapter<GradeHistory>(GradeHistoryAdapter(gradeHistory));
  if (!hive.isAdapterRegistered(stateHistory)) hive.registerAdapter<StateHistory>(StateHistoryAdapter(stateHistory));
  if (!hive.isAdapterRegistered(submissionHistory)) {
    hive.registerAdapter<SubmissionHistory>(SubmissionHistoryAdapter(submissionHistory));
  }
  if (!hive.isAdapterRegistered(courseWork)) hive.registerAdapter<CourseWork>(CourseWorkAdapter(courseWork));
  if (!hive.isAdapterRegistered(course)) hive.registerAdapter<Course>(CourseAdapter(course));
  if (!hive.isAdapterRegistered(announcement)) hive.registerAdapter<Announcement>(AnnouncementAdapter(announcement));
  if (!hive.isAdapterRegistered(assignmentSubmission)) {
    hive.registerAdapter<AssignmentSubmission>(AssignmentSubmissionAdapter(assignmentSubmission));
  }
  if (!hive.isAdapterRegistered(studentSubmission)) {
    hive.registerAdapter<StudentSubmission>(StudentSubmissionAdapter(studentSubmission));
  }
  hive.registerAdapter<CourseModel>(CourseModelAdapter());
}
