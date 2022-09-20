// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'value_objects.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserProjection {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() basic,
    required TResult Function() custom,
    required TResult Function() full,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? basic,
    TResult Function()? custom,
    TResult Function()? full,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? basic,
    TResult Function()? custom,
    TResult Function()? full,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Basic value) basic,
    required TResult Function(_Custom value) custom,
    required TResult Function(_Full value) full,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Basic value)? basic,
    TResult Function(_Custom value)? custom,
    TResult Function(_Full value)? full,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Basic value)? basic,
    TResult Function(_Custom value)? custom,
    TResult Function(_Full value)? full,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProjectionCopyWith<$Res> {
  factory $UserProjectionCopyWith(
          UserProjection value, $Res Function(UserProjection) then) =
      _$UserProjectionCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserProjectionCopyWithImpl<$Res>
    implements $UserProjectionCopyWith<$Res> {
  _$UserProjectionCopyWithImpl(this._value, this._then);

  final UserProjection _value;
  // ignore: unused_field
  final $Res Function(UserProjection) _then;
}

/// @nodoc
abstract class _$$_BasicCopyWith<$Res> {
  factory _$$_BasicCopyWith(_$_Basic value, $Res Function(_$_Basic) then) =
      __$$_BasicCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_BasicCopyWithImpl<$Res> extends _$UserProjectionCopyWithImpl<$Res>
    implements _$$_BasicCopyWith<$Res> {
  __$$_BasicCopyWithImpl(_$_Basic _value, $Res Function(_$_Basic) _then)
      : super(_value, (v) => _then(v as _$_Basic));

  @override
  _$_Basic get _value => super._value as _$_Basic;
}

/// @nodoc

class _$_Basic implements _Basic {
  const _$_Basic();

  @override
  String toString() {
    return 'UserProjection.basic()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Basic);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() basic,
    required TResult Function() custom,
    required TResult Function() full,
  }) {
    return basic();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? basic,
    TResult Function()? custom,
    TResult Function()? full,
  }) {
    return basic?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? basic,
    TResult Function()? custom,
    TResult Function()? full,
    required TResult orElse(),
  }) {
    if (basic != null) {
      return basic();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Basic value) basic,
    required TResult Function(_Custom value) custom,
    required TResult Function(_Full value) full,
  }) {
    return basic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Basic value)? basic,
    TResult Function(_Custom value)? custom,
    TResult Function(_Full value)? full,
  }) {
    return basic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Basic value)? basic,
    TResult Function(_Custom value)? custom,
    TResult Function(_Full value)? full,
    required TResult orElse(),
  }) {
    if (basic != null) {
      return basic(this);
    }
    return orElse();
  }
}

abstract class _Basic implements UserProjection {
  const factory _Basic() = _$_Basic;
}

/// @nodoc
abstract class _$$_CustomCopyWith<$Res> {
  factory _$$_CustomCopyWith(_$_Custom value, $Res Function(_$_Custom) then) =
      __$$_CustomCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CustomCopyWithImpl<$Res> extends _$UserProjectionCopyWithImpl<$Res>
    implements _$$_CustomCopyWith<$Res> {
  __$$_CustomCopyWithImpl(_$_Custom _value, $Res Function(_$_Custom) _then)
      : super(_value, (v) => _then(v as _$_Custom));

  @override
  _$_Custom get _value => super._value as _$_Custom;
}

/// @nodoc

class _$_Custom implements _Custom {
  const _$_Custom();

  @override
  String toString() {
    return 'UserProjection.custom()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Custom);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() basic,
    required TResult Function() custom,
    required TResult Function() full,
  }) {
    return custom();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? basic,
    TResult Function()? custom,
    TResult Function()? full,
  }) {
    return custom?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? basic,
    TResult Function()? custom,
    TResult Function()? full,
    required TResult orElse(),
  }) {
    if (custom != null) {
      return custom();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Basic value) basic,
    required TResult Function(_Custom value) custom,
    required TResult Function(_Full value) full,
  }) {
    return custom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Basic value)? basic,
    TResult Function(_Custom value)? custom,
    TResult Function(_Full value)? full,
  }) {
    return custom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Basic value)? basic,
    TResult Function(_Custom value)? custom,
    TResult Function(_Full value)? full,
    required TResult orElse(),
  }) {
    if (custom != null) {
      return custom(this);
    }
    return orElse();
  }
}

