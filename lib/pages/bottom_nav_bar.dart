import 'package:flutter/material.dart';
import 'package:hotel_app/pages/home_page/home_page.dart';
import 'package:hotel_app/pages/my_list_page/my_list_page.dart';
import 'package:hotel_app/pages/order_page/order_page.dart';
import 'package:hotel_app/pages/profile_page/profile_page.dart';
import 'package:iconly/iconly.dart';

class BottomNavBar extends StatefulWidget {
  static const String id = "bottom_nav_bar";

  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController? _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          HomePage(),
          OrderPage(),
          MyListPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(
            () {
              _currentIndex = index;
              _pageController!.animateToPage(
                index,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
              );
            },
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              IconlyBold.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconlyBold.document,
            ),
            label: "Order",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconlyBold.bookmark,
            ),
            label: "My List",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconlyBold.profile,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
