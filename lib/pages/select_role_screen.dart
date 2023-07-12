import 'package:flutter/material.dart';
import 'package:holocare/config/theme.dart';
import 'package:holocare/pages/widget/layout.dart';
import 'package:holocare/pages/widget/layout_top_widget.dart';
import 'package:holocare/pages/widget/outlined_button.dart';
import 'package:holocare/provider/user_provider.dart';
import 'package:provider/provider.dart';

class SelectRoleScreen extends StatefulWidget {
  const SelectRoleScreen({super.key});

  @override
  State<SelectRoleScreen> createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen> {
  String? selectedRole;
  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);

    return LayoutWidget(
      appBar: _appBar(context),
      top: _topWidget(),
      middle: _middleWidget(provider),
      bottom: _bottomWidget(provider, context),
    );
  }

  void _selectRole(role) {
    setState(() {
      selectedRole = role;
    });
  }

  AppBar _appBar(context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  Widget _topWidget() {
    return const LayoutTopWidget(
      top1: "역할을 선택해주세요",
      top2: "역할을 수정할 수 없으니 신중하게 선택해주세요",
    );
  }

  Widget _middleWidget(provider) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              _selectRole('protectee');
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: selectedRole == 'protectee'
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
                          "보호 대상자 / 피보호자",
                          style: TextStyles.body1Strong.copyWith(
                            color: selectedRole == "protectee"
                                ? null
                                : ColorStyles.gray_03,
                          ),
                        ),
                        Text(
                          "보호자는 보호대상자의 활동이 감지되지 않으면 알림을 받습니다",
                          style: TextStyles.body2.copyWith(
                            color: selectedRole == 'protectee'
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
                      color: selectedRole == 'protectee'
                          ? ColorStyles.primary
                          : ColorStyles.gray_03,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              _selectRole('protector');
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: selectedRole == 'protector'
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
                          "보호자",
                          style: TextStyles.body1Strong.copyWith(
                            color: selectedRole == "protector"
                                ? null
                                : ColorStyles.gray_03,
                          ),
                          // selectedRole == "protector"
                          //     ? TextStyles.body1Strong
                          //     : null,
                        ),
                        Text(
                          "보호자는 보호대상자의 활동이 감지되지 않으면 알림을 받습니다",
                          style: TextStyles.body2.copyWith(
                            color: selectedRole == 'protector'
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
                      color: selectedRole == 'protector'
                          ? ColorStyles.primary
                          : ColorStyles.gray_03,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomWidget(UserProvider provider, context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomOutLinedButton(
            onPressed: () => {
                  provider.setRole(selectedRole!)
                  // .then((_) =>
                  //     {Navigator.pushNamed(context, '/${provider.role}/code')})
                },
            text: "다음")
      ],
    );
  }
}
