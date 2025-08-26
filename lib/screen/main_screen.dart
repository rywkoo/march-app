import 'package:flutter/material.dart';
import 'package:test1/screen/home_screen.dart';
import 'package:test1/screen/notifications_screen.dart';
import 'package:test1/screen/settings_screen.dart';
import '../helper/style.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  late PageController _pageController;

  final List<Widget> screens = const [
    HomeScreen(),
    NotificationsScreen(),
    SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleColor.black,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: screens,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: StyleColor.filledBackground,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            backgroundColor: StyleColor.filledBackground,
            currentIndex: currentIndex,
            onTap: (index) {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            selectedItemColor: StyleColor.black,
            unselectedItemColor: StyleColor.secondary,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: 'Settings',
              ),
            ],
            showUnselectedLabels: true,
          ),
        ),
      ),
    );
  }
}
