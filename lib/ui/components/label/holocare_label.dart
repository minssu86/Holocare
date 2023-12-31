import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HolocareLabel extends ConsumerWidget {
  String text;
  EdgeInsetsGeometry padding;
  Color? color;
  IconData? icon;
  TextStyle? textStyle;
  Color? background;
  GestureTapCallback? onTap;

  HolocareLabel({
    super.key,
    required this.text,
    this.background,
    this.textStyle,
    this.color,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: padding,
          child: Row(
            children: [
              Text(
                text,
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
