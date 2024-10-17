import 'package:flutter/material.dart';
import 'package:portfolio/ThemeColors.dart';
import 'package:url_launcher/url_launcher.dart';

class LeftSideBar extends StatelessWidget {
  const LeftSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 120,
          color: ThemeColors.navy,
          child: Column(
            children: [
              SizedBox(
                height: 240,
              ),
              SizedBox(
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SocialIconButton(icon: 'GitHub.png', url: 'https://github.com/aar9av',),
                    SocialIconButton(icon: 'LinkedIn.png', url: 'https://www.linkedin.com/in/aar9av/',),
                    SocialIconButton(icon: 'Instagram.png', url: 'https://www.instagram.com/aar9av/',),
                    SocialIconButton(icon: 'Codechef.png', url: 'https://www.codechef.com/users/aar9av',),
                    SocialIconButton(icon: 'Leetcode.png', url: 'https://leetcode.com/u/aar9av/',),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              Expanded(
                child: VerticalDivider(
                  thickness: 1,
                  color: Colors.grey,
                  width: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RightSideBar extends StatefulWidget {
  const RightSideBar({super.key});

  @override
  _RightSideBarState createState() => _RightSideBarState();
}

class _RightSideBarState extends State<RightSideBar> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      color: ThemeColors.navy,
      child: Column(
        children: [
          SizedBox(height: 240),
          SizedBox(
            height: 250,
            child: RotatedBox(
              quarterTurns: 1,
              child: MouseRegion(
                onEnter: (_) => setState(() => isHovered = true),
                onExit: (_) => setState(() => isHovered = false),
                child: GestureDetector(
                  onTap: () {
                    _composeEmail('arnavgupta.mca@gmail.com');
                  },
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: TextStyle(
                      color: isHovered ? ThemeColors.green : ThemeColors.slate,
                      fontSize: isHovered ? 18 : 17,
                    ),
                    child: Text("arnavgupta.mca@gmail.com"),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10), // Optional spacing
          Expanded(
            child: VerticalDivider(
              thickness: 1,
              color: isHovered ? ThemeColors.green : ThemeColors.slate,
              width: 20,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _composeEmail(String email) async {
    final Uri uri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch mail client';
    }
  }
}

class SocialIconButton extends StatefulWidget {
  final String icon;
  final String url;

  const SocialIconButton({super.key, required this.icon, required this.url});

  @override
  _SocialIconButtonState createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool isHovered = false;

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch ${widget.url}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Tooltip(
        message: widget.url,
        child: GestureDetector(
          onTap: _launchURL,
          child: Image.asset(
            widget.icon,
            height: isHovered ? 24 : 20,
            width: isHovered ? 24 : 20,
            color: isHovered ? ThemeColors.green : ThemeColors.slate,
          ),
        ),
      ),
    );
  }
}