abstract class _Custom implements UserProjection {
  const factory _Custom() = _$_Custom;
}

/// @nodoc
abstract class _$$_FullCopyWith<$Res> {
  factory _$$_FullCopyWith(_$_Full value, $Res Function(_$_Full) then) =
      __$$_FullCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FullCopyWithImpl<$Res> extends _$UserProjectionCopyWithImpl<$Res>
    implements _$$_FullCopyWith<$Res> {
  __$$_FullCopyWithImpl(_$_Full _value, $Res Function(_$_Full) _then)
      : super(_value, (v) => _then(v as _$_Full));

  @override
  _$_Full get _value => super._value as _$_Full;
}

/// @nodoc

class _$_Full implements _Full {
  const _$_Full();

  @override
  String toString() {
    return 'UserProjection.full()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Full);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() basic,
    required TResult Function() custom,
    required TResult Function() full,
  }) {
    return full();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? basic,
    TResult Function()? custom,
    TResult Function()? full,
  }) {
    return full?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? basic,
    TResult Function()? custom,
    TResult Function()? full,
    required TResult orElse(),
  }) {
    if (full != null) {
      return full();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Basic value) basic,
    required TResult Function(_Custom value) custom,
    required TResult Function(_Full value) full,
  }) {
    return full(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Basic value)? basic,
    TResult Function(_Custom value)? custom,
    TResult Function(_Full value)? full,
  }) {
    return full?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Basic value)? basic,
    TResult Function(_Custom value)? custom,
    TResult Function(_Full value)? full,
    required TResult orElse(),
  }) {
    if (full != null) {
      return full(this);
    }
    return orElse();
  }
}

abstract class _Full implements UserProjection {
  const factory _Full() = _$_Full;
}

/// @nodoc
mixin _$MinAccessRole {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() freeBusyReader,
    required TResult Function() owner,
    required TResult Function() reader,
    required TResult Function() writer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? freeBusyReader,
    TResult Function()? owner,
    TResult Function()? reader,
    TResult Function()? writer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? freeBusyReader,
    TResult Function()? owner,
    TResult Function()? reader,
    TResult Function()? writer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FreeBusyReader value) freeBusyReader,
    required TResult Function(_Owner value) owner,
    required TResult Function(_Reader value) reader,
    required TResult Function(_Writer value) writer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FreeBusyReader value)? freeBusyReader,
    TResult Function(_Owner value)? owner,
    TResult Function(_Reader value)? reader,
    TResult Function(_Writer value)? writer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FreeBusyReader value)? freeBusyReader,
    TResult Function(_Owner value)? owner,
    TResult Function(_Reader value)? reader,
    TResult Function(_Writer value)? writer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MinAccessRoleCopyWith<$Res> {
  factory $MinAccessRoleCopyWith(
          MinAccessRole value, $Res Function(MinAccessRole) then) =
      _$MinAccessRoleCopyWithImpl<$Res>;
}

/// @nodoc
class _$MinAccessRoleCopyWithImpl<$Res>
    implements $MinAccessRoleCopyWith<$Res> {
  _$MinAccessRoleCopyWithImpl(this._value, this._then);

  final MinAccessRole _value;
  // ignore: unused_field
  final $Res Function(MinAccessRole) _then;
}

/// @nodoc
abstract class _$$_FreeBusyReaderCopyWith<$Res> {
  factory _$$_FreeBusyReaderCopyWith(
          _$_FreeBusyReader value, $Res Function(_$_FreeBusyReader) then) =
      __$$_FreeBusyReaderCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FreeBusyReaderCopyWithImpl<$Res>
    extends _$MinAccessRoleCopyWithImpl<$Res>
    implements _$$_FreeBusyReaderCopyWith<$Res> {
  __$$_FreeBusyReaderCopyWithImpl(
      _$_FreeBusyReader _value, $Res Function(_$_FreeBusyReader) _then)
      : super(_value, (v) => _then(v as _$_FreeBusyReader));

  @override
  _$_FreeBusyReader get _value => super._value as _$_FreeBusyReader;
}

/// @nodoc

class _$_FreeBusyReader implements _FreeBusyReader {
  const _$_FreeBusyReader();

