import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/themes/app_assets.dart';
import 'widgets/custom_card.dart';
import 'widgets/custom_floating_button.dart';
import 'widgets/custom_scaffold.dart';
import '../view_model/upload_files_provider.dart';

class WebScreen extends StatelessWidget {
  const WebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UploadFilesProvider>(context);

    return CustomScaffold(
      floatingActionButton: CustomFloatingButton(
        folderName: "Web",
        listOfUploadedFile: provider.uploadedWebPdf,
        folderType: 'Lec',
      ),
      headerText: "Lectures",
      title: 'Web',
      bodyWidgets: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: provider.uploadedWebPdf.length,
            itemBuilder: (context, index) {
              final file = provider.uploadedWebPdf[index];
              return CustomCard(
                title: "Chapter ${index + 1}",
                imagePath: AppAssets.webAsset,
                scale: 10,
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

class WebTutorialScreen extends StatelessWidget {
  const WebTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UploadFilesProvider>(context);

    return CustomScaffold(
      floatingActionButton: CustomFloatingButton(
        folderName: "Web Tutorials",
        listOfUploadedFile: provider.uploadedWebTuPdf,
        folderType: 'Tutorials',
      ),
      headerText: "Tutorials",
      title: 'Web',
      bodyWidgets: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: provider.uploadedWebTuPdf.length,
            itemBuilder: (context, index) {
              final file = provider.uploadedWebTuPdf[index];
              return CustomCard(
                title: "Tutorial ${index + 1}",
                imagePath: AppAssets.osAsset,
                scale: 10,
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
