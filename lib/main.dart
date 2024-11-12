import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradu/features/auth_screen/login_screen/view_model/login_provider.dart';
import 'package:provider/provider.dart';

import 'core/helper/shared_prefs/cache_helper.dart';
import 'core/routes/router.dart';
import 'core/routes/routes.dart';
import 'features/auth_screen/model/auth_service_provider.dart';
import 'features/auth_screen/register_screen/view_model/register_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> AuthServiceProvider()),
        ChangeNotifierProvider(create: (context)=> LoginProvider()),
        ChangeNotifierProvider(create: (context)=> RegisterProvider()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              useInheritedMediaQuery: true,
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              title: 'Flutter Demo',
              initialRoute: AppRoutes.splashScreen,
              onGenerateRoute: onGenerate,
              //
              // theme: ThemeData(
              //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              //   useMaterial3: true,
              //   scaffoldBackgroundColor: Colors.white,
              // ),
              // theme: ThemeData(
              //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              //   useMaterial3: true,
              //   scaffoldBackgroundColor: Colors.white,
              // ),
              // home: const OutroScreen(),
            );
          }),
    );
  }
}