  @override
  String toString() {
    return 'MinAccessRole.freeBusyReader()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FreeBusyReader);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() freeBusyReader,
    required TResult Function() owner,
    required TResult Function() reader,
    required TResult Function() writer,
  }) {
    return freeBusyReader();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? freeBusyReader,
    TResult Function()? owner,
    TResult Function()? reader,
    TResult Function()? writer,
  }) {
    return freeBusyReader?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? freeBusyReader,
    TResult Function()? owner,
    TResult Function()? reader,
    TResult Function()? writer,
    required TResult orElse(),
  }) {
    if (freeBusyReader != null) {
      return freeBusyReader();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FreeBusyReader value) freeBusyReader,
    required TResult Function(_Owner value) owner,
    required TResult Function(_Reader value) reader,
    required TResult Function(_Writer value) writer,
  }) {
    return freeBusyReader(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FreeBusyReader value)? freeBusyReader,
    TResult Function(_Owner value)? owner,
    TResult Function(_Reader value)? reader,
    TResult Function(_Writer value)? writer,
  }) {
    return freeBusyReader?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FreeBusyReader value)? freeBusyReader,
    TResult Function(_Owner value)? owner,
    TResult Function(_Reader value)? reader,
    TResult Function(_Writer value)? writer,
    required TResult orElse(),
  }) {
    if (freeBusyReader != null) {
      return freeBusyReader(this);
    }
    return orElse();
  }
}

abstract class _FreeBusyReader implements MinAccessRole {
  const factory _FreeBusyReader() = _$_FreeBusyReader;
}

/// @nodoc
abstract class _$$_OwnerCopyWith<$Res> {
  factory _$$_OwnerCopyWith(_$_Owner value, $Res Function(_$_Owner) then) =
      __$$_OwnerCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OwnerCopyWithImpl<$Res> extends _$MinAccessRoleCopyWithImpl<$Res>
    implements _$$_OwnerCopyWith<$Res> {
  __$$_OwnerCopyWithImpl(_$_Owner _value, $Res Function(_$_Owner) _then)
      : super(_value, (v) => _then(v as _$_Owner));

  @override
  _$_Owner get _value => super._value as _$_Owner;
}

/// @nodoc

class _$_Owner implements _Owner {
  const _$_Owner();

  @override
  String toString() {
    return 'MinAccessRole.owner()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Owner);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() freeBusyReader,
    required TResult Function() owner,
    required TResult Function() reader,
    required TResult Function() writer,
  }) {
    return owner();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? freeBusyReader,
    TResult Function()? owner,
    TResult Function()? reader,
    TResult Function()? writer,
  }) {
    return owner?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? freeBusyReader,
    TResult Function()? owner,
    TResult Function()? reader,
    TResult Function()? writer,
    required TResult orElse(),
  }) {
    if (owner != null) {
      return owner();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FreeBusyReader value) freeBusyReader,
    required TResult Function(_Owner value) owner,
    required TResult Function(_Reader value) reader,
    required TResult Function(_Writer value) writer,
  }) {
    return owner(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FreeBusyReader value)? freeBusyReader,
    TResult Function(_Owner value)? owner,
    TResult Function(_Reader value)? reader,
    TResult Function(_Writer value)? writer,
  }) {
    return owner?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FreeBusyReader value)? freeBusyReader,
    TResult Function(_Owner value)? owner,
    TResult Function(_Reader value)? reader,
    TResult Function(_Writer value)? writer,
    required TResult orElse(),
  }) {
    if (owner != null) {
      return owner(this);
    }
    return orElse();
  }
}

abstract class _Owner implements MinAccessRole {
  const factory _Owner() = _$_Owner;
}

