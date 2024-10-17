import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'ThemeColors.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  bool isAll = false;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: ThemeColors.navy,
                child: Text(
                  "Things I've Build   ",
                  style: TextStyle(
                    color: ThemeColors.slate,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
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
          SizedBox(height: 80,),
          Project(idx: 0, name: 'Attend Ease', description: 'Developed an Android application to streamline attendance management with GPS-based tracking and Google Authentication for enhanced security, reducing manual intervention and improves accuracy.', tech: ['Flutter', 'Firebase', 'Google Maps'], github: 'https://github.com/aar9av/AttendEase', link: 'https://drive.google.com/file/d/1jfUL0Xv5gHm9CYl2gZ6E8HA0a_uD-n9y/view?usp=drive_link', image: 'AttendEase', color: Colors.indigoAccent),
          SizedBox(height: 80,),
          Project(idx: 1, name: 'Code Buddy', description: 'CodeBuddy is a platform that brings together three popular coding platforms - Leetcode, Codechef, and Codeforces - into a single hub. In this platform, users can conveniently view their submissions and contest summaries, as well as discover other users profiles.', tech: ['Flutter', 'My SQL', 'Web Scraping', 'Python'], github: 'https://github.com/aar9av/CodeBuddy', link: 'https://drive.google.com/file/d/1vbLtqYaq76j_pAND3tpDZYKlvnzOPv63/view?usp=sharing', image: 'CodeBuddy', color: Colors.green),
          SizedBox(height: isAll ? 80 : 0,),
          isAll ? Project(idx: 2, name: 'True Link', description: 'True Link is a dating platform that helps users with connect to someone special, allows anonymous public confessions without revealing their identity, and enables real time chatting.', tech: ['Flutter', 'Firebase', 'My SQL', 'Neon DB'], github: 'https://github.com/aar9av/True-Link', link: 'https://drive.google.com/file/d/1AoCahlonVRVbBRl2WXPtnoNWJj7rJHdH/view?usp=sharing', image: 'TrueLink', color: Colors.lightBlueAccent) : SizedBox(height: 0,),
          SizedBox(height: isAll ? 80 : 0,),
          isAll ? Project(idx: 3, name: 'Chess Game', description: 'A chess game with two modes: Play with AI (implemented using Google Gemini AI) for automated chess moves and two-player mode, incorporating features like moves validation, pawn promotion, castling, check warnings, and possible move indicators.', tech: ['Flutter' ,'Google Gemini AI'], github: 'https://github.com/aar9av/Sicillian_Defence', link: 'https://drive.google.com/file/d/18mOGOcrSlu1OQSTiRDC9mD9RQ1FOBpke/view?usp=sharing', image: 'Chess', color: Colors.orange) : SizedBox(height: 0,),
          SizedBox(height: isAll ? 80 : 0,),
          isAll ? Project(idx: 4, name: 'Portfolio', description: 'A portfolio website showcasing my skills in Flutter development, competitive coding, and project management. Includes detailed sections on academic projects, work experience, technical expertise, and personal achievements.', tech: ['Flutter', 'Figma'], github: 'https://github.com/aar9av/Portfolio', link: 'https://aar9av.github.io/', image: 'Portfolio', color: ThemeColors.slate) : SizedBox(height: 0,),
          SizedBox(height: 80,),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isAll = !isAll;
                });
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
                      isAll ? 'Show Less' : 'Show More',
                      style: TextStyle(
                        color: ThemeColors.green,
                        fontSize: isHovered ? 18 : 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 80,),
        ],
      ),
    );
  }
}

class Project extends StatefulWidget {
  final int idx;
  final String name;
  final String description;
  final List<String> tech;
  final String github;
  final String link;
  final String image;
  final Color color;

  const Project({super.key,
    required this.idx,
    required this.name,
    required this.description,
    required this.tech,
    required this.github,
    required this.link,
    required this.image,
    required this.color,
  });

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  bool isHovered = false;

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    String tech = "\n";
    for(int i=0; i<widget.tech.length; ++i) {
      tech += widget.tech[i];
      if(i != widget.tech.length - 1) {
        tech += "  |  ";
      }
    }

