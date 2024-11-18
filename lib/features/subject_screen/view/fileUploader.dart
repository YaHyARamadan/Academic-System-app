// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:file_picker/file_picker.dart';
// import 'dart:io';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart'; // استيراد المكتبة الخاصة بـ PDF Viewer من Syncfusion
// import 'package:http/http.dart' as http;
//
// import '../../../core/style/my_text_style.dart';
// import '../../../core/widgets/custom_text.dart';
//
// class PdfUploaderApp extends StatefulWidget {
//   @override
//   _PdfUploaderAppState createState() => _PdfUploaderAppState();
// }
//
// class _PdfUploaderAppState extends State<PdfUploaderApp> {
//   final SupabaseClient supabase = Supabase.instance.client;
//
//   List<Map<String, String>> uploadedFiles = []; // قائمة لحفظ روابط الملفات وأسمائها
//
//   // رفع الملف إلى Supabase
//   Future<void> uploadPdf() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'], // السماح بملفات PDF فقط
//     );
//
//     if (result != null) {
//       String filePath = result.files.single.path!;
//       String fileName = result.files.single.name;
//
//       try {
//         // رفع الملف
//         final response = await supabase.storage.from('Lec').upload(
//           'uploads/$fileName', // المسار داخل الحاوية
//           File(filePath),
//         );
//
//         // الحصول على الرابط مباشرة بعد الرفع
//         final fileUrl = supabase.storage.from('Lec').getPublicUrl('uploads/$fileName');
//
//         // تحديث القائمة
//         setState(() {
//           uploadedFiles.add({'name': fileName, 'url': fileUrl});
//         });
//
//         print("تم رفع الملف! الرابط: $fileUrl");
//
//       } catch (e) {
//         print("فشل رفع الملف: $e");
//       }
//     } else {
//       print("لم يتم اختيار أي ملف.");
//     }
//   }
//
//   // عرض ملف PDF
//   void openPdf(String pdfUrl) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => PdfViewerPage(pdfUrl: pdfUrl, title: '',),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('رفع وعرض ملفات PDF')),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: uploadPdf,
//             child: Text('رفع ملف PDF'),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: uploadedFiles.length,
//               itemBuilder: (context, index) {
//                 final file = uploadedFiles[index];
//                 return Card(
//                   child: ListTile(
//                     title: Text(file['name']!),
//                     trailing: const Icon(Icons.picture_as_pdf),
//                     onTap: () => openPdf(file['url']!),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class PdfViewerPage extends StatelessWidget {
//   final String pdfUrl;
//   final String title;
//
//   const PdfViewerPage({required this.pdfUrl, required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: CustomText(
//           text: title,
//           style: MyTextStyle.nunito24size800weight
//               .copyWith(fontSize: 30, color: Colors.white),
//         ),
//         flexibleSpace: Container(
//           alignment: Alignment.bottomLeft,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xff54BCC7), Color(0xff00A287)],
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//             ),
//           ),
//         ),
//
//       ),
//       body: FutureBuilder<String>(
//         future: _downloadFile(pdfUrl),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('فشل تحميل PDF: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             return SfPdfViewer.file(File(snapshot.data!));
//           } else {
//             return const Center(child: Text('لا يوجد ملف PDF.'));
//           }
//         },
//       ),
//     );
//   }
//
//   // تحميل ملف PDF من URL
//   Future<String> _downloadFile(String pdfUrl) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final filePath = '${directory.path}/pdfFile.pdf';
//
//     final response = await http.get(Uri.parse(pdfUrl));
//
//     if (response.statusCode == 200) {
//       final file = File(filePath);
//       await file.writeAsBytes(response.bodyBytes);
//       return filePath; // إرجاع المسار المحلي للملف
//     } else {
//       throw Exception('فشل تحميل الملف');
//     }
//   }
// }
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // تهيئة Supabase
//   await Supabase.initialize(
//     url: 'https://yfabdzsoeihhbfmbhwzr.supabase.co',  // استبدل بـ URL الخاص بك
//     anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlmYWJkenNvZWloaGJmbWJod3pyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE5NDY2NzcsImV4cCI6MjA0NzUyMjY3N30.Th3vUsG9q7GFlJHbjl526zKifLeS2HF8VwwXTvu9SIA',  // استبدل بـ anonKey الخاص بك
//   );
//
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: PdfUploaderApp(),
//   ));
// }
