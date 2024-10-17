import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'ThemeColors.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  List<String> images = [
    'SIH1.jpg',
    'SIH2.jpg',
    'SIH3.jpg',
    'SIH4.jpg',
    'SIH5.jpg',
    'SIH6.jpg',
  ];

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    _autoScroll();
  }

  void _autoScroll() {
    Future.delayed(Duration(seconds: 3), () {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _controller.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
      _autoScroll();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                  "Smart India Hackathon   ",
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
              ),
            ],
          ),
          SizedBox(height: 80,),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.width * 0.3,
              width: MediaQuery.of(context).size.width * 0.6,
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: SmoothPageIndicator(
              controller: _controller,
              count: images.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.blue,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
          ),
          SizedBox(height: 40,),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'In the Smart India Hackathon, our team worked on a project under the Ministry of Communication called "Dak Ghar Niryat Kendra." We created a platform to help small traders and artisans showcase and sell their products to buyers around the world using India’s postal services. This made it easier and cheaper for them to manage international deliveries. We spent a lot of time researching and working together to solve the challenges these traders face. Our platform was designed to be simple and useful for many people.\n\nAmong all the teams, we were the only ones to qualify through both the internal and idea selection rounds. This gave us the chance to compete as one of the top 5 finalists in the SIH Grand Finale. It was an amazing experience, helping us bring attention to Indian artisans and their work on a global level.',
                    style: TextStyle(
                      color: ThemeColors.slate,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 60,
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _launchURL('https://www.sih.gov.in/');
                          },
                          child: Tooltip(
                            message: 'SIH Official Website',
                            child: Image.asset(
                              'Link.png',
                              color: ThemeColors.slate,
                              height: 24,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchURL('https://docs.google.com/presentation/d/1DG185WlxIjpaNpD3nT2rBmfjfXARH2Pd/edit?usp=sharing&ouid=111937548285814642712&rtpof=true&sd=true');
                          },
                          child: Tooltip(
                            message: 'Our SIH Presentation',
                            child: Image.asset(
                              'PPT.png',
                              color: ThemeColors.slate,
                              height: 24,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchURL('https://drive.google.com/file/d/1cvWsfQL2umoz_D-u6nW03tEHMsp4ERW-/view?usp=sharing');
                          },
                          child: Tooltip(
                            message: 'SIH Certificate',
                            child: Image.asset(
                              'Certificate.png',
                              color: ThemeColors.slate,
                              height: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'My Amazing Team & Mentors:',
                    style: TextStyle(
                      color: ThemeColors.green,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 20,),
                  TeamMember(name: 'Pappu Kumar Yadav (Mentor)', url: 'https://www.linkedin.com/in/pappu-kumar-yadav-abba8a75/'),
                  TeamMember(name: 'Ravi Dixit (Mentor)', url: 'https://www.linkedin.com/in/ravi-dixit-51101a79/'),
                  SizedBox(height: 20,),
                  TeamMember(name: 'Shantanu Kaushik (Team Leader)', url: 'https://www.linkedin.com/in/shantanu-kaushik-731258176/'),
                  TeamMember(name: 'Arnav Gupta', url: 'https://www.linkedin.com/in/aar9av/'),
                  TeamMember(name: 'Shivam Gupta', url: 'https://www.linkedin.com/in/shivamgupta34/'),
                  TeamMember(name: 'Neeraj Kumar Meena', url: 'https://www.linkedin.com/in/kumar-neeraj-2019/'),
                  TeamMember(name: 'Shreya Chaudhary', url: 'https://www.linkedin.com/in/shreya-chaudhary-44a2b6249/'),
                  TeamMember(name: 'Seema', url: 'https://www.linkedin.com/in/seema-saharan-54123624b/'),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class TeamMember extends StatelessWidget {
  final String name;
  final String url;

  const TeamMember({super.key, required this.name, required this.url});

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchURL();
      },
      child: Tooltip(
        message: url,
        child: Row(
          children: [
            Text(
              '  -  ',
              style: TextStyle(
                color: ThemeColors.green,
                fontSize: 18,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                color: ThemeColors.slate,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
