
import 'package:flutter/material.dart';
import 'package:gradu/core/style/my_text_style.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'custom_text.dart';

class PdfView extends StatelessWidget {
  final String pdfPath;
  final String titleAppbar;

  const PdfView(
      {super.key,
        required this.pdfPath,
        required this.titleAppbar,
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: titleAppbar,
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
      ),
      body: SfPdfViewer.asset(
        pdfPath,
      ),
    );
  }
}
