import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const CustomText(
      {super.key,
      required this.text,
      required this.style,
      this.fontSize,
      this.fontWeight,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: style ??
            TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
            ));
  }
}
