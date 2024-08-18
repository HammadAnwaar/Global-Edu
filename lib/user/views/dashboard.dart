import 'package:flutter/material.dart';
import 'package:global_edu/constants/my_colors.dart';
import 'package:global_edu/user/views/main_pages/bottom_nav/chat.dart';
import 'package:global_edu/user/views/main_pages/bottom_nav/home_pages/home.dart';
import 'package:global_edu/user/views/main_pages/bottom_nav/profile/profile.dart';
import 'package:global_edu/user/views/main_pages/search.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int pageIndex = 0;
  final pages = [
    const HomePage(),
    const SearchPage(),
    const ChatPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          elevation: 0,
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: MyColors.black,
          backgroundColor: Colors.transparent,
          unselectedItemColor: MyColors.lblack,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "My Wishlist"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          onTap: (index) => setState(() => pageIndex = index),
        ),
      ),
    );
  }
}
