import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/themes/app_assets.dart';
import 'widgets/custom_card.dart';
import 'widgets/custom_floating_button.dart';
import 'widgets/custom_scaffold.dart';
import '../view_model/upload_files_provider.dart';

class LinuxScreen extends StatelessWidget {
  const LinuxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UploadFilesProvider>(context);

    return  CustomScaffold(
      floatingActionButton: CustomFloatingButton(
        folderName: "Linux",
        listOfUploadedFile: provider.uploadedLinuxPdf,
        folderType: 'Lec',
      ),
      title: 'Linux',
      headerText: "Lectures",
      bodyWidgets: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: provider.uploadedLinuxPdf.length,
            itemBuilder: (context, index) {
              final file = provider.uploadedLinuxPdf[index];
              return CustomCard(
                title: "Chapter ${index + 1}",
                imagePath: AppAssets.linuxAsset,
                scale: 2,
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

class LinuxTutorialScreen extends StatelessWidget {
  const LinuxTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UploadFilesProvider>(context);

    return CustomScaffold(
      floatingActionButton: CustomFloatingButton(
        folderName: "Linux Tutorials",
        listOfUploadedFile: provider.uploadedLinuxTuPdf,
        folderType: 'Tutorials',
      ),
      title: 'Linux',
      headerText: "Tutorials",
      bodyWidgets: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: provider.uploadedLinuxTuPdf.length,
            itemBuilder: (context, index) {
              final file = provider.uploadedLinuxTuPdf[index];
              return CustomCard(
                title: "Tutorial ${index + 1}",
                imagePath: AppAssets.linuxAsset,
                scale: 2,
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
