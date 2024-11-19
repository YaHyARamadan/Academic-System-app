import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gradu/core/style/my_text_style.dart';
import 'package:gradu/core/widgets/custom_text.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../view/widgets/pdf_viewer.dart';
import 'package:http/http.dart' as http;

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

  Future<void> uploadPdf(
      String folderName,
      List<Map<String, String>> listOfUploadedFile,
      String folderType,
      context) async {
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

        print("Done Uploading...: $fileUrl");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: CustomText(
            text: "Done Uploading..",
            style:
                MyTextStyle.cairo20Size500Weight.copyWith(color: Colors.white),
          ),
          backgroundColor: const Color(0xff11A7A4),
        ));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: CustomText(
            text: "Uploading Failed.. Try Again:$e",
            style:
                MyTextStyle.cairo20Size500Weight.copyWith(color: Colors.white),
          ),
          backgroundColor: const Color(0xff11A7A4),
        ));

        print("Uploading Failed.. Try Again: $e");
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: CustomText(
          text: "No Folder Selected",
          style: MyTextStyle.cairo20Size500Weight.copyWith(color: Colors.white),
        ),
        backgroundColor: const Color(0xff11A7A4),
      ));
      print("No Folder Selected");
    }
  }

  Future<String> getDownloadPath() async {
    try {
      final directory = await getExternalStorageDirectory();

      if (directory == null) return '';
      final downloadPath = '${directory.path}/Download';
      return downloadPath;
    } catch (e) {
      print('invalid path: $e');
      return '';
    }
  }
  Future<String> downloadFile(String pdfUrl) async {
    try {
      final directoryPath = await getDownloadPath();
      if (directoryPath.isEmpty) {
        throw Exception('Can`t get folder');
      }

      final fileName = pdfUrl.split('/').last;
      final filePath = '$directoryPath/$fileName';

      final downloadDirectory = Directory(directoryPath);
      if (!await downloadDirectory.exists()) {
        await downloadDirectory.create(recursive: true);
      }

      final response = await http.get(Uri.parse(pdfUrl));

      if (response.statusCode == 200) {
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        return filePath;
      } else {
        throw Exception("Failed to download file");
      }
    } catch (e) {
      print('Error while downloading: $e');
      return '';
    }
  }
}
