import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/themes/app_assets.dart';
import '../../core/widgets/custom_card.dart';
import '../../core/widgets/custom_floating_button.dart';
import '../../core/widgets/custom_scaffold.dart';
import '../subject_screen/view_model/upload_files_provider.dart';

class DigitalScreen extends StatelessWidget {
  const DigitalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UploadFilesProvider>(context);

    return  CustomScaffold(
      floatingActionButton: CustomFloatingButton(
        folderName: "DE Chapter",
        listOfUploadedFile: provider.uploadedDEPdf,
        folderType: 'Lec',
      ),
      title: 'Digital Eng...',
      headerText: "Lectures",
      bodyWidgets: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: provider.uploadedDEPdf.length,
            itemBuilder: (context, index) {
              final file = provider.uploadedDEPdf[index];
              return CustomCard(
                title: "Chapter ${index + 1}",
                imagePath: AppAssets.digitalEnginnerAsset,
                scale: 30,
                onTap: () => provider.openPdf(
                    file['url']!, context, "Chapter ${index + 1}"),
              );
            },
          ),
        ),
      ],
    );
  }
}

class DigitalTutorialScreen extends StatelessWidget {
  const DigitalTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UploadFilesProvider>(context);

    return CustomScaffold(
      floatingActionButton: CustomFloatingButton(
        folderName: "DE Tutorials",
        listOfUploadedFile: provider.uploadedDETuPdf,
        folderType: 'Tutorials',
      ),
      title: 'Digital Eng...',
      headerText: "Tutorials",
      bodyWidgets: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: provider.uploadedDETuPdf.length,
            itemBuilder: (context, index) {
              final file = provider.uploadedDETuPdf[index];
              return CustomCard(
                title: "Tutorial ${index + 1}",
                imagePath: AppAssets.digitalEnginnerAsset,
                scale: 30,
                onTap: () => provider.openPdf(
                    file['url']!, context, "Tutorial ${index + 1}"),
              );
            },
          ),
        ),
      ],
    );
  }
}
