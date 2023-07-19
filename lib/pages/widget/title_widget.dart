import 'package:flutter/material.dart';
import 'package:holocare/config/theme.dart';

class TitleWidget extends StatelessWidget {
  final String? title1;
  final TextStyle? title1Style;
  final String? title2;
  final String? button;
  const TitleWidget({
    super.key,
    this.title1,
    this.title1Style,
    this.title2,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title1 != null) ...[
          Text(
            title1!,
            style: title1Style ?? TextStyles.title2,
          ),
          const SizedBox(
            height: 10,
          )
        ],
        if (title2 != null)
          Text(
            title2!,
            style: TextStyles.body2.copyWith(color: ColorStyles.gray_03),
          ),
      ],
    );
  }
}
