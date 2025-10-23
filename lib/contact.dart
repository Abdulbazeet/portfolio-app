import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Could not open link')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                    // 🔵 LinkedIn
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _launchURL(
                         "https://www.linkedin.com/in/abdul-bazeet-balogun-72798919a/", // your LinkedIn profile link
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0A66C2),
                        ),
                        child: Image.asset(
                          'assets/linkedin.png',
                          height: 20.sp,
                          width: 20.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 4.sw),

                    // 🟢 WhatsApp
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _launchURL(
                          'https://wa.me/2348089070396', // replace with your number
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: Image.asset(
                          'assets/whatsapp.png',
                          height: 20.sp,
                          width: 20.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 4.sw),

                    // ⚫ X (Twitter)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _launchURL(
                          'https://x.com/olatunji714', // replace with your handle
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
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
      ),
    );
  }
}
