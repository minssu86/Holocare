// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'protect.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Protect _$ProtectFromJson(Map<String, dynamic> json) {
  return _Protect.fromJson(json);
}

/// @nodoc
mixin _$Protect {
  String get protectedDeviceId => throw _privateConstructorUsedError;
  String get protectorDeviceId => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get createAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProtectCopyWith<Protect> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProtectCopyWith<$Res> {
  factory $ProtectCopyWith(Protect value, $Res Function(Protect) then) =
      _$ProtectCopyWithImpl<$Res, Protect>;
  @useResult
  $Res call(
      {String protectedDeviceId,
      String protectorDeviceId,
      String code,
      String createAt});
}

/// @nodoc
class _$ProtectCopyWithImpl<$Res, $Val extends Protect>
    implements $ProtectCopyWith<$Res> {
  _$ProtectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? protectedDeviceId = null,
    Object? protectorDeviceId = null,
    Object? code = null,
    Object? createAt = null,
  }) {
    return _then(_value.copyWith(
      protectedDeviceId: null == protectedDeviceId
          ? _value.protectedDeviceId
          : protectedDeviceId // ignore: cast_nullable_to_non_nullable
              as String,
      protectorDeviceId: null == protectorDeviceId
          ? _value.protectorDeviceId
          : protectorDeviceId // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProtectCopyWith<$Res> implements $ProtectCopyWith<$Res> {
  factory _$$_ProtectCopyWith(
          _$_Protect value, $Res Function(_$_Protect) then) =
      __$$_ProtectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String protectedDeviceId,
      String protectorDeviceId,
      String code,
      String createAt});
}

/// @nodoc
class __$$_ProtectCopyWithImpl<$Res>
    extends _$ProtectCopyWithImpl<$Res, _$_Protect>
    implements _$$_ProtectCopyWith<$Res> {
  __$$_ProtectCopyWithImpl(_$_Protect _value, $Res Function(_$_Protect) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? protectedDeviceId = null,
    Object? protectorDeviceId = null,
    Object? code = null,
    Object? createAt = null,
  }) {
    return _then(_$_Protect(
      protectedDeviceId: null == protectedDeviceId
          ? _value.protectedDeviceId
          : protectedDeviceId // ignore: cast_nullable_to_non_nullable
              as String,
      protectorDeviceId: null == protectorDeviceId
          ? _value.protectorDeviceId
          : protectorDeviceId // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Protect extends _Protect {
  _$_Protect(
      {required this.protectedDeviceId,
      required this.protectorDeviceId,
      required this.code,
      required this.createAt})
      : super._();

  factory _$_Protect.fromJson(Map<String, dynamic> json) =>
      _$$_ProtectFromJson(json);

  @override
  final String protectedDeviceId;
  @override
  final String protectorDeviceId;
  @override
  final String code;
  @override
  final String createAt;

  @override
  String toString() {
    return 'Protect(protectedDeviceId: $protectedDeviceId, protectorDeviceId: $protectorDeviceId, code: $code, createAt: $createAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Protect &&
            (identical(other.protectedDeviceId, protectedDeviceId) ||
                other.protectedDeviceId == protectedDeviceId) &&
            (identical(other.protectorDeviceId, protectorDeviceId) ||
                other.protectorDeviceId == protectorDeviceId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, protectedDeviceId, protectorDeviceId, code, createAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProtectCopyWith<_$_Protect> get copyWith =>
      __$$_ProtectCopyWithImpl<_$_Protect>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProtectToJson(
      this,
    );
  }
}

abstract class _Protect extends Protect {
  factory _Protect(
      {required final String protectedDeviceId,
      required final String protectorDeviceId,
      required final String code,
      required final String createAt}) = _$_Protect;
  _Protect._() : super._();

  factory _Protect.fromJson(Map<String, dynamic> json) = _$_Protect.fromJson;

  @override
  String get protectedDeviceId;
  @override
  String get protectorDeviceId;
  @override
  String get code;
  @override
  String get createAt;
  @override
  @JsonKey(ignore: true)
  _$$_ProtectCopyWith<_$_Protect> get copyWith =>
      throw _privateConstructorUsedError;
}
