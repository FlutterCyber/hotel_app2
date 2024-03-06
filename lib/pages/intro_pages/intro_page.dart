import 'package:flutter/material.dart';
import 'package:hotel_app/pages/bottom_nav_bar.dart';
import 'package:hotel_app/pages/home_page/home_page.dart';
import 'package:hotel_app/pages/intro_pages/intro_page_screen.dart';
import 'package:hotel_app/pages/intro_pages/intro_page_strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController? _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, BottomNavBar.id);
                    },
                    child: Container(
                      height: 40,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green.shade50,
                      ),
                      child: const Center(
                          child: Text(
                        "Skip",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 500,
                child: PageView(
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  controller: _pageController!,
                  children: [
                    IntroPageScreen(
                        myTitle: title1,
                        myContext: context1,
                        imagePath: image1),
                    IntroPageScreen(
                        myTitle: title2,
                        myContext: context2,
                        imagePath: image2),
                    IntroPageScreen(
                        myTitle: title3,
                        myContext: context3,
                        imagePath: image3),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: _pageController!,
                count: 3,
                effect: const WormEffect(
                  dotHeight: 16,
                  dotWidth: 16,
                  type: WormType.thinUnderground,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.green,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (currentIndex != 2) {
                    _pageController!.jumpToPage(currentIndex + 1);
                  } else {
                    Navigator.pushReplacementNamed(context, BottomNavBar.id);
                  }
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      currentIndex != 2
                          ? "Continue".toUpperCase()
                          : "Get started".toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
