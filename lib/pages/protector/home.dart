import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:holocare/config/theme.dart';
import 'package:holocare/data/repositories/user_repository.dart';
import 'package:holocare/pages/protector/code.dart';
import 'package:holocare/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ProtectorHomeScreen extends StatefulWidget {
  final String protecteeUid;
  const ProtectorHomeScreen({super.key, required this.protecteeUid});

  @override
  State<ProtectorHomeScreen> createState() => _ProtectorHomeScreenState();
}

class _ProtectorHomeScreenState extends State<ProtectorHomeScreen> {
  int? duration;
  DateTime? connectTime;
  bool? state;
  UserRepository userRepository = UserRepository();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userRepository.getProtecteeSnapshot(widget.protecteeUid).listen((snapshot) {
      print("snapshot change");
      print(snapshot.exists);
      if (snapshot.exists) {
        final data = snapshot.data();

        setState(() {
          connectTime = (data!['connectTime'] as Timestamp).toDate().toLocal();
          state = data['state'];
          duration = DateTime.now().difference(connectTime!).inHours;
          print(duration);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);
    if (provider.protectee == null) {
      return const ProtectorCodeScreen();
    }

    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(
        top: true,
        child: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: _bodyWidget()),
      ),
    );
  }

  Widget _bodyWidget() {
    if (connectTime == null || state == null) {
      return const Center(
        child: Text("loading.."),
      );
    }
    if (!state!) {
      return _mainWidget("보호가\n중지되었어요", "보호 중지", ColorStyles.gray_04,
          ColorStyles.gray_02, "stop");
    }
    if (duration! >= 24) {
      return _mainWidget("위험할 수 있는\n상황이에요", "위험", const Color(0xFFFDDDDD),
          const Color(0xFFDE2C2C), "danger");
    }
    if (duration! >= 12) {
      return _mainWidget("주의가 \n필요해요", "주의", const Color(0xFFFFF0D9),
          const Color(0xFFE79B0A), "caution");
    }
    return _mainWidget("안전하게\n보호하고있어요", "안전", const Color(0xFFC5EAD8),
        const Color(0xFF1AB46A), "safe");
  }

  Widget _mainWidget(
      String text1, String text2, Color color1, Color color2, String state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text1,
                        style: TextStyles.body1Strong.copyWith(fontSize: 28),
                      ),
                      Text(
                        "$duration시간 전에 활동을 확인했어요",
                        style: TextStyles.caption1,
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3), color: color1),
                    child: Text(
                      text2,
                      style: TextStyles.body2Strong.copyWith(color: color2),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Image.asset('assets/state/$state.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "최근 접속 ${_dateFormat(connectTime!)}",
                  style: TextStyles.caption1,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  String _dateFormat(DateTime dateTime) {
    return "${dateTime.year.toString().substring(2)}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

  AppBar _appBar(context) {
    return AppBar(
      title: Image.asset(
        'assets/logo/logo.png',
        height: 30,
      ),
      actions: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, '/protector/setting'),
          icon: const Icon(Icons.settings),
          color: Colors.black,
        ),
      ],
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
