import 'package:flutter/material.dart';

import '../../../../core/style/my_text_style.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/pdf_view.dart';

class AssignmentContainer extends StatelessWidget {
  const AssignmentContainer({
    super.key,
    required this.assignmentName,
    required this.descriptionAssignment,
    required this.imgPath,
    required this.uploadTap,
    required this.pdfPath,
    this.sizeBoxWidth,
  });

  final String assignmentName;
  final String descriptionAssignment;
  final String imgPath;
  final String pdfPath;
  final double? sizeBoxWidth;
  final VoidCallback uploadTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.96,
      height: MediaQuery.sizeOf(context).height * 0.25,
      decoration: BoxDecoration(
        color: const Color(0xffe1e1e1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Column(
            children: [
              const SizedBox(height: 10),
              CustomText(
                text: assignmentName,
                style: MyTextStyle.kanit24Size400Weight.copyWith(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                ),
              ),
              CustomText(
                text: descriptionAssignment,
                style: MyTextStyle.kanit24Size400Weight.copyWith(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Image.asset(imgPath, scale: 4),
            ],
          ),
          const SizedBox(width: 10),
          SizedBox(width: sizeBoxWidth),
          const VerticalDivider(
            thickness: 0.4,
            color: Colors.black,
            indent: 20,
            endIndent: 20,
          ),
          const SizedBox(width: 25),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PdfView(
                            titleAppbar: assignmentName,
                            pdfPath: pdfPath,
                          )),
                    );
                  },
                  child: Container(
                    width: 80,
                    height: 90,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      "assets/img/subjects_screen/search (1).png",
                      scale: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                InkWell(
                  onTap: uploadTap, // Calls the closure when tapped
                  child: Container(
                    width: 80,
                    height: 90,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.upload_rounded,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
