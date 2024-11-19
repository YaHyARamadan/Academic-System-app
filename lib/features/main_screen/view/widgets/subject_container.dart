import 'package:flutter/material.dart';

import '../../../../core/style/my_text_style.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../subject_screen/view/subject_screen.dart';

class SubjectContainer extends StatelessWidget {
  const SubjectContainer(
      {super.key,
        required this.imgPath,
        required this.title,
        this.scale,
        this.height,
        this.height1, });

  final String imgPath;
  final String title;
  final double? scale;
  final double? height;
  final double? height1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=> SubjectScreen(subjectName: title))
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.47,
          height: MediaQuery.of(context).size.height * 0.25,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xffF2F2F2),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: height,
                ),
                Image.asset(
                  imgPath,
                  scale: scale,
                ),
                SizedBox(
                  height: height1,
                ),
                CustomText(text: title, style: MyTextStyle.cairo20Size500Weight)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
