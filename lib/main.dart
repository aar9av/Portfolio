import 'package:flutter/material.dart';
import 'package:portfolio/ThemeColors.dart';
import 'CenterSection.dart';
import 'NavBar.dart';
import 'SideBar.dart';

void main() {
  runApp(Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arnav Gupta',
      theme: ThemeData(
        primaryColor: ThemeColors.lightNavy,
      ),
      home: PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(scrollController: _scrollController, aboutKey: _aboutKey, skillsKey: _skillsKey, projectsKey: _projectsKey, experienceKey: _experienceKey, contactKey: _contactKey),
      endDrawer: NavDrawer(scrollController: _scrollController, aboutKey: _aboutKey, skillsKey: _skillsKey, projectsKey: _projectsKey, experienceKey: _experienceKey, contactKey: _contactKey),
      body: Row(
        children: [
          MediaQuery.of(context).size.height >= 600 && MediaQuery.of(context).size.width >= 1000 ? LeftSideBar() : SizedBox(width: 0,),
          CenterSection(scrollController: _scrollController, aboutKey: _aboutKey, skillsKey: _skillsKey, projectsKey: _projectsKey, experienceKey: _experienceKey, contactKey: _contactKey),
          MediaQuery.of(context).size.height >= 600 && MediaQuery.of(context).size.width >= 1000 ? RightSideBar() : SizedBox(width: 0,),
        ],
      ),
      backgroundColor: ThemeColors.navy,
    );
  }
}