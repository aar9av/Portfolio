import 'package:flutter/material.dart';

import 'About.dart';
import 'CodingProfile.dart';
import 'Contact.dart';
import 'Experience.dart';
import 'Projects.dart';
import 'Skills.dart';

class CenterSection extends StatelessWidget {
  const CenterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80,),
            About(),
            SizedBox(height: 150,),
            Skills(),
            SizedBox(height: 150,),
            Projects(),
            SizedBox(height: 150,),
            Experience(),
            SizedBox(height: 150,),
            CodingProfiles(),
            SizedBox(height: 150,),
            Contact(),
            SizedBox(height: 80,),
          ],
        ),
      )
    );
  }
}
