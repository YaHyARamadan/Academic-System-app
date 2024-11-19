import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/widgets/pdf_viewer.dart';

class UploadFilesProvider extends ChangeNotifier {
  final SupabaseClient supabase = Supabase.instance.client;
  List<Map<String, String>> uploadedCPlusPdf = [];
  List<Map<String, String>> uploadedCPlusTuPdf = [];
  List<Map<String, String>> uploadedDBPdf = [];
  List<Map<String, String>> uploadedDBTuPdf = [];
  List<Map<String, String>> uploadedDEPdf = [];
  List<Map<String, String>> uploadedDETuPdf = [];
  List<Map<String, String>> uploadedOsPdf = [];
  List<Map<String, String>> uploadedOsTuPdf = [];
  List<Map<String, String>> uploadedLinuxPdf = [];
  List<Map<String, String>> uploadedLinuxTuPdf = [];
  List<Map<String, String>> uploadedWebPdf = [];
  List<Map<String, String>> uploadedWebTuPdf = [];
  List<Map<String, String>> uploadedAssignment = [];

  openPdf(String pdfUrl, context, title) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PdfViewerPage(pdfUrl: pdfUrl, title: title)),
    );
  }

  Future<void> uploadPdf(String folderName,
      List<Map<String, String>> listOfUploadedFile, String folderType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      String filePath = result.files.single.path!;
      String fileName = result.files.single.name;

      try {
        final response = await supabase.storage.from(folderType).upload(
              '$folderName/$fileName',
              File(filePath),
            );

        final fileUrl =
            supabase.storage.from('Lec').getPublicUrl('$folderName/$fileName');

        listOfUploadedFile.add({'name': fileName, 'url': fileUrl});
        notifyListeners();

        print("تم رفع الملف! الرابط: $fileUrl");
      } catch (e) {
        print("فشل رفع الملف: $e");
      }
    } else {
      print("لم يتم اختيار أي ملف.");
    }
  }
}
