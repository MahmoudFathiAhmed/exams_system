import 'package:exams_system/core/prefs/app_prefs.dart';
import 'package:exams_system/core/routes/app_routes.dart';
import 'package:exams_system/core/theme/dark_theme.dart';
import 'package:exams_system/core/utils/app_strings.dart';
import 'package:exams_system/core/utils/values_manger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _islogged = false;
  @override
  void initState() {
    checkLoggedin();
    super.initState();
  }

  checkLoggedin() async {
    await AppPrefs.getUserLoggedinDetails().then((value) {
      setState(() {
        _islogged = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(AppSize.s360, AppSize.s690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: getDarkThemeData(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        // home: _islogged ?? false ? HomeScreen() : SignInScreen(),
      ),
    );
  }
}
