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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      endDrawer: NavDrawer(),
      body: Row(
        children: [
          MediaQuery.of(context).size.height >= 600 && MediaQuery.of(context).size.width >= 700 ? LeftSideBar() : SizedBox(width: 0,),
          CenterSection(),
          MediaQuery.of(context).size.height >= 600 && MediaQuery.of(context).size.width >= 700 ? RightSideBar() : SizedBox(width: 0,),
        ],
      ),
      backgroundColor: ThemeColors.navy,
    );
  }
}