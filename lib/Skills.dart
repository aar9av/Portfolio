import 'dart:math';
import 'package:flutter/material.dart';
import 'package:portfolio/ThemeColors.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    double side = MediaQuery.of(context).size.width * 0.06;
    double x = 1.85, y = 1.65;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  color: ThemeColors.slate,
                ),
              ),
              Container(
                color: ThemeColors.navy,
                child: Text(
                  '   Skills   ',
                  style: TextStyle(
                    color: ThemeColors.slate,
                    fontSize: 18,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 1,
                  color: ThemeColors.slate,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.4,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Stack(
            children: [
              HexagonalWidget(x: side * x * 1, y: side * y * 1, side: side * 0.6, imagePath: 'Figma.png', border: Colors.redAccent, tech: 'Figma'),
              HexagonalWidget(x: side * x * 2, y: side * y * 1, side: side, imagePath: 'Maps.png', border: Colors.green, tech: 'Google Maps API'),
              HexagonalWidget(x: side * x * 3, y: side * y * 1, side: side, imagePath: 'Github96.png', border: Colors.black, tech: 'GitHub'),
              HexagonalWidget(x: side * x * 4, y: side * y * 1, side: side * 0.8, imagePath: 'Mysql.png', border: Colors.orangeAccent, tech: 'My SQL Server'),
              HexagonalWidget(x: side * x * 5, y: side * y * 1, side: side, imagePath: 'Java.png', border: Colors.deepOrangeAccent, tech: 'JAVA'),
              HexagonalWidget(x: side * x * 6, y: side * y * 1, side: side * 0.5, imagePath: 'Canva.png', border: Colors.blueAccent, tech: 'Canva'),

              HexagonalWidget(x: side * x * 1.5, y: side * y * 2, side: side, imagePath: 'Gemini.png', border: Colors.blueGrey, tech: 'Google Gemini AI API'),
              HexagonalWidget(x: side * x * 2.5, y: side * y * 2, side: side, imagePath: 'Flutter.png', border: Colors.blue, tech: 'Flutter'),
              HexagonalWidget(x: side * x * 3.5, y: side * y * 2, side: side, imagePath: 'Postgresql.png', border: Colors.indigo, tech: 'PostgreSQL'),
              HexagonalWidget(x: side * x * 4.5, y: side * y * 2, side: side, imagePath: 'Firebase.png', border: Colors.orangeAccent, tech: 'Firebase'),
              HexagonalWidget(x: side * x * 5.5, y: side * y * 2, side: side, imagePath: 'C++.png', border: Colors.blueAccent, tech: 'C++'),

              HexagonalWidget(x: side * x * 2, y: side * y * 3, side: side * 0.8, imagePath: 'Neon.png', border: Colors.greenAccent, tech: 'Neon Serverless Database'),
              HexagonalWidget(x: side * x * 3, y: side * y * 3, side: side, imagePath: 'Office.png', border: Colors.deepOrange, tech: 'MS Office'),
              HexagonalWidget(x: side * x * 4, y: side * y * 3, side: side, imagePath: 'Dart.png', border: Colors.blue, tech: 'Dart'),
              HexagonalWidget(x: side * x * 5, y: side * y * 3, side: side, imagePath: 'Android.png', border: Colors.lightGreenAccent, tech: 'Android Development'),
              HexagonalWidget(x: side * x * 6, y: side * y * 3, side: side, imagePath: 'Git.png', border: Colors.redAccent, tech: 'Git'),
              HexagonalWidget(x: side * x * 1.25, y: side * y * 3.25, side: side * 0.6, imagePath: 'C.png', border: Colors.indigoAccent, tech: 'C Language'),
            ],
          )
        ),
      ],
    );
  }
}

class HexagonalWidget extends StatefulWidget {
  final double x;
  final double y;
  final double side;
  final String imagePath;
  final Color border;
  final String tech;

  const HexagonalWidget({super.key, 
    required this.x,
    required this.y,
    required this.side,
    required this.imagePath,
    required this.border,
    required this.tech,
  });

  @override
  State<HexagonalWidget> createState() => _HexagonalWidgetState();
}

class _HexagonalWidgetState extends State<HexagonalWidget> {
  bool isHovered = false;
  
  @override
  Widget build(BuildContext context) {
    double height = 2 * widget.side;
    double width = sqrt(3) * widget.side;

    return Positioned(
      left: widget.x - sqrt(3) * widget.side * 0.5,
      top: widget.y - widget.side,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 0),
          decoration: BoxDecoration(
            boxShadow: isHovered ?
            [
              BoxShadow(
                color: widget.border,
                blurRadius: 80,
                spreadRadius: -10,
              )
            ] : []
          ),
          child: Tooltip(
            message: widget.tech,
            child: ClipPath(
              clipper: HexagonClipper(),
              child: Container(
                width: isHovered ? width * 1.05 : width,
                height: isHovered ? height * 1.05 : height,
                color: widget.border,
                child: Center(
                  child: ClipPath(
                    clipper: HexagonClipper(),
                    child: Container(
                      width: isHovered ? width : width * 0.93,
                      height: isHovered ? height : height * 0.93,
                      color: ThemeColors.white,
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.2),
                        child: Image.asset(
                          widget.imagePath,
                          //fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double sideLength = width / 2;

    Path path = Path();
    path.moveTo(width * 0.5, 0);
    path.lineTo(width, height * 0.25);
    path.lineTo(width, height * 0.75);
    path.lineTo(width * 0.5, height);
    path.lineTo(0, height * 0.75);
    path.lineTo(0, height * 0.25);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}