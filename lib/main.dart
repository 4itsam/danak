import 'package:danak/view/splash_screen.dart';
import 'package:danak/theme/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce_flutter/adapters.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle());
  WidgetsFlutterBinding.ensureInitialized();
  //initialize Hive Boxes
  await Hive.initFlutter();

  await Hive.openBox('userInformation');
  await Hive.openBox("notes");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtilInit Responsive Package
    return ScreenUtilInit(
      designSize: const Size(412, 917),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          
          title: AppName.appName,
          // Set Persian language To All App
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('fa'), // farsi
          ],
          locale: const Locale("fa"),
          debugShowCheckedModeBanner: false,
          home: Scaffold(body: SplashScreen()),
        );
      },
    );
  }
}