/// @nodoc
abstract class _$$_ReaderCopyWith<$Res> {
  factory _$$_ReaderCopyWith(_$_Reader value, $Res Function(_$_Reader) then) =
      __$$_ReaderCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ReaderCopyWithImpl<$Res> extends _$MinAccessRoleCopyWithImpl<$Res>
    implements _$$_ReaderCopyWith<$Res> {
  __$$_ReaderCopyWithImpl(_$_Reader _value, $Res Function(_$_Reader) _then)
      : super(_value, (v) => _then(v as _$_Reader));

  @override
  _$_Reader get _value => super._value as _$_Reader;
}

/// @nodoc

class _$_Reader implements _Reader {
  const _$_Reader();

  @override
  String toString() {
    return 'MinAccessRole.reader()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Reader);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() freeBusyReader,
    required TResult Function() owner,
    required TResult Function() reader,
    required TResult Function() writer,
  }) {
    return reader();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? freeBusyReader,
    TResult Function()? owner,
    TResult Function()? reader,
    TResult Function()? writer,
  }) {
    return reader?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? freeBusyReader,
    TResult Function()? owner,
    TResult Function()? reader,
    TResult Function()? writer,
    required TResult orElse(),
  }) {
    if (reader != null) {
      return reader();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FreeBusyReader value) freeBusyReader,
    required TResult Function(_Owner value) owner,
    required TResult Function(_Reader value) reader,
    required TResult Function(_Writer value) writer,
  }) {
    return reader(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FreeBusyReader value)? freeBusyReader,
    TResult Function(_Owner value)? owner,
    TResult Function(_Reader value)? reader,
    TResult Function(_Writer value)? writer,
  }) {
    return reader?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FreeBusyReader value)? freeBusyReader,
    TResult Function(_Owner value)? owner,
    TResult Function(_Reader value)? reader,
    TResult Function(_Writer value)? writer,
    required TResult orElse(),
  }) {
    if (reader != null) {
      return reader(this);
    }
    return orElse();
  }
}

abstract class _Reader implements MinAccessRole {
  const factory _Reader() = _$_Reader;
}

/// @nodoc
abstract class _$$_WriterCopyWith<$Res> {
  factory _$$_WriterCopyWith(_$_Writer value, $Res Function(_$_Writer) then) =
      __$$_WriterCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_WriterCopyWithImpl<$Res> extends _$MinAccessRoleCopyWithImpl<$Res>
    implements _$$_WriterCopyWith<$Res> {
  __$$_WriterCopyWithImpl(_$_Writer _value, $Res Function(_$_Writer) _then)
      : super(_value, (v) => _then(v as _$_Writer));

  @override
  _$_Writer get _value => super._value as _$_Writer;
}

/// @nodoc

class _$_Writer implements _Writer {
  const _$_Writer();

  @override
  String toString() {
    return 'MinAccessRole.writer()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Writer);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() freeBusyReader,
    required TResult Function() owner,
    required TResult Function() reader,
    required TResult Function() writer,
  }) {
    return writer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? freeBusyReader,
    TResult Function()? owner,
    TResult Function()? reader,
    TResult Function()? writer,
  }) {
    return writer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? freeBusyReader,
    TResult Function()? owner,
    TResult Function()? reader,
    TResult Function()? writer,
    required TResult orElse(),
  }) {
    if (writer != null) {
      return writer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FreeBusyReader value) freeBusyReader,
    required TResult Function(_Owner value) owner,
    required TResult Function(_Reader value) reader,
    required TResult Function(_Writer value) writer,
  }) {
    return writer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FreeBusyReader value)? freeBusyReader,
    TResult Function(_Owner value)? owner,
    TResult Function(_Reader value)? reader,
    TResult Function(_Writer value)? writer,
  }) {
    return writer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FreeBusyReader value)? freeBusyReader,
    TResult Function(_Owner value)? owner,
    TResult Function(_Reader value)? reader,
    TResult Function(_Writer value)? writer,
    required TResult orElse(),
  }) {
    if (writer != null) {
      return writer(this);
    }
    return orElse();
  }
}

abstract class _Writer implements MinAccessRole {
  const factory _Writer() = _$_Writer;
}

