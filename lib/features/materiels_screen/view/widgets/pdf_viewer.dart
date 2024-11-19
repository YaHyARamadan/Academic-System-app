import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:http/http.dart' as http;

import '../../../../core/style/my_text_style.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../view_model/upload_files_provider.dart';

class PdfViewerPage extends StatelessWidget {
  final String pdfUrl;
  final String title;

  const PdfViewerPage({super.key, required this.pdfUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UploadFilesProvider>(context);

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
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () async {
              final filePath = await provider.downloadFile(pdfUrl);
              if (filePath.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Done Downloading: $filePath'),
                ));
              }
            },
          ),
        ],
      ),
      body: FutureBuilder<String>(
        future: provider.downloadFile(pdfUrl),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return SfPdfViewer.file(File(snapshot.data!));
          } else {
            return const Center(child: Text('NO PDF'));
          }
        },
      ),
    );
  }
}


