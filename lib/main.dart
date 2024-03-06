import 'package:flutter/material.dart';
import 'package:hotel_app/pages/bottom_nav_bar.dart';
import 'package:hotel_app/pages/home_page/home_page.dart';
import 'package:hotel_app/pages/intro_pages/intro_page.dart';
import 'package:hotel_app/pages/my_list_page/my_list_page.dart';
import 'package:hotel_app/pages/order_page/order_page.dart';
import 'package:hotel_app/pages/profile_page/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const IntroPage(),
      routes: {
        BottomNavBar.id: (context) => const BottomNavBar(),
        HomePage.id: (context) => const HomePage(),
        OrderPage.id: (context) => const OrderPage(),
        MyListPage.id: (context) => const MyListPage(),
        ProfilePage.id: (context) => const ProfilePage(),
      },
    );
  }
}
