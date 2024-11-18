import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/subject_screen/view_model/upload_files_provider.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
    required this.folderName,
    required this.listOfUploadedFile, required this.folderType,
  });

  final String folderName;
  final String folderType;
  final List<Map<String, String>> listOfUploadedFile;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UploadFilesProvider>(context);
    return FloatingActionButton(
      onPressed: () async {
        provider.uploadPdf(folderName, listOfUploadedFile, folderType);
      },
      backgroundColor: const Color(0xff11A7A4),
      foregroundColor: Colors.white,
      child: const Icon(Icons.upload_rounded),
    );
  }
}
