import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/themes/app_assets.dart';
import 'widgets/custom_card.dart';
import 'widgets/custom_floating_button.dart';
import 'widgets/custom_scaffold.dart';
import '../view_model/upload_files_provider.dart';

class DataBaseScreen extends StatelessWidget {
  const DataBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UploadFilesProvider>(context);

    return  CustomScaffold(
      floatingActionButton: CustomFloatingButton(
        folderName: "Database",
        listOfUploadedFile: provider.uploadedDBPdf,
        folderType: 'Lec',
      ),
      title: 'Database',
      headerText: "Lectures",
      bodyWidgets: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: provider.uploadedDBPdf.length,
            itemBuilder: (context, index) {
              final file = provider.uploadedDBPdf[index];
              return CustomCard(
                title: "Chapter ${index + 1}",
                imagePath: AppAssets.dataBaseAsset,
                scale: 2.5,
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

class DataBaseTutorialScreen extends StatelessWidget {
  const DataBaseTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UploadFilesProvider>(context);
    return  CustomScaffold(
      floatingActionButton: CustomFloatingButton(
        folderName: "DB Tutorials",
        listOfUploadedFile: provider.uploadedDBTuPdf,
        folderType: 'Tutorials',
      ),
      title: 'DataBase',
      headerText: "Tutorials",
      bodyWidgets: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: provider.uploadedDBTuPdf.length,
            itemBuilder: (context, index) {
              final file = provider.uploadedDBTuPdf[index];
              return CustomCard(
                title: "Tutorial ${index + 1}",
                imagePath: AppAssets.dataBaseAsset,
                scale: 2.5,
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
