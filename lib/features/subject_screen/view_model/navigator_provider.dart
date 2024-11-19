import 'package:flutter/material.dart';

import '../../../core/routes/routes.dart';

class NavigatorProvider extends ChangeNotifier {
  lecNavigator(subjectName, context) {
    switch (subjectName) {
      case "C++":
        Navigator.of(context).pushNamed(AppRoutes.cPlusScreen);
        break;
      case "Database":
        Navigator.of(context).pushNamed(AppRoutes.dataBaseScreen);
        break;
      case "Linux":
        Navigator.of(context).pushNamed(AppRoutes.linuxScreen);
        break;
      case "    Digital\nEngineering":
        Navigator.of(context).pushNamed(AppRoutes.digitalScreen);
        break;
      case "OS":
        Navigator.of(context).pushNamed(AppRoutes.osScreen);
        break;
      case "Web":
        Navigator.of(context).pushNamed(AppRoutes.webScreen);
        break;
    }
  }

  tutorialsNavigator(subjectName, context) {
    switch (subjectName) {
      case "C++":
        Navigator.of(context).pushNamed(AppRoutes.cPlusTutorialScreen);
        break;
      case "Database":
        Navigator.of(context).pushNamed(AppRoutes.dataBaseTutorialScreen);
        break;
      case "Linux":
        Navigator.of(context).pushNamed(AppRoutes.linuxTutorialScreen);
        break;
      case "    Digital\nEngineering":
        Navigator.of(context).pushNamed(AppRoutes.digitalTutorialScreen);
        break;
      case "OS":
        Navigator.of(context).pushNamed(AppRoutes.osTutorialScreen);
        break;
      case "Web":
        Navigator.of(context).pushNamed(AppRoutes.webTutorialScreen);
        break;
    }
  }
}
