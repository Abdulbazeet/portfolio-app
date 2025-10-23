import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_app/shared_db.dart';
import 'package:sizer/sizer.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool? isDarkMode;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    Future.delayed(const Duration(milliseconds: 300), () {
      controller.forward();
    });
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final theme = await ThemeDb.getTheme();
    setState(() => isDarkMode = theme ?? false);
  }

  Future<void> _toggleTheme() async {
    final newTheme = !(isDarkMode ?? false);
    await ThemeDb.storeTheme(newTheme);
    setState(() {
      isDarkMode = newTheme;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final slideAvatar = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutBack));

    final slideText = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutBack));

    final fade = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(child: Lottie.asset('assets/Background.json')),
            Positioned(
              right: 3.sw,
              top: 3.sh,
              child: InkWell(
                onTap: _toggleTheme,
                child: Icon(
                  (isDarkMode ?? false)
                      ? Icons.wb_sunny_rounded
                      : Icons.nightlight_round,
                  size: 24.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SlideTransition(
                      position: slideAvatar,
                      child: FadeTransition(
                        opacity: fade,
                        child: CircleAvatar(
                          radius: 40.sp,
                          backgroundImage: const AssetImage(
                            'assets/_DSC0015.jpg',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    SlideTransition(
                      position: slideText,
                      child: FadeTransition(
                        opacity: fade,
                        child: Column(
                          children: [
                            Text(
                              'Abdulbazeet Olatunji Balogun',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              "Hi there, I’m Abdulbazeet Olatunji, a passionate Flutter developer who enjoys turning ideas into interactive, meaningful digital experiences.",
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
