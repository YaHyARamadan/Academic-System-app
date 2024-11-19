import 'package:flutter/material.dart';

import '../../../../../core/style/my_text_style.dart';
import '../../../../../core/widgets/custom_text.dart';

class PlatformRegisterButton extends StatelessWidget {
  const PlatformRegisterButton({
    super.key,
    required this.imgPath,
    required this.title,
    required this.color,
    required this.onTap,
  });

  final String imgPath;
  final String title;
  final GestureTapCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            imgPath,
            scale: 15,
          ),
          const SizedBox(width: 2),
          CustomText(
              text: title,
              style: MyTextStyle.kanit24Size400Weight.copyWith(color: color))
        ],
      ),
    );
  }
}
