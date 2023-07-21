import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_level_type.freezed.dart';

@freezed
abstract class ActiveLevelType with _$ActiveLevelType {
  const factory ActiveLevelType.success() = Success;
  const factory ActiveLevelType.caution() = Caution;
  const factory ActiveLevelType.warning() = Warning;
  const factory ActiveLevelType.pause() = Pause;
}
