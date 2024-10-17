import 'package:flutter/material.dart';
import 'package:portfolio/ThemeColors.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatefulWidget implements PreferredSizeWidget {
  final ScrollController scrollController;
  final GlobalKey aboutKey;
  final GlobalKey skillsKey;
  final GlobalKey projectsKey;
  final GlobalKey experienceKey;
  final GlobalKey contactKey;

  const NavBar({super.key, required this.scrollController, required this.aboutKey, required this.skillsKey, required this.projectsKey, required this.experienceKey, required this.contactKey});

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
                padding: EdgeInsets.all(5),
                child: Image.asset(
                  'Logo.png',
                  fit: BoxFit.cover,
                  color: ThemeColors.green,
                ),
              ),
              actions: [
                NavBarButton(text: 'About', scrollController: widget.scrollController, sectionKey: widget.aboutKey),
                NavBarButton(text: 'Skills', scrollController: widget.scrollController, sectionKey: widget.skillsKey),
                NavBarButton(text: 'Projects', scrollController: widget.scrollController, sectionKey: widget.projectsKey),
                NavBarButton(text: 'Experience', scrollController: widget.scrollController, sectionKey: widget.experienceKey),
                NavBarButton(text: 'Contact', scrollController: widget.scrollController, sectionKey: widget.contactKey),
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
                'Logo.png',
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
                      'Menu.png',
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
  final ScrollController scrollController;
  final GlobalKey aboutKey;
  final GlobalKey skillsKey;
  final GlobalKey projectsKey;
  final GlobalKey experienceKey;
  final GlobalKey contactKey;

  const NavDrawer({super.key, required this.scrollController, required this.aboutKey, required this.skillsKey, required this.projectsKey, required this.experienceKey, required this.contactKey});

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
                  'Cancel.png',
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
                          child: NavBarButton(text: 'About', scrollController: widget.scrollController, sectionKey: widget.aboutKey),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: NavBarButton(text: 'Skills', scrollController: widget.scrollController, sectionKey: widget.skillsKey),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: NavBarButton(text: 'Projects', scrollController: widget.scrollController, sectionKey: widget.projectsKey),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: NavBarButton(text: 'Experience', scrollController: widget.scrollController, sectionKey: widget.experienceKey),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: NavBarButton(text: 'Contact', scrollController: widget.scrollController, sectionKey: widget.contactKey),
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
  final ScrollController scrollController;
  final GlobalKey? sectionKey;

  const NavBarButton({super.key, required this.text, required this.scrollController, required this.sectionKey});

  @override
  State<NavBarButton> createState() => _NavBarButtonState(scrollController);
}

class _NavBarButtonState extends State<NavBarButton> {
  bool isHovered = false;
  final ScrollController scrollController;

  _NavBarButtonState(this.scrollController);

  void _scrollToSection() {
    scrollController.animateTo(
      0,
      duration: Duration(microseconds: 1),
      curve: Curves.easeInOut,
    ).then((_) {
      if (widget.sectionKey != null && widget.sectionKey!.currentContext != null) {
        final RenderBox renderBox = widget.sectionKey!.currentContext!.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero).dy - AppBar().preferredSize.height;
        scrollController.animateTo(
          position,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 20),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: GestureDetector(
          onTap: _scrollToSection,
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
