import 'package:flutter/material.dart';
import 'package:gradu/core/style/my_text_style.dart';
import 'package:gradu/core/themes/app_assets.dart';
import 'package:gradu/core/widgets/custom_scaffold.dart';
import 'package:gradu/core/widgets/custom_text.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Assignment',
      headerText: "WEEK 1",
      bodyWidgets: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.96,
          height: MediaQuery.sizeOf(context).height * 0.25,
          decoration: BoxDecoration(
              color: const Color(0xffe1e1e1),
              borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                      text: "Operating System ",
                      style: MyTextStyle.kanit24Size400Weight
                          .copyWith(fontSize: 21, fontWeight: FontWeight.w600)),
                  CustomText(
                      text: "Assignment 1 ",
                      style: MyTextStyle.kanit24Size400Weight
                          .copyWith(fontSize: 21, fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(AppAssets.osAsset, scale: 4),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              const VerticalDivider(
                thickness: 0.4,
                color: Colors.black,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(
                width: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 80,
                      height: 90,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Image.asset(
                        "assets/img/subjects_screen/search (1).png",
                        scale: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 80,
                      height: 90,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: const Icon(
                        Icons.upload_rounded,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Container
// (
// width: MediaQuery.sizeOf(context).width * 0.96,
// height: MediaQuery.sizeOf(context).height * 0.25,
// decoration: BoxDecoration(
// color: const Color(0xffe1e1e1),
// borderRadius: BorderRadius.circular(25)),
// child: Column(
// children: [
// CustomText(
// text: "Operating System ",
// style: MyTextStyle.kanit24Size400Weight
//     .copyWith(fontSize: 21, fontWeight: FontWeight.w600)),
// CustomText(
// text: "    Assignment 1 ",
// style: MyTextStyle.kanit24Size400Weight
//     .copyWith(fontSize: 21, fontWeight: FontWeight.w600)),
// Row(
// children: [
// const SizedBox(
// width: 15,
// ),
// Image.asset(AppAssets.osAsset, scale: 4),
// const SizedBox(
// width: 15,
// ),
// const VerticalDivider(
// thickness: 0.4,
// color: Colors.black,
// indent: 20,
// endIndent: 20,
// ),
// const SizedBox(
// width: 15,
// ),
//
// Column(
// children: [
// Row(
// children: [
// Container(
// width: 70,
// height: 70,
// decoration: const BoxDecoration(
// shape: BoxShape.circle, color: Colors.white),
// child: const Icon(
// Icons.upload_rounded,
// size: 40,
// ),
// ),
// const SizedBox(
// width: 20,
// ),
// Container(
// width: 70,
// height: 70,
// decoration: const BoxDecoration(
// shape: BoxShape.circle, color: Colors.white),
// child: Image.asset(
// "assets/img/subjects_screen/search (1).png",
// scale: 12,
// ),
// ),
// ],
// )
// ],
// )
// ],
// )
// ],
// ),
// )
// ,
