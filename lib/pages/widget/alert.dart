import 'package:flutter/material.dart';
import 'package:holocare/config/theme.dart';
import 'package:holocare/pages/widget/button.dart';

class CustomAlert extends StatelessWidget {
  final String? title;
  final String? content;
  VoidCallback? onPressed;
  CustomAlert({super.key, this.title, this.content, this.onPressed});

  @override
  Widget build(BuildContext context) {
    onPressed ??= () {
      Navigator.of(context).pop();
    };
    return AlertDialog(
      content: Container(
          constraints: const BoxConstraints(minWidth: 250),
          height: 130,
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title ?? "",
                style: TextStyles.body1Strong,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                content ?? "",
                style: TextStyles.body2.copyWith(
                  color: ColorStyles.gray_03,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )),
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyButton(
                onPressed: onPressed!,
                text: "확인",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
