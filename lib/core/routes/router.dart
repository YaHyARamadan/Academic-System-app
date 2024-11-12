import 'package:flutter/material.dart';
import 'package:gradu/core/routes/routes.dart';
import '../../features/auth_screen/login_screen/view/login_screen.dart';
import '../../features/auth_screen/register_screen/view/register_screen.dart';
import '../../features/intro_screen/view/intro_screen.dart';
import '../../features/main_screen/view/main_screen.dart';
import '../../features/outro_screen/view/outro_screen.dart';
import '../../features/splash_screen/view/splash_screen.dart';

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
          builder: (context) => const MainScreen(),
          settings: routeSettings);
    default:
      return MaterialPageRoute(
          builder: (context) => const IntroScreen(), settings: routeSettings);
  }
}
