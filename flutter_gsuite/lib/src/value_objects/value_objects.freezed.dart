// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'value_objects.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserProjectionTearOff {
  const _$UserProjectionTearOff();

  _Basic basic() {
    return const _Basic();
  }

  _Custom custom() {
    return const _Custom();
  }

  _Full full() {
    return const _Full();
  }
}

/// @nodoc
const $UserProjection = _$UserProjectionTearOff();

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
abstract class _$BasicCopyWith<$Res> {
  factory _$BasicCopyWith(_Basic value, $Res Function(_Basic) then) =
      __$BasicCopyWithImpl<$Res>;
}

/// @nodoc
class __$BasicCopyWithImpl<$Res> extends _$UserProjectionCopyWithImpl<$Res>
    implements _$BasicCopyWith<$Res> {
  __$BasicCopyWithImpl(_Basic _value, $Res Function(_Basic) _then)
      : super(_value, (v) => _then(v as _Basic));

  @override
  _Basic get _value => super._value as _Basic;
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
    return identical(this, other) || (other is _Basic);
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
abstract class _$CustomCopyWith<$Res> {
  factory _$CustomCopyWith(_Custom value, $Res Function(_Custom) then) =
      __$CustomCopyWithImpl<$Res>;
}

/// @nodoc
class __$CustomCopyWithImpl<$Res> extends _$UserProjectionCopyWithImpl<$Res>
    implements _$CustomCopyWith<$Res> {
  __$CustomCopyWithImpl(_Custom _value, $Res Function(_Custom) _then)
      : super(_value, (v) => _then(v as _Custom));

  @override
  _Custom get _value => super._value as _Custom;
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
    return identical(this, other) || (other is _Custom);
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
abstract class _$FullCopyWith<$Res> {
  factory _$FullCopyWith(_Full value, $Res Function(_Full) then) =
      __$FullCopyWithImpl<$Res>;
}

/// @nodoc
class __$FullCopyWithImpl<$Res> extends _$UserProjectionCopyWithImpl<$Res>
    implements _$FullCopyWith<$Res> {
  __$FullCopyWithImpl(_Full _value, $Res Function(_Full) _then)
      : super(_value, (v) => _then(v as _Full));

  @override
  _Full get _value => super._value as _Full;
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
    return identical(this, other) || (other is _Full);
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
class _$MinAccessRoleTearOff {
  const _$MinAccessRoleTearOff();

  _FreeBusyReader freeBusyReader() {
    return const _FreeBusyReader();
  }

  _Owner owner() {
    return const _Owner();
  }

  _Reader reader() {
    return const _Reader();
  }

  _Writer writer() {
    return const _Writer();
  }
}

/// @nodoc
const $MinAccessRole = _$MinAccessRoleTearOff();

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
abstract class _$FreeBusyReaderCopyWith<$Res> {
  factory _$FreeBusyReaderCopyWith(
          _FreeBusyReader value, $Res Function(_FreeBusyReader) then) =
      __$FreeBusyReaderCopyWithImpl<$Res>;
}

/// @nodoc
class __$FreeBusyReaderCopyWithImpl<$Res>
    extends _$MinAccessRoleCopyWithImpl<$Res>
    implements _$FreeBusyReaderCopyWith<$Res> {
  __$FreeBusyReaderCopyWithImpl(
      _FreeBusyReader _value, $Res Function(_FreeBusyReader) _then)
      : super(_value, (v) => _then(v as _FreeBusyReader));

  @override
  _FreeBusyReader get _value => super._value as _FreeBusyReader;
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
    return identical(this, other) || (other is _FreeBusyReader);
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
abstract class _$OwnerCopyWith<$Res> {
  factory _$OwnerCopyWith(_Owner value, $Res Function(_Owner) then) =
      __$OwnerCopyWithImpl<$Res>;
}

/// @nodoc
class __$OwnerCopyWithImpl<$Res> extends _$MinAccessRoleCopyWithImpl<$Res>
    implements _$OwnerCopyWith<$Res> {
  __$OwnerCopyWithImpl(_Owner _value, $Res Function(_Owner) _then)
      : super(_value, (v) => _then(v as _Owner));

  @override
  _Owner get _value => super._value as _Owner;
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
    return identical(this, other) || (other is _Owner);
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
abstract class _$ReaderCopyWith<$Res> {
  factory _$ReaderCopyWith(_Reader value, $Res Function(_Reader) then) =
      __$ReaderCopyWithImpl<$Res>;
}

/// @nodoc
class __$ReaderCopyWithImpl<$Res> extends _$MinAccessRoleCopyWithImpl<$Res>
    implements _$ReaderCopyWith<$Res> {
  __$ReaderCopyWithImpl(_Reader _value, $Res Function(_Reader) _then)
      : super(_value, (v) => _then(v as _Reader));

  @override
  _Reader get _value => super._value as _Reader;
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
    return identical(this, other) || (other is _Reader);
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
abstract class _$WriterCopyWith<$Res> {
  factory _$WriterCopyWith(_Writer value, $Res Function(_Writer) then) =
      __$WriterCopyWithImpl<$Res>;
}

/// @nodoc
class __$WriterCopyWithImpl<$Res> extends _$MinAccessRoleCopyWithImpl<$Res>
    implements _$WriterCopyWith<$Res> {
  __$WriterCopyWithImpl(_Writer _value, $Res Function(_Writer) _then)
      : super(_value, (v) => _then(v as _Writer));

  @override
  _Writer get _value => super._value as _Writer;
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
    return identical(this, other) || (other is _Writer);
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
