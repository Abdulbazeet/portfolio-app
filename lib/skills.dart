import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> with SingleTickerProviderStateMixin {
  final List<String> skills = [
    'Flutter',
    'Dart',
    'Firebase',
    'Node.js',
    'MongoDB',
    'REST APIs',
    'Git & GitHub',
    'Python',
    'Java',
  ];
  String selectedString = 'Flutter';
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedString = skills.first;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.sw, vertical: 4.sh),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Certain skills I\'ve mastered over the years includes..',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 3.sh),
                    Expanded(
                      child: ListView.builder(
                        itemCount: skills.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final animationInterval = Interval(
                            (index * 0.1),
                            1.0,
                            curve: Curves.easeOut,
                          );
                          return AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) {
                              final opacity = _controller.value > index * 0.1
                                  ? 1.0
                                  : 0.0; // fade logic
                              final offset =
                                  (1 - _controller.value) *
                                  50 *
                                  (index + 1).clamp(1, 5); // slide offset

                              return Opacity(
                                opacity: opacity,
                                child: Transform.translate(
                                  offset: Offset(0, offset.clamp(0, 50)),
                                  child: child,
                                ),
                              );
                            },
                            child: Card(
                              margin: EdgeInsets.symmetric(vertical: 1.h),
                              color: Theme.of(
                                context,
                              ).colorScheme.secondary.withValues(alpha: .5),
                              shadowColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                leading: Radio<String>(
                                  value: selectedString,

                                  enabled: true,
                                  groupValue: selectedString,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedString = value!;
                                    });
                                  },

                                  activeColor: Theme.of(
                                    context,
                                  ).colorScheme.primary,
                                ),
                                title: Text(
                                  skills[index],
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                          );
                        },
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
