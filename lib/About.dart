import 'package:flutter/material.dart';
import 'ThemeColors.dart';

class About extends StatelessWidget {
  final ScrollController scrollController;
  final GlobalKey projectsKey;

  const About({super.key, required this.scrollController, required this.projectsKey});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth >= 900) {
            return Row(
              children: [
                ProfilePicture(),
                Expanded(child: Description(scrollController: scrollController, projectsKey: projectsKey,)),
              ],
            );
          } else {
            return Column(
              children: [
                ProfilePicture(),
                Description(scrollController: scrollController, projectsKey: projectsKey,),
              ],
            );
          }
        }
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsets.only(left: 50, top: 50),
        child: SizedBox(
          height: 320,
          width: 240,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 300,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: ThemeColors.green,
                        width: 2,
                      )
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  height: 310,
                  width: 230,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: ThemeColors.navy,
                        width: 7,
                      )
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: ThemeColors.green,
                          width: 3,
                        )
                    ),
                    child: Image.asset(
                      'ProfilePicture.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  final ScrollController scrollController;
  final GlobalKey projectsKey;

  const Description({super.key, required this.scrollController, required this.projectsKey});

  void _scrollToSection() {
    print('IIIII');
    scrollController.animateTo(
      0,
      duration: Duration(microseconds: 1),
      curve: Curves.easeInOut,
    ).then((_) {
      if (projectsKey.currentContext != null) {
        final RenderBox renderBox = projectsKey.currentContext!.findRenderObject() as RenderBox;
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
      padding: const EdgeInsets.only(left: 50, top: 50, right: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hi, my name is",
            style: TextStyle(fontSize: 16, color: ThemeColors.green),
          ),
          Text(
            "Arnav Gupta.",
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: ThemeColors.white),
          ),
          Text(
            "Student at NIT, Bhopal.",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: ThemeColors.lightSlate),
          ),
          SizedBox(height: 20),
          Text(
            "I’m a passionate software engineer pursuing my Master’s in Computer Applications at NIT Bhopal. Skilled in various programming languages, I develop innovative solutions for mobile apps, web development, and real-time systems. I thrive in collaborative environments, enjoy solving coding challenges, and actively participate in hackathons to enhance my skills.",
            style: TextStyle(fontSize: 16, color: ThemeColors.lightSlate),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _scrollToSection();
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  vertical: 20.0, horizontal: 30.0), backgroundColor: ThemeColors.green,
            ),
            child: Text('Check out my projects!', style: TextStyle(color: ThemeColors.navy, fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}

