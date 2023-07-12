import 'package:flutter/material.dart';

import '../../config/theme.dart';

class LayoutTopWidget extends StatelessWidget {
  final String? top1;
  final String? top2;
  const LayoutTopWidget({super.key, this.top1 = "", this.top2 = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            top1!,
            style: TextStyles.title2,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            top2!,
            style: TextStyles.body2.copyWith(color: ColorStyles.gray_03),
          ),
        ],
      ),
    );
  }
}
