import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.freezed.dart';
part 'member.g.dart';

@freezed
class Member with _$Member {
  factory Member({
    required String deviceId,
    required String code,
    required int type,
    required String createAt,
    required int connectCount,
    required String status,
  }) = _Member;

  Member._();

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}
