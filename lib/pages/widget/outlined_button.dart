import 'package:flutter/material.dart';

import '../../config/theme.dart';

class CustomOutLinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CustomOutLinedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: ColorStyles.primary,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        disabledBackgroundColor: ColorStyles.gray_04,
        disabledForegroundColor: ColorStyles.white,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyles.body1Strong.copyWith(
          color: ColorStyles.white,
        ),
      ),
    );
  }
}
