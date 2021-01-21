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
  String get value => maybeWhen(
        freeBusyReader: () => 'freeBusyReader',
        owner: () => 'owner',
        reader: () => 'reader',
        writer: () => 'writer',
        orElse: () => null,
      );
}
