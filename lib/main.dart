import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradu/features/auth_screen/login_screen/view_model/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/helper/shared_prefs/cache_helper.dart';
import 'core/routes/router.dart';
import 'core/routes/routes.dart';
import 'features/auth_screen/register_screen/view_model/register_provider.dart';
import 'features/subject_screen/view_model/navigator_provider.dart';
import 'features/materiels_screen/view_model/upload_files_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Supabase.initialize(
    url: 'https://yfabdzsoeihhbfmbhwzr.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlmYWJkenNvZWloaGJmbWJod3pyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE5NDY2NzcsImV4cCI6MjA0NzUyMjY3N30.Th3vUsG9q7GFlJHbjl526zKifLeS2HF8VwwXTvu9SIA',
  );
  CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => RegisterProvider()),
        ChangeNotifierProvider(create: (context) => NavigatorProvider()),
        ChangeNotifierProvider(create: (context) => UploadFilesProvider()),
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
            );
          }),
    );
  }
}
