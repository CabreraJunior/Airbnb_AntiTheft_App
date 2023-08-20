import 'package:antitheft_app/utilities/constants.dart';
import 'package:antitheft_app/views/home.dart';
import 'package:antitheft_app/views/logout.dart';
import 'package:antitheft_app/views/notifications.dart';
import 'package:antitheft_app/views/settings.dart';
import 'package:antitheft_app/views/user.dart';
import 'package:flutter/material.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int index = 2;
  final screens = const [
    LogoutScreen(),
    SettingsScreen(),
    HomeScreen(),
    UserScreen(),
    NotificationsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            height: 55,
            backgroundColor: Constants().appColor,
            indicatorColor: Colors.white,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            child: NavigationBar(
                animationDuration: const Duration(seconds: 2),
                selectedIndex: index,
                onDestinationSelected: (index) {
                  setState(() {
                    this.index = index;
                  });
                },
                destinations: const [
                  NavigationDestination(
                      icon: Icon(
                        Icons.logout,
                        color: Colors.white,
                        size: 30,
                      ),
                      selectedIcon: Icon(Icons.logout, size: 30),
                      label: "Logout"),
                  NavigationDestination(
                      icon: Icon(Icons.link, color: Colors.white, size: 30),
                      selectedIcon: Icon(Icons.link, size: 30),
                      label: "Settings"),
                  NavigationDestination(
                      icon: Icon(Icons.home, color: Colors.white, size: 30),
                      selectedIcon: Icon(Icons.home, size: 30),
                      label: "Home"),
                  NavigationDestination(
                      icon: Icon(Icons.person, color: Colors.white, size: 30),
                      selectedIcon: Icon(Icons.person, size: 30),
                      label: "User"),
                  NavigationDestination(
                      icon: Icon(Icons.notifications,
                          color: Colors.white, size: 30),
                      selectedIcon: Icon(Icons.notifications, size: 30),
                      label: "Notifications")
                ]),
          ),
        ),
      ),
      body: screens[index],
    ));
  }
}