/// @nodoc
mixin _$CourseState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unspecified,
    required TResult Function() active,
    required TResult Function() archived,
    required TResult Function() provisioned,
    required TResult Function() declined,
    required TResult Function() suspended,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unspecified,
    TResult Function()? active,
    TResult Function()? archived,
    TResult Function()? provisioned,
    TResult Function()? declined,
    TResult Function()? suspended,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unspecified,
    TResult Function()? active,
    TResult Function()? archived,
    TResult Function()? provisioned,
    TResult Function()? declined,
    TResult Function()? suspended,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unspecified value) unspecified,
    required TResult Function(Active value) active,
    required TResult Function(Archived value) archived,
    required TResult Function(Provisioned value) provisioned,
    required TResult Function(Declined value) declined,
    required TResult Function(Suspended value) suspended,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Unspecified value)? unspecified,
    TResult Function(Active value)? active,
    TResult Function(Archived value)? archived,
    TResult Function(Provisioned value)? provisioned,
    TResult Function(Declined value)? declined,
    TResult Function(Suspended value)? suspended,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unspecified value)? unspecified,
    TResult Function(Active value)? active,
    TResult Function(Archived value)? archived,
    TResult Function(Provisioned value)? provisioned,
    TResult Function(Declined value)? declined,
    TResult Function(Suspended value)? suspended,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseStateCopyWith<$Res> {
  factory $CourseStateCopyWith(
          CourseState value, $Res Function(CourseState) then) =
      _$CourseStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CourseStateCopyWithImpl<$Res> implements $CourseStateCopyWith<$Res> {
  _$CourseStateCopyWithImpl(this._value, this._then);

  final CourseState _value;
  // ignore: unused_field
  final $Res Function(CourseState) _then;
}

/// @nodoc
abstract class _$$UnspecifiedCopyWith<$Res> {
  factory _$$UnspecifiedCopyWith(
          _$Unspecified value, $Res Function(_$Unspecified) then) =
      __$$UnspecifiedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnspecifiedCopyWithImpl<$Res> extends _$CourseStateCopyWithImpl<$Res>
    implements _$$UnspecifiedCopyWith<$Res> {
  __$$UnspecifiedCopyWithImpl(
      _$Unspecified _value, $Res Function(_$Unspecified) _then)
      : super(_value, (v) => _then(v as _$Unspecified));

  @override
  _$Unspecified get _value => super._value as _$Unspecified;
}

/// @nodoc

class _$Unspecified implements Unspecified {
  const _$Unspecified();

  @override
  String toString() {
    return 'CourseState.unspecified()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Unspecified);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unspecified,
    required TResult Function() active,
    required TResult Function() archived,
    required TResult Function() provisioned,
    required TResult Function() declined,
    required TResult Function() suspended,
  }) {
    return unspecified();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unspecified,
    TResult Function()? active,
    TResult Function()? archived,
    TResult Function()? provisioned,
    TResult Function()? declined,
    TResult Function()? suspended,
  }) {
    return unspecified?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unspecified,
    TResult Function()? active,
    TResult Function()? archived,
    TResult Function()? provisioned,
    TResult Function()? declined,
    TResult Function()? suspended,
    required TResult orElse(),
  }) {
    if (unspecified != null) {
      return unspecified();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unspecified value) unspecified,
    required TResult Function(Active value) active,
    required TResult Function(Archived value) archived,
    required TResult Function(Provisioned value) provisioned,
    required TResult Function(Declined value) declined,
    required TResult Function(Suspended value) suspended,
  }) {
    return unspecified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Unspecified value)? unspecified,
    TResult Function(Active value)? active,
    TResult Function(Archived value)? archived,
    TResult Function(Provisioned value)? provisioned,
    TResult Function(Declined value)? declined,
    TResult Function(Suspended value)? suspended,
  }) {
    return unspecified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unspecified value)? unspecified,
    TResult Function(Active value)? active,
    TResult Function(Archived value)? archived,
    TResult Function(Provisioned value)? provisioned,
    TResult Function(Declined value)? declined,
    TResult Function(Suspended value)? suspended,
    required TResult orElse(),
  }) {
    if (unspecified != null) {
      return unspecified(this);
    }
    return orElse();
  }
}

