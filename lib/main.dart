// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/shared_db.dart';
import 'package:sizer/sizer.dart';

import 'package:portfolio_app/home.dart';
import 'package:portfolio_app/routes.dart';
import 'package:portfolio_app/theme.dart';

void main() async {
  bool? dark = await ThemeDb.getTheme();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      defaultDevice: Devices.ios.iPhone16ProMax,
      builder: (context) => MyApp(isDarkMode: dark),
    ),
  );
}

ThemeMode _themeMode = ThemeMode.system;

class MyApp extends StatefulWidget {
  final bool? isDarkMode;
  MyApp({Key? key, this.isDarkMode}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool isDarkMode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isDarkMode = widget.isDarkMode ?? false;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientaion, eviceType) {
        return AnimatedTheme(
          data: _themeMode == ThemeMode.dark
              ? AppTheme.darkMode
              : AppTheme.lightmode,
          duration: const Duration(milliseconds: 500),
          child: MaterialApp.router(
            title: 'Flutter Demo',

            locale: DevicePreview.locale(context),
            debugShowCheckedModeBanner: false,

            builder: DevicePreview.appBuilder,
            theme: AppTheme.lightmode,
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

            darkTheme: AppTheme.darkMode,
            routerConfig: AppRoutes.goRouter,
          ),
        );
      },
    );
  }
}
