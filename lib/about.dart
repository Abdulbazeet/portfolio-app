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
    setState(() {
      isDarkMode = theme;
    });
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
      begin: const Offset(-1, 0), // from left
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutBack));

    final slideText = Tween<Offset>(
      begin: const Offset(1, 0), // from right
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutBack));

    final fade = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              right: 3.sw,
              top: 0,
              child: InkWell(
                onTap: _toggleTheme,
                child: (isDarkMode ?? false)
                    ? const Icon(Icons.sunny)
                    : const Icon(Icons.mode_night),
              ),
            ),
            // Positioned.fill(child: Lottie.asset('assets/Background.json')),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.sw, vertical: 4.sh),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SlideTransition(
                      position: slideAvatar,
                      child: FadeTransition(
                        opacity: fade,
                        child: CircleAvatar(radius: 40.sp),
                      ),
                    ),
                    SlideTransition(
                      position: slideText,
                      child: FadeTransition(
                        opacity: fade,
                        child: Column(
                          children: [
                            SizedBox(height: 3.sh),
                            Text(
                              'Abdulbazeet Olatunji Balogun',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            SizedBox(height: 3.sh),
                            Text(
                              "Hi there, I’m Abdulbazeet Olatunji, a passionate Flutter developer who enjoys turning ideas into interactive, meaningful digital experiences. I love creating things that not only look great but also feel intuitive to use. When I’m not coding, I’m exploring design concepts, learning new technologies, or thinking about how to make user experiences smoother and smarter. My goal is simple — build products that people enjoy using.",
                              style: Theme.of(context).textTheme.bodyMedium,
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