abstract class Unspecified implements CourseState {
  const factory Unspecified() = _$Unspecified;
}

/// @nodoc
abstract class _$$ActiveCopyWith<$Res> {
  factory _$$ActiveCopyWith(_$Active value, $Res Function(_$Active) then) =
      __$$ActiveCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ActiveCopyWithImpl<$Res> extends _$CourseStateCopyWithImpl<$Res>
    implements _$$ActiveCopyWith<$Res> {
  __$$ActiveCopyWithImpl(_$Active _value, $Res Function(_$Active) _then)
      : super(_value, (v) => _then(v as _$Active));

  @override
  _$Active get _value => super._value as _$Active;
}

/// @nodoc

class _$Active implements Active {
  const _$Active();

  @override
  String toString() {
    return 'CourseState.active()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Active);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unspecified,
    required TResult Function() active,
    required TResult Function() archived,
    required TResult Function() provisioned,
    required TResult Function() declined,
    required TResult Function() suspended,
  }) {
    return active();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unspecified,
    TResult Function()? active,
    TResult Function()? archived,
    TResult Function()? provisioned,
    TResult Function()? declined,
    TResult Function()? suspended,
  }) {
    return active?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unspecified,
    TResult Function()? active,
    TResult Function()? archived,
    TResult Function()? provisioned,
    TResult Function()? declined,
    TResult Function()? suspended,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unspecified value) unspecified,
    required TResult Function(Active value) active,
    required TResult Function(Archived value) archived,
    required TResult Function(Provisioned value) provisioned,
    required TResult Function(Declined value) declined,
    required TResult Function(Suspended value) suspended,
  }) {
    return active(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Unspecified value)? unspecified,
    TResult Function(Active value)? active,
    TResult Function(Archived value)? archived,
    TResult Function(Provisioned value)? provisioned,
    TResult Function(Declined value)? declined,
    TResult Function(Suspended value)? suspended,
  }) {
    return active?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unspecified value)? unspecified,
    TResult Function(Active value)? active,
    TResult Function(Archived value)? archived,
    TResult Function(Provisioned value)? provisioned,
    TResult Function(Declined value)? declined,
    TResult Function(Suspended value)? suspended,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(this);
    }
    return orElse();
  }
}

abstract class Active implements CourseState {
  const factory Active() = _$Active;
}

/// @nodoc
abstract class _$$ArchivedCopyWith<$Res> {
  factory _$$ArchivedCopyWith(
          _$Archived value, $Res Function(_$Archived) then) =
      __$$ArchivedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ArchivedCopyWithImpl<$Res> extends _$CourseStateCopyWithImpl<$Res>
    implements _$$ArchivedCopyWith<$Res> {
  __$$ArchivedCopyWithImpl(_$Archived _value, $Res Function(_$Archived) _then)
      : super(_value, (v) => _then(v as _$Archived));

  @override
  _$Archived get _value => super._value as _$Archived;
}

/// @nodoc

class _$Archived implements Archived {
  const _$Archived();

  @override
  String toString() {
    return 'CourseState.archived()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Archived);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unspecified,
    required TResult Function() active,
    required TResult Function() archived,
    required TResult Function() provisioned,
    required TResult Function() declined,
    required TResult Function() suspended,
  }) {
    return archived();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unspecified,
    TResult Function()? active,
    TResult Function()? archived,
    TResult Function()? provisioned,
    TResult Function()? declined,
    TResult Function()? suspended,
  }) {
    return archived?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unspecified,
    TResult Function()? active,
    TResult Function()? archived,
    TResult Function()? provisioned,
    TResult Function()? declined,
    TResult Function()? suspended,
    required TResult orElse(),
  }) {
    if (archived != null) {
      return archived();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unspecified value) unspecified,
    required TResult Function(Active value) active,
    required TResult Function(Archived value) archived,
    required TResult Function(Provisioned value) provisioned,
    required TResult Function(Declined value) declined,
    required TResult Function(Suspended value) suspended,
  }) {
    return archived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Unspecified value)? unspecified,
    TResult Function(Active value)? active,
    TResult Function(Archived value)? archived,
    TResult Function(Provisioned value)? provisioned,
    TResult Function(Declined value)? declined,
    TResult Function(Suspended value)? suspended,
  }) {
    return archived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unspecified value)? unspecified,
    TResult Function(Active value)? active,
    TResult Function(Archived value)? archived,
    TResult Function(Provisioned value)? provisioned,
    TResult Function(Declined value)? declined,
    TResult Function(Suspended value)? suspended,
    required TResult orElse(),
  }) {
    if (archived != null) {
      return archived(this);
    }
    return orElse();
  }
}

