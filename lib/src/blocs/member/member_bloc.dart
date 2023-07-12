import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:holocare/src/blocs/member/member_event.dart';
import 'package:holocare/src/blocs/member/member_state.dart';
import 'package:holocare/src/models/member.dart';

import '../../repository/member_repo.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  final MemberRepository memberRepository;

  // static MemberBloc? _instance;
  // static MemberBloc get instance {
  //   _instance ??= MemberBloc(memberRepository: MemberRepository());
  //   return _instance!;
  // }

  MemberBloc({
    required this.memberRepository,
  }) : super(Empty()) {
    on<FindMemberEvent>(
        (event, emit) => emit({_mapFindMemberEvent(event)} as MemberState));
    // on<CreateMemberEvent>((event, emit) => emit({
    //       _mapCreateMemberEvent(CreateMemberEvent(member: event.member))
    //     } as MemberState));
    // on<UpdateMemberEvent>((event, emit) =>
    //     emit(UpdateMemberEvent(member: event.member) as MemberState));
    on<SetMemberDataEvent>((event, emit) => emit(_mapSetMemberDataEvent(event) as MemberState));
  }

  // @override
  // Stream<MemberState> mapEventToState(MemberEvent event) async* {
  //   if(event is FindMemberEvent){
  //     yield* _mapFindMemberEvent(event);
  //   }else if(event is CreateMemberEvent){
  //     yield* _mapCreateMemberEvent(event);
  //   }else if(event is UpdateMemberEvent){
  //     yield* _mapUpdateMemberEvent(event);
  //   }
  // }

  Stream<MemberState> _mapFindMemberEvent(FindMemberEvent event) async* {
    try {
      yield Loading();
      print('aabbcascccccc');

      await memberRepository.findMember();
    } catch (e) {
      yield Error(message: e.toString());
    }
  }

  Stream<MemberState> _mapSetMemberDataEvent(SetMemberDataEvent event) async* {
    try {
      yield Loading();
      print('loaded member : ' + event.member.toString());
      yield Loaded(member: event.member);

    } catch (e) {
      yield Error(message: e.toString());
    }
  }

  Stream<MemberState> _mapCreateMemberEvent(CreateMemberEvent event) async* {
    try {
      final newMember = Member(
          deviceId: "123123",
          code: "abababa",
          type: 2,
          createAt: DateTime.now().toString(),
          connectCount: 0,
          status: "unconnected");

      final res = await memberRepository.createMember(newMember);
      yield Loaded(member: res!);
    } catch (e) {
      yield Error(message: e.toString());
    }
  }

  Stream<MemberState> _mapUpdateMemberEvent(UpdateMemberEvent event) async* {
    try {
      yield Loading();

      await memberRepository.updateMember(event.member);
    } catch (e) {
      yield Error(message: e.toString());
    }
  }
}
