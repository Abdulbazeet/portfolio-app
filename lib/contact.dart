import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
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
                      'You can reach me on the following platforms',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 3.sh),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF0A66C2),
                            ),
                            child: Image.asset(
                              'assets/linkedin.png',
                              height: 20.sp,
                              width: 20.sp,
                            ),
                          ),
                        ),
                        SizedBox(width: 4.sw),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            onPressed: () {},
                            child: Image.asset(
                              'assets/whatsapp.png',
                              height: 20.sp,
                              width: 20.sp,
                            ),
                          ),
                        ),
                        SizedBox(width: 4.sw),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                            ),
                            onPressed: () {},
                            child: Image.asset(
                              'assets/twitter.png',
                              height: 20.sp,
                              width: 20.sp,
                            ),
                          ),
                        ),
                      ],
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
