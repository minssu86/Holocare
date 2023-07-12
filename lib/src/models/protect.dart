import 'package:freezed_annotation/freezed_annotation.dart';

part 'protect.freezed.dart';
part 'protect.g.dart';

@freezed
class Protect with _$Protect {
  factory Protect({
    required String protectedDeviceId,
    required String protectorDeviceId,
    required String code,
    required String createAt,
  }) = _Protect;

  Protect._();

  factory Protect.fromJson(Map<String, dynamic> json) => _$ProtectFromJson(json);
}
