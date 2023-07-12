// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Protect _$$_ProtectFromJson(Map<String, dynamic> json) => _$_Protect(
      protectedDeviceId: json['protectedDeviceId'] as String,
      protectorDeviceId: json['protectorDeviceId'] as String,
      code: json['code'] as String,
      createAt: json['createAt'] as String,
    );

Map<String, dynamic> _$$_ProtectToJson(_$_Protect instance) =>
    <String, dynamic>{
      'protectedDeviceId': instance.protectedDeviceId,
      'protectorDeviceId': instance.protectorDeviceId,
      'code': instance.code,
      'createAt': instance.createAt,
    };
