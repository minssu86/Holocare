import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:holocare/config/theme.dart';
import 'package:holocare/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ProtectorCode extends StatelessWidget {
  const ProtectorCode({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: ColorStyles.gray_04),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "연결코드",
                style: TextStyles.caption1,
              ),
              Text(
                provider.code ?? "",
                style: TextStyles.body1Strong,
              ),
            ],
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: ColorStyles.secondary,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              disabledBackgroundColor: ColorStyles.gray_04,
              disabledForegroundColor: ColorStyles.white,
            ),
            onPressed: () => copy(provider.code),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.copy,
                  color: ColorStyles.primary,
                ),
                Text(
                  "복사하기",
                  style: TextStyles.body2Strong
                      .copyWith(color: ColorStyles.primary),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void copy(code) {
    Clipboard.setData(ClipboardData(text: code));
  }
}
