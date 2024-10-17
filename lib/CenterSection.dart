import 'package:flutter/material.dart';

import 'About.dart';
import 'Contact.dart';
import 'Experience.dart';
import 'Projects.dart';
import 'Skills.dart';

class CenterSection extends StatelessWidget {
  final ScrollController scrollController;
  final GlobalKey aboutKey;
  final GlobalKey skillsKey;
  final GlobalKey projectsKey;
  final GlobalKey experienceKey;
  final GlobalKey contactKey;

  const CenterSection({super.key, required this.scrollController, required this.aboutKey, required this.skillsKey, required this.projectsKey, required this.experienceKey, required this.contactKey});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Container(key: aboutKey, child: SizedBox(height: 80,),),
            About(scrollController: scrollController, projectsKey: projectsKey,),
            SizedBox(height: 150,),
            Container(key: skillsKey, child: Skills(),),
            SizedBox(height: 150,),
            Container(key: projectsKey, child: Projects(),),
            SizedBox(height: 150,),
            Container(key: experienceKey, child: Experience(),),
            SizedBox(height: 150,),
            Container(key: contactKey, child: Contact(),),
          ],
        ),
      )
    );
  }
}
