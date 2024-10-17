import 'package:flutter/material.dart';
import 'package:portfolio/ThemeColors.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  bool isHovered = false;

  Future<void> _composeEmail(String email) async {
    final Uri uri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch mail client';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "What's Next?",
            style: TextStyle(
              color: ThemeColors.green,
              fontSize: 24,
            ),
          ),
          Text(
            "Get In Touch",
            style: TextStyle(
              color: ThemeColors.white,
              fontSize: 36,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            child: Text(
              "I’m currently looking for any new opportunities, that can enhance my skills. My inbox is always open. Whether you have an opportunity for me or just want to say hi, I’ll try my best to get back to you!",
              style: TextStyle(
                color: ThemeColors.slate,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          GestureDetector(
            onTap: () {
              _composeEmail('arnavgupta.mca@gmail.com');
            },
            child: MouseRegion(
              onEnter: (_) => setState(() => isHovered = true),
              onExit: (_) => setState(() => isHovered = false),
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  color: ThemeColors.navy,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: ThemeColors.green,
                    width: 1,
                  ),
                  boxShadow: isHovered ? [
                    BoxShadow(
                      color: ThemeColors.green.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(2, -2),
                    ),
                  ] : [],
                ),
                child: Center(
                  child: Text(
                    'Say Hello',
                    style: TextStyle(
                      color: ThemeColors.green,
                      fontSize: isHovered ? 18 : 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
