// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Member _$$_MemberFromJson(Map<String, dynamic> json) => _$_Member(
      deviceId: json['deviceId'] as String,
      code: json['code'] as String,
      type: json['type'] as int,
      createAt: json['createAt'] as String,
      connectCount: json['connectCount'] as int,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$_MemberToJson(_$_Member instance) => <String, dynamic>{
      'deviceId': instance.deviceId,
      'code': instance.code,
      'type': instance.type,
      'createAt': instance.createAt,
      'connectCount': instance.connectCount,
      'status': instance.status,
    };