abstract class Archived implements CourseState {
  const factory Archived() = _$Archived;
}

/// @nodoc
abstract class _$$ProvisionedCopyWith<$Res> {
  factory _$$ProvisionedCopyWith(
          _$Provisioned value, $Res Function(_$Provisioned) then) =
      __$$ProvisionedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProvisionedCopyWithImpl<$Res> extends _$CourseStateCopyWithImpl<$Res>
    implements _$$ProvisionedCopyWith<$Res> {
  __$$ProvisionedCopyWithImpl(
      _$Provisioned _value, $Res Function(_$Provisioned) _then)
      : super(_value, (v) => _then(v as _$Provisioned));

  @override
  _$Provisioned get _value => super._value as _$Provisioned;
}

/// @nodoc

class _$Provisioned implements Provisioned {
  const _$Provisioned();

  @override
  String toString() {
    return 'CourseState.provisioned()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Provisioned);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unspecified,
    required TResult Function() active,
    required TResult Function() archived,
    required TResult Function() provisioned,
    required TResult Function() declined,
    required TResult Function() suspended,
  }) {
    return provisioned();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unspecified,
    TResult Function()? active,
    TResult Function()? archived,
    TResult Function()? provisioned,
    TResult Function()? declined,
    TResult Function()? suspended,
  }) {
    return provisioned?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unspecified,
    TResult Function()? active,
    TResult Function()? archived,
    TResult Function()? provisioned,
    TResult Function()? declined,
    TResult Function()? suspended,
    required TResult orElse(),
  }) {
    if (provisioned != null) {
      return provisioned();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unspecified value) unspecified,
    required TResult Function(Active value) active,
    required TResult Function(Archived value) archived,
    required TResult Function(Provisioned value) provisioned,
    required TResult Function(Declined value) declined,
    required TResult Function(Suspended value) suspended,
  }) {
    return provisioned(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Unspecified value)? unspecified,
    TResult Function(Active value)? active,
    TResult Function(Archived value)? archived,
    TResult Function(Provisioned value)? provisioned,
    TResult Function(Declined value)? declined,
    TResult Function(Suspended value)? suspended,
  }) {
    return provisioned?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unspecified value)? unspecified,
    TResult Function(Active value)? active,
    TResult Function(Archived value)? archived,
    TResult Function(Provisioned value)? provisioned,
    TResult Function(Declined value)? declined,
    TResult Function(Suspended value)? suspended,
    required TResult orElse(),
  }) {
    if (provisioned != null) {
      return provisioned(this);
    }
    return orElse();
  }
}

abstract class Provisioned implements CourseState {
  const factory Provisioned() = _$Provisioned;
}

/// @nodoc
abstract class _$$DeclinedCopyWith<$Res> {
  factory _$$DeclinedCopyWith(
          _$Declined value, $Res Function(_$Declined) then) =
      __$$DeclinedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeclinedCopyWithImpl<$Res> extends _$CourseStateCopyWithImpl<$Res>
    implements _$$DeclinedCopyWith<$Res> {
  __$$DeclinedCopyWithImpl(_$Declined _value, $Res Function(_$Declined) _then)
      : super(_value, (v) => _then(v as _$Declined));

  @override
  _$Declined get _value => super._value as _$Declined;
}

/// @nodoc

class _$Declined implements Declined {
  const _$Declined();

