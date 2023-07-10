
import 'package:equatable/equatable.dart';
import 'package:holocare/src/models/member.dart';

abstract class MemberEvent extends Equatable{}

class FindMemberEvent extends MemberEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SetMemberDataEvent extends MemberEvent{
  final Member member;

  SetMemberDataEvent({required this.member});

  @override
  // TODO: implement props
  List<Object> get props => [this.member];
}

class CreateMemberEvent extends MemberEvent{
  final Member member;

  CreateMemberEvent({required this.member});

  @override
  // TODO: implement props
  List<Object?> get props => [this.member];
}

class UpdateMemberEvent extends MemberEvent{
  final Member member;

  UpdateMemberEvent({required this.member});

  @override
  // TODO: implement props
  List<Object?> get props => [this.member];
}