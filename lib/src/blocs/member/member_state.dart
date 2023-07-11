import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:holocare/src/models/member.dart';

@immutable
abstract class MemberState extends Equatable {}

class Empty extends MemberState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Loading extends MemberState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Error extends MemberState {
  final String message;

  Error({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [this.message];
}

class Loaded extends MemberState {
  final Member member;
  Loaded({required this.member});

  @override
  // TODO: implement props
  List<Object> get props => [this.member];
}
