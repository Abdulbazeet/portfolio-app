import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:portfolio_app/shared_db.dart';
import 'package:portfolio_app/routes.dart';
import 'package:portfolio_app/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool? dark = await ThemeDb.getTheme();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      defaultDevice: Devices.ios.iPhone16ProMax,
      builder: (context) => MyApp(isDarkMode: dark ?? false),
    ),
  );
}

class MyApp extends StatefulWidget {
  final bool isDarkMode;
  const MyApp({super.key, required this.isDarkMode});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool isDarkMode;

  @override
  void initState() {
    super.initState();
    isDarkMode = widget.isDarkMode;
  }

  void _toggleTheme() async {
    final newTheme = !isDarkMode;
    await ThemeDb.storeTheme(newTheme);
    setState(() => isDarkMode = newTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientaion, deviceType) {
        return MaterialApp.router(
          title: 'Portfolio App',
          locale: DevicePreview.locale(context),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return DevicePreview.appBuilder(context, child);
          },
          theme: AppTheme.lightmode,
          darkTheme: AppTheme.darkMode,
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          routerConfig: AppRoutes.goRouter,
        );
      },
    );
  }
}
