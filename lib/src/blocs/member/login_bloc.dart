import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:holocare/src/blocs/member/member_event.dart';
import 'package:holocare/src/blocs/member/member_state.dart';
import 'package:holocare/src/models/member.dart';

import '../../repository/member_repo.dart';

class LoginBloc extends Bloc<MemberEvent, MemberState> {
  final MemberRepository memberRepository;

  LoginBloc({
    required this.memberRepository,
  }) : super(Empty()) {
    on<FindMemberEvent>(_login);
  }


  void _login(FindMemberEvent event, Emitter<MemberState> emitter) async {
    emit(Loading());
    await memberRepository.findMember().then((value) => {
      emit(Loaded(member: value))
    }).catchError((onError) => {
      emit(Error(message: '실패'))
    }
    );
  }
}
