import 'package:flutter/material.dart';
import 'package:portfolio/ThemeColors.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatefulWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _NavBarState extends State<NavBar> {
  bool isHoveredResume = false;

  Future<void> _openPDF() async {
    final Uri pdfUrl = Uri.parse('https://drive.google.com/file/d/1yyS2gZ7b6BocTkfybGvuxxUlQO9tKy5Y/view?usp=sharing');

    if (await canLaunchUrl(pdfUrl)) {
      await launchUrl(
        pdfUrl,
        webOnlyWindowName: 'Resume Arnav Gupta',
      );
    } else {
      throw 'Could not open';
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth >= 700) {
          return AppBar(
              backgroundColor: ThemeColors.navy,
              elevation: 0,
              leading: Padding(
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  'NavBar/Logo.png',
                  fit: BoxFit.cover,
                  color: ThemeColors.green,
                ),
              ),
              actions: [
                NavBarButton(text: 'About'),
                NavBarButton(text: 'Skills'),
                NavBarButton(text: 'Projects'),
                NavBarButton(text: 'Experience'),
                NavBarButton(text: 'Contact'),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 30, top: 20),
                  child: GestureDetector(
                    onTap: () {
                      _openPDF();
                    },
                    child: MouseRegion(
                      onEnter: (_) => setState(() => isHoveredResume = true),
                      onExit: (_) => setState(() => isHoveredResume = false),
                      child: Container(
                        height: 150,
                        width: 120,
                        decoration: BoxDecoration(
                          color: ThemeColors.navy,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: ThemeColors.green,
                            width: 1,
                          ),
                          boxShadow: isHoveredResume ? [
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
                            'Resume',
                            style: TextStyle(
                              color: ThemeColors.green,
                              fontSize: isHoveredResume ? 18 : 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]
          );
        } else {
          return AppBar(
            backgroundColor: ThemeColors.navy,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'NavBar/Logo.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(3.1416),
                    child: Image.asset(
                      'NavBar/Menu.png',
                      height: 30,
                      width: 30,
                      color: ThemeColors.green,
                    ),
                  ),
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  bool isHoveredResume = false;

  Future<void> _openPDF() async {
    final Uri pdfUrl = Uri.parse('https://drive.google.com/file/d/1yyS2gZ7b6BocTkfybGvuxxUlQO9tKy5Y/view?usp=sharing');

    if (await canLaunchUrl(pdfUrl)) {
      await launchUrl(
        pdfUrl,
        webOnlyWindowName: 'Resume Arnav Gupta',
      );
    } else {
      throw 'Could not open';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ThemeColors.navy,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                child: Image.asset(
                  'NavBar/Cancel.png',
                  height: 20,
                  width: 20,
                  color: ThemeColors.green,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: NavBarButton(text: 'About'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: NavBarButton(text: 'Skills'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: NavBarButton(text: 'Projects'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: NavBarButton(text: 'Experience'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: NavBarButton(text: 'Contact'),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            _openPDF();
                          },
                          child: MouseRegion(
                            onEnter: (_) => setState(() => isHoveredResume = true),
                            onExit: (_) => setState(() => isHoveredResume = false),
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: ThemeColors.navy,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  color: ThemeColors.green,
                                  width: 1,
                                ),
                                boxShadow: isHoveredResume ? [
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
                                  'Resume',
                                  style: TextStyle(
                                    color: ThemeColors.green,
                                    fontSize: isHoveredResume ? 18 : 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarButton extends StatefulWidget {
  final String text;

  const NavBarButton({super.key, required this.text});

  @override
  State<NavBarButton> createState() => _NavBarButtonState();
}

class _NavBarButtonState extends State<NavBarButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 20),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: GestureDetector(
          onTap: () {

          },
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 200),
            style: TextStyle(
              color: isHovered ? ThemeColors.green : ThemeColors.slate,
              fontSize: isHovered ? 18 : 16,
            ),
            child: Text(
              widget.text,
            ),
          ),
        ),
      ),
    );
  }
}