  @override
  String toString() {
    return 'CourseState.declined()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Declined);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unspecified,
    required TResult Function() active,
    required TResult Function() archived,
    required TResult Function() provisioned,
    required TResult Function() declined,
    required TResult Function() suspended,
  }) {
    return declined();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unspecified,
    TResult Function()? active,
    TResult Function()? archived,
    TResult Function()? provisioned,
    TResult Function()? declined,
    TResult Function()? suspended,
  }) {
    return declined?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unspecified,
    TResult Function()? active,
    TResult Function()? archived,
    TResult Function()? provisioned,
    TResult Function()? declined,
    TResult Function()? suspended,
    required TResult orElse(),
  }) {
    if (declined != null) {
      return declined();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unspecified value) unspecified,
    required TResult Function(Active value) active,
    required TResult Function(Archived value) archived,
    required TResult Function(Provisioned value) provisioned,
    required TResult Function(Declined value) declined,
    required TResult Function(Suspended value) suspended,
  }) {
    return declined(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Unspecified value)? unspecified,
    TResult Function(Active value)? active,
    TResult Function(Archived value)? archived,
    TResult Function(Provisioned value)? provisioned,
    TResult Function(Declined value)? declined,
    TResult Function(Suspended value)? suspended,
  }) {
    return declined?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unspecified value)? unspecified,
    TResult Function(Active value)? active,
    TResult Function(Archived value)? archived,
    TResult Function(Provisioned value)? provisioned,
    TResult Function(Declined value)? declined,
    TResult Function(Suspended value)? suspended,
    required TResult orElse(),
  }) {
    if (declined != null) {
      return declined(this);
    }
    return orElse();
  }
}

abstract class Declined implements CourseState {
  const factory Declined() = _$Declined;
}

/// @nodoc
abstract class _$$SuspendedCopyWith<$Res> {
  factory _$$SuspendedCopyWith(
          _$Suspended value, $Res Function(_$Suspended) then) =
      __$$SuspendedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuspendedCopyWithImpl<$Res> extends _$CourseStateCopyWithImpl<$Res>
    implements _$$SuspendedCopyWith<$Res> {
  __$$SuspendedCopyWithImpl(
      _$Suspended _value, $Res Function(_$Suspended) _then)
      : super(_value, (v) => _then(v as _$Suspended));

  @override
  _$Suspended get _value => super._value as _$Suspended;
}

/// @nodoc

class _$Suspended implements Suspended {
  const _$Suspended();

  @override
  String toString() {
    return 'CourseState.suspended()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Suspended);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unspecified,
    required TResult Function() active,
    required TResult Function() archived,
    required TResult Function() provisioned,
    required TResult Function() declined,
    required TResult Function() suspended,
  }) {
    return suspended();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unspecified,
    TResult Function()? active,
    TResult Function()? archived,
    TResult Function()? provisioned,
    TResult Function()? declined,
    TResult Function()? suspended,
  }) {
    return suspended?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unspecified,
    TResult Function()? active,
    TResult Function()? archived,
    TResult Function()? provisioned,
    TResult Function()? declined,
    TResult Function()? suspended,
    required TResult orElse(),
  }) {
    if (suspended != null) {
      return suspended();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unspecified value) unspecified,
    required TResult Function(Active value) active,
    required TResult Function(Archived value) archived,
    required TResult Function(Provisioned value) provisioned,
    required TResult Function(Declined value) declined,
    required TResult Function(Suspended value) suspended,
  }) {
    return suspended(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Unspecified value)? unspecified,
    TResult Function(Active value)? active,
    TResult Function(Archived value)? archived,
    TResult Function(Provisioned value)? provisioned,
    TResult Function(Declined value)? declined,
    TResult Function(Suspended value)? suspended,
  }) {
    return suspended?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unspecified value)? unspecified,
    TResult Function(Active value)? active,
    TResult Function(Archived value)? archived,
    TResult Function(Provisioned value)? provisioned,
    TResult Function(Declined value)? declined,
    TResult Function(Suspended value)? suspended,
    required TResult orElse(),
  }) {
    if (suspended != null) {
      return suspended(this);
    }
    return orElse();
  }
}

abstract class Suspended implements CourseState {
  const factory Suspended() = _$Suspended;
}
