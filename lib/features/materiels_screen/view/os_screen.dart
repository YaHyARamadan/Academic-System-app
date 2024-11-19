import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/themes/app_assets.dart';
import 'widgets/custom_card.dart';
import 'widgets/custom_floating_button.dart';
import 'widgets/custom_scaffold.dart';
import '../view_model/upload_files_provider.dart';

class OsScreen extends StatelessWidget {
  const OsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UploadFilesProvider>(context);

    return CustomScaffold(
      floatingActionButton: CustomFloatingButton(
        folderName: "OS ",
        listOfUploadedFile: provider.uploadedOsPdf,
        folderType: 'Lec',
      ),
      title: 'OS',
      headerText: "Lectures",
      bodyWidgets: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: provider.uploadedOsPdf.length,
            itemBuilder: (context, index) {
              final file = provider.uploadedOsPdf[index];
              return CustomCard(
                title: "Chapter ${index + 1}",
                imagePath: AppAssets.osAsset,
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

class OsTutorialScreen extends StatelessWidget {
  const OsTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UploadFilesProvider>(context);

    return CustomScaffold(
      floatingActionButton: CustomFloatingButton(
        folderName: "OS Tutorials",
        listOfUploadedFile: provider.uploadedOsTuPdf,
        folderType: 'Tutorials',
      ),
      title: 'OS',
      headerText: "Tutorials",
      bodyWidgets: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: provider.uploadedOsTuPdf.length,
            itemBuilder: (context, index) {
              final file = provider.uploadedOsTuPdf[index];
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
