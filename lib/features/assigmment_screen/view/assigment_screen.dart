import 'package:flutter/material.dart';
import 'package:gradu/core/themes/app_assets.dart';
import 'package:gradu/features/assigmment_screen/view/widgets/assignment_container.dart';
import 'package:gradu/features/materiels_screen/view/widgets/custom_scaffold.dart';
import 'package:gradu/features/materiels_screen/view_model/upload_files_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/style/my_text_style.dart';
import '../../../core/widgets/custom_text.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UploadFilesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Assignment",
          style: MyTextStyle.nunito24size800weight
              .copyWith(fontSize: 30, color: Colors.white),
        ),
        flexibleSpace: Container(
          alignment: Alignment.bottomLeft,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff54BCC7), Color(0xff00A287)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        actions: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(100)),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(90)),
              gradient: LinearGradient(
                colors: [Color(0xff54BCC7), Color(0xff00A287)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CustomText(
                    text: 'WEEK 1',
                    style: MyTextStyle.nunito24size800weight
                        .copyWith(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CustomText(
                      text: "INFORMATION TECHNOLOGY",
                      style: MyTextStyle.kanit24Size400Weight
                          .copyWith(color: Colors.white)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AssignmentContainer(
                    assignmentName: "Operating System",
                    descriptionAssignment: "Assignment 1",
                    imgPath: AppAssets.osAsset,
                    uploadTap: () {
                      provider.uploadPdf("assignment",
                          provider.uploadedAssignment, "assignment", context);
                    },
                    pdfPath: 'assets/pdf/OS Assign.pdf',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AssignmentContainer(
                    assignmentName: "Web",
                    descriptionAssignment: "Assignment 1",
                    imgPath: AppAssets.webAsset,
                    uploadTap: () {
                      provider.uploadPdf("assignment",
                          provider.uploadedAssignment, "assignment", context);
                    },
                    pdfPath: 'assets/pdf/web Assign.pdf',
                    sizeBoxWidth: 30,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AssignmentContainer(
                    assignmentName: "DE",
                    descriptionAssignment: "Assignment 1",
                    imgPath: AppAssets.digitalEnginnerAsset,
                    uploadTap: () {
                      provider.uploadPdf("assignment",
                          provider.uploadedAssignment, "assignment", context);
                    },
                    pdfPath: 'assets/pdf/Assignment 1.pdf',
                    sizeBoxWidth: 40,
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
