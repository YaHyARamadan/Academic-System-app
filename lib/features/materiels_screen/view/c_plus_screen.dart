import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/themes/app_assets.dart';
import 'widgets/custom_card.dart';
import 'widgets/custom_floating_button.dart';
import 'widgets/custom_scaffold.dart';
import '../view_model/upload_files_provider.dart';

class CPlusScreen extends StatelessWidget {
  const CPlusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UploadFilesProvider>(context);
    return CustomScaffold(
        floatingActionButton: CustomFloatingButton(
          folderName: "c++",
          listOfUploadedFile: provider.uploadedCPlusPdf,
          folderType: 'Lec',
        ),
        title: "C++",
        headerText: "Lectures",
        bodyWidgets: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.uploadedCPlusPdf.length,
              itemBuilder: (context, index) {
                final file = provider.uploadedCPlusPdf[index];
                return CustomCard(
                  title: "Chapter ${index + 1}",
                  imagePath: AppAssets.cPlusAsset,
                  scale: 30,
                  onTap: () => provider.openPdf(
                      file['url']!, context, "Chapter ${index + 1}"),
                );
              },
            ),
          ),
        ]);
  }
}

class CPlusTutorialScreen extends StatelessWidget {
  const CPlusTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UploadFilesProvider>(context);

    return CustomScaffold(
      floatingActionButton: CustomFloatingButton(
        folderName: "c++ Tutorials",
        listOfUploadedFile: provider.uploadedCPlusTuPdf,
        folderType: 'Tutorials',
      ),
      title: 'C++',
      headerText: "Tutorials",
      bodyWidgets: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: provider.uploadedCPlusTuPdf.length,
            itemBuilder: (context, index) {
              final file = provider.uploadedCPlusTuPdf[index];
              return CustomCard(
                title: "Tutorial ${index + 1}",
                imagePath: AppAssets.cPlusAsset,
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
