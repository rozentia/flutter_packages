import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_objects.freezed.dart';

/// Value object for Users.get api call argument [projection] that specifies what subset of fields to fetch for this user.\
/// Possible string values are:
/// * "projectionUndefined"
/// * "basic" : Do not include any custom fields for the user.
/// * "custom" : Include custom fields from schemas mentioned in customFieldMask.
/// * "full" : Include all fields associated with this user.
@freezed
abstract class UserProjection with _$UserProjection {
  const factory UserProjection.basic() = _Basic;
  const factory UserProjection.custom() = _Custom;
  const factory UserProjection.full() = _Full;
}

extension UserProjectionValue on UserProjection {
  String get value => maybeWhen<String>(
        basic: () => 'basic',
        custom: () => 'custom',
        full: () => 'full',
        orElse: () => 'basic',
      );
}

/// Value object for Calendar.list api call argument [minAccessRole] that specifies the minimum
/// access role for the user in the returned entries. Optional.
/// The default is no restriction. Possible string values are:
/// * "freeBusyReader" : The user can read free/busy information.
/// * "owner" : The user can read and modify events and access control lists.
/// * "reader" : The user can read events that are not private.
/// * "writer" : The user can read and modify events.
@freezed
abstract class MinAccessRole with _$MinAccessRole {
  const factory MinAccessRole.freeBusyReader() = _FreeBusyReader;
  const factory MinAccessRole.owner() = _Owner;
  const factory MinAccessRole.reader() = _Reader;
  const factory MinAccessRole.writer() = _Writer;
}

extension MinAccessRoleValue on MinAccessRole {
  /// Returns the string representation of the value or an empty string if the value
  /// is unknown or null
  String get value => maybeWhen(
        freeBusyReader: () => 'freeBusyReader',
        owner: () => 'owner',
        reader: () => 'reader',
        writer: () => 'writer',
        orElse: () => '',
      );
}

@freezed
class CourseState with _$CourseState {
  /// No course state
  const factory CourseState.unspecified() = Unspecified;

  /// The course is active
  const factory CourseState.active() = Active;

  /// The course has been archived. You cannot modify it except to change it to a different state
  const factory CourseState.archived() = Archived;

  /// The course has been created, but not yet activated. It is accessible by the primary teacher
  /// and domain administrators, who may modify it or change it to the ACTIVE or DECLINED states.
  /// A course may only be changed to PROVISIONED if it is in the DECLINED state
  const factory CourseState.provisioned() = Provisioned;

  /// The course has been created, but declined. It is accessible by the course owner and domain administrators,
  /// though it will not be displayed in the web UI.
  /// You cannot modify the course except to change it to the PROVISIONED state.
  /// A course may only be changed to DECLINED if it is in the PROVISIONED state
  const factory CourseState.declined() = Declined;

  /// The course has been suspended.
  /// You cannot modify the course, and only the user identified by the owner_id can view the course.
  /// A course may be placed in this state if it potentially violates the Terms of Service.
  const factory CourseState.suspended() = Suspended;
}
