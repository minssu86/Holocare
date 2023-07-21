import 'package:flutter/material.dart';
import 'package:holocare/theme/holocare_text.dart';
import 'package:holocare/theme/holocare_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class HolocarePinCodeField extends ConsumerWidget {
  final void Function(String)? onChanged;

  const HolocarePinCodeField({super.key, this.onChanged});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(holocareThemeProvider);

    return PinCodeTextField(
      onChanged: onChanged,
      appContext: context,
      length: 7,
      obscureText: false,
      enableActiveFill: true,
      cursorColor: theme.appColors.grayscale_01,
      cursorHeight: 16,
      cursorWidth: 1.5,
      textStyle: theme.textTheme.b17.title(),
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        activeFillColor: theme.appColors.grayscale_05,
        activeColor: theme.appColors.white,
        inactiveFillColor: theme.appColors.grayscale_05,
        inactiveColor: theme.appColors.white,
        selectedFillColor: theme.appColors.grayscale_05,
        selectedColor: theme.appColors.primary,
        fieldWidth: 47,
        fieldHeight: 44,
      ),
    );
  }
}
