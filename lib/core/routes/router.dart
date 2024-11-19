import 'package:flutter/material.dart';
import 'package:gradu/core/routes/routes.dart';
import 'package:gradu/features/assigmment_screen/view/assigment_screen.dart';
import 'package:gradu/features/lectures_screen/view/lectures_screen.dart';
import 'package:gradu/features/materiels_screen/c_plus_screen.dart';
import 'package:gradu/features/materiels_screen/data_base_screen.dart';
import 'package:gradu/features/materiels_screen/digital_screen.dart';
import 'package:gradu/features/materiels_screen/linux_screen.dart';
import 'package:gradu/features/materiels_screen/os_screen.dart';
import 'package:gradu/features/materiels_screen/web_scren.dart';
import '../../features/auth_screen/login_screen/view/login_screen.dart';
import '../../features/auth_screen/register_screen/view/register_screen.dart';
import '../../features/intro_screen/view/intro_screen.dart';
import '../../features/main_screen/view/main_screen.dart';
import '../../features/outro_screen/view/outro_screen.dart';
import '../../features/splash_screen/view/splash_screen.dart';
import '../../features/subject_screen/view/subject_screen.dart';

Route<dynamic> onGenerate(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoutes.splashScreen:
      return MaterialPageRoute(
          builder: (context) => const SplashScreen(), settings: routeSettings);
    case AppRoutes.introScreen:
      return MaterialPageRoute(
          builder: (context) => const IntroScreen(), settings: routeSettings);
    case AppRoutes.loginScreen:
      return MaterialPageRoute(
          builder: (context) => const LoginScreen(), settings: routeSettings);
    case AppRoutes.registerScreen:
      return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
          settings: routeSettings);

    case AppRoutes.outroScreen:
      return MaterialPageRoute(
          builder: (context) => const OutroScreen(), settings: routeSettings);

    case AppRoutes.mainScreen:
      return MaterialPageRoute(
          builder: (context) => const MainScreen(), settings: routeSettings);

    case AppRoutes.lecturesScreen:
      return MaterialPageRoute(
          builder: (context) => const LecturesScreen(),
          settings: routeSettings);

    case AppRoutes.cPlusScreen:
      return MaterialPageRoute(
          builder: (context) => const CPlusScreen(), settings: routeSettings);
    case AppRoutes.dataBaseScreen:
      return MaterialPageRoute(
          builder: (context) => const DataBaseScreen(),
          settings: routeSettings);
    case AppRoutes.digitalScreen:
      return MaterialPageRoute(
          builder: (context) => const DigitalScreen(), settings: routeSettings);
    case AppRoutes.webScreen:
      return MaterialPageRoute(
          builder: (context) => const WebScreen(), settings: routeSettings);
    case AppRoutes.linuxScreen:
      return MaterialPageRoute(
          builder: (context) => const LinuxScreen(), settings: routeSettings);
    case AppRoutes.osScreen:
      return MaterialPageRoute(
          builder: (context) => const OsScreen(), settings: routeSettings);

    case AppRoutes.cPlusTutorialScreen:
      return MaterialPageRoute(
          builder: (context) => const CPlusTutorialScreen(),
          settings: routeSettings);
    case AppRoutes.dataBaseTutorialScreen:
      return MaterialPageRoute(
          builder: (context) => const DataBaseTutorialScreen(),
          settings: routeSettings);
    case AppRoutes.digitalTutorialScreen:
      return MaterialPageRoute(
          builder: (context) => const DigitalTutorialScreen(),
          settings: routeSettings);
    case AppRoutes.webTutorialScreen:
      return MaterialPageRoute(
          builder: (context) => const WebTutorialScreen(),
          settings: routeSettings);
    case AppRoutes.linuxTutorialScreen:
      return MaterialPageRoute(
          builder: (context) => const LinuxTutorialScreen(),
          settings: routeSettings);
    case AppRoutes.osTutorialScreen:
      return MaterialPageRoute(
          builder: (context) => const OsTutorialScreen(),
          settings: routeSettings);
    case AppRoutes.assignmentScreen:
      return MaterialPageRoute(
          builder: (context) => const AssignmentScreen(),
          settings: routeSettings);
    default:
      return MaterialPageRoute(
          builder: (context) => const IntroScreen(), settings: routeSettings);
  }
}
