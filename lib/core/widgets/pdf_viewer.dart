import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:http/http.dart' as http;

import '../style/my_text_style.dart';
import 'custom_text.dart';

class PdfViewerPage extends StatelessWidget {
  final String pdfUrl;
  final String title;

  const PdfViewerPage({super.key, required this.pdfUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: title,
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
      body: FutureBuilder<String>(
        future: _downloadFile(pdfUrl),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('فشل تحميل PDF: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return SfPdfViewer.file(File(snapshot.data!));
          } else {
            return const Center(child: Text('لا يوجد ملف PDF.'));
          }
        },
      ),
    );
  }

  // تحميل ملف PDF من URL
  Future<String> _downloadFile(String pdfUrl) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/pdfFile.pdf';

    final response = await http.get(Uri.parse(pdfUrl));

    if (response.statusCode == 200) {
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      return filePath; // إرجاع المسار المحلي للملف
    } else {
      throw Exception('فشل تحميل الملف');
    }
  }
}
