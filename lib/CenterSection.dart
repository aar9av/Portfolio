import 'package:flutter/material.dart';
import 'package:portfolio/ThemeColors.dart';

class CenterSection extends StatelessWidget {
  const CenterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, my name is",
              style: TextStyle(fontSize: 18, color: ThemeColors.green),
            ),
            SizedBox(height: 10),
            Text(
              "Arnav Gupta.",
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.white),
            ),
            Text(
              "I build things for the web.",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  color: ThemeColors.lightSlate),
            ),
            SizedBox(height: 20),
            Text(
              "I’m a software engineer specializing in building (and occasionally designing) exceptional digital experiences.",
              style: TextStyle(fontSize: 20, color: ThemeColors.lightSlate),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 30.0), backgroundColor: Colors.tealAccent,
                textStyle: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              child: Text('Check out my projects!'),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
