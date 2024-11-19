import 'package:flutter/material.dart';

import '../../../../core/style/my_text_style.dart';
import '../../../../core/widgets/custom_text.dart';

class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({
    super.key,
    required this.imgPath,
    required this.title,
    this.scale,
    required this.onTap,
  });

  final String imgPath;
  final String title;
  final double? scale;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.2,
          decoration: BoxDecoration(
              color: const Color(0xffF2F2F4),
              borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              Image.asset(
                imgPath,
                scale: scale,
              ),
              const VerticalDivider(
                thickness: 0.4,
                color: Colors.black,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              CustomText(
                  text: title,
                  style: MyTextStyle.kanit24Size400Weight
                      .copyWith(fontWeight: FontWeight.w600))
            ],
          ),
        ),
      ),
    );
  }
}
