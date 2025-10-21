import 'package:flutter/material.dart';
import 'package:portfolio_app/about.dart';
import 'package:portfolio_app/contact.dart';
import 'package:portfolio_app/skills.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

int _count = 0;
final List body = [const About(), const Skills(), const Contact()];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Widget _buildBottom(int index, IconData icon, String pageName) {
      final isSelected = _count == index;
      return InkWell(
        onTap: () => setState(() => _count = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutQuad,
          padding: EdgeInsets.symmetric(
            horizontal: isSelected ? 4.sw : 0,
            vertical: 1.h,
          ),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(3.sw),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 22.sp, color: isSelected ? Colors.white : null),
              if (isSelected) ...[
                SizedBox(width: 2.sw),
                Text(
                  pageName,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: body[_count]),
          Positioned(
            bottom: 5.sh,
            right: 10.sw,
            left: 10.sw,
            child: Container(
              height: 8.5.sh,
              padding: EdgeInsets.symmetric(horizontal: 6.sw).copyWith(
                left: _count == 0 ? 1.h : 6.sw,
                right: _count == 2 ? 1.h : 6.sw,
              ),

              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(3.sw),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBottom(0, Icons.home, 'About me'),
                  _buildBottom(1, Icons.psychology, 'Skills'),
                  _buildBottom(2, Icons.account_box_rounded, 'Contact me'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