    return MediaQuery.of(context).size.width >= 800 ? Center(
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Stack(
            children: [
              ImagesSection(idx: widget.idx, image: widget.image, color: widget.color, isHovered: isHovered, chk: false,),
              Column(
                crossAxisAlignment: widget.idx % 2 == 0 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      color: widget.color,
                      fontSize: isHovered ? 34 : 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      color: ThemeColors.lightestNavy,
                      boxShadow: isHovered ? [
                        BoxShadow(
                          color: widget.color,
                          blurRadius: 5,
                          spreadRadius: 0,
                          offset: Offset(widget.idx % 2 == 0 ? -2 : 2, 4),
                        ),
                      ] : [],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SingleChildScrollView(
                        child: Text(
                          widget.description,
                          style: TextStyle(
                            color: ThemeColors.slate,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    tech,
                    style: TextStyle(
                      color: widget.color,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: widget.idx % 2 == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
                    children: [
                      Tooltip(
                        message: 'Source Code',
                        child: GestureDetector(
                          onTap: () {
                            _launchURL(widget.github);
                          },
                          child: Image.asset(
                            'GitHub.png',
                            height: 24,
                            width: 24,
                            color: ThemeColors.slate,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Tooltip(
                        message: 'Project Link',
                        child: GestureDetector(
                          onTap: () {
                            _launchURL(widget.link);
                          },
                          child: Image.asset(
                            'Link.png',
                            height: 24,
                            width: 24,
                            color: ThemeColors.slate,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ) :
    Column(
      crossAxisAlignment: widget.idx % 2 == 0 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Text(
          widget.name,
          style: TextStyle(
            color: widget.color,
            fontSize: isHovered ? 34 : 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.55,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: widget.idx % 2 == 0 ? null : 0,
                left: widget.idx % 2 == 0 ? 0 : null,
                child: ImagesSection(idx: widget.idx+1, image: widget.image, color: widget.color, isHovered: true, chk: true,),
              ),
              Positioned(
                top: MediaQuery.of(context).size.width * 0.3,
                right: widget.idx % 2 == 0 ? null : 20,
                left: widget.idx % 2 == 0 ? 20 : null,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: ThemeColors.lightestNavy,
                    boxShadow: [
                      BoxShadow(
                        color: widget.color,
                        blurRadius: 5,
                        spreadRadius: 0,
                        offset: Offset(widget.idx % 2 == 0 ? -2 : 2, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SingleChildScrollView(
                      child: Text(
                        widget.description,
                        style: TextStyle(
                          color: ThemeColors.slate,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          tech,
          style: TextStyle(
            color: widget.color,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: widget.idx % 2 == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            Tooltip(
              message: 'Source Code',
              child: GestureDetector(
                onTap: () {
                  _launchURL(widget.github);
                },
                child: Image.asset(
                  'GitHub.png',
                  height: 24,
                  width: 24,
                  color: ThemeColors.slate,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Tooltip(
              message: 'Project Link',
              child: GestureDetector(
                onTap: () {
                  _launchURL(widget.link);
                },
                child: Image.asset(
                  'Link.png',
                  height: 24,
                  width: 24,
                  color: ThemeColors.slate,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ImagesSection extends StatefulWidget {
  final int idx;
  final String image;
  final Color color;
  final bool isHovered;
  final bool chk;

  const ImagesSection({super.key, required this.idx, required this.image, required this.color, required this.isHovered, required this.chk});

  @override
  State<ImagesSection> createState() => _ImagesSectionState();
}

class _ImagesSectionState extends State<ImagesSection> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.idx % 2 == 0 ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        width: widget.chk ? MediaQuery.of(context).size.width * 0.8 : MediaQuery.of(context).size.width * 0.4,
        height: widget.chk ? MediaQuery.of(context).size.width * 0.4 : MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  widget.color.withOpacity(0.2),
                  widget.color.withOpacity(1),
                ]
            )
        ),
        child: Stack(
          children: [
            widget.image == 'Portfolio' ?
            Image.asset(
              'Portfolio.png',
              fit: BoxFit.cover,
            ) :
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    '${widget.image}-1.jpg',
                  ),
                  Image.asset(
                    '${widget.image}-2.jpg',
                  ),
                  Image.asset(
                    '${widget.image}-3.jpg',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            widget.isHovered ? Container(height: 0,) :
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.2,
              color: ThemeColors.navy.withOpacity(0.9),
              child: Center(
                child: Image.asset(
                  widget.image == 'Portfolio' ? 'Logo.png' : '${widget.image}.png',
                  width: MediaQuery.of(context).size.width * 0.1,
                  color: widget.image == 'Portfolio' ? ThemeColors.white : null,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


