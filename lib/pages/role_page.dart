import 'package:flutter/material.dart';
import 'package:holocare/config/theme.dart';
import 'package:holocare/pages/widget/appbar.dart';
import 'package:holocare/pages/widget/button.dart';
import 'package:holocare/pages/widget/title_widget.dart';
import 'package:holocare/providers/user_provider.dart';
import 'package:provider/provider.dart';

class SelectRolePage extends StatefulWidget {
  const SelectRolePage({super.key});

  @override
  State<SelectRolePage> createState() => _SelectRolePageState();
}

class _SelectRolePageState extends State<SelectRolePage> {
  String? selectedRole;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      appBar: const MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: _title(),
            ),
            Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        _roleWidget("protectee", "보호 대상자 / 피보호자",
                            "보호자는 보호대상자의 활동이 감지되지 않으면 알림을 받습니다"),
                        const SizedBox(
                          height: 20,
                        ),
                        _roleWidget("protector", "보호자",
                            "보호자는 보호대상자의 활동이 감지되지 않으면 알림을 받습니다")
                      ],
                    ),
                    _button(),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return const TitleWidget(
      title1: "역할을 선택해주세요",
      title2: "역할은 수정할 수 없으니 신중하게 선택해주세요",
    );
  }

  Widget _roleWidget(role, text1, text2) {
    return GestureDetector(
      onTap: () {
        _selectRole(role);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: selectedRole == role
                ? ColorStyles.primary
                : ColorStyles.gray_03,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: TextStyles.body1Strong.copyWith(
                      color: selectedRole == role ? null : ColorStyles.gray_03,
                    ),
                  ),
                  Text(
                    text2,
                    style: TextStyles.body2.copyWith(
                      color: selectedRole == role
                          ? ColorStyles.gray_02
                          : ColorStyles.gray_03,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Icon(
                Icons.check_circle,
                color: selectedRole == role
                    ? ColorStyles.primary
                    : ColorStyles.gray_03,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _button() {
    UserProvider provider = Provider.of<UserProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MyButton(
          onPressed: () async {
            if (selectedRole == null) return;
            await provider.setRole(selectedRole);
            if (!mounted) return;
            Navigator.pushReplacementNamed(context, "/code");
          },
          text: "다음",
        )
      ],
    );
  }

  void _selectRole(role) {
    setState(() {
      selectedRole = role;
    });
  }
}
