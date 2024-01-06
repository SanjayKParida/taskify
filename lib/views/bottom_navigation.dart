import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/controller/bottom_navbar_controller.dart';
import 'package:taskify/views/Homecreen/home_page.dart';
import 'package:taskify/views/calendar_page.dart';
import 'package:taskify/views/user_profile.dart';
import 'package:iconly/iconly.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    //BOTTOM NAVIGATION BAR CONTROLLER
    BottomNavBarController bottomNavBarController =
        Get.put(BottomNavBarController());

    //LIST OF DIFFERENT PAGES
    final screens = [
      const HomePage(),
      const CalendarPage(),
      const UserProfilePage()
    ];

    return Scaffold(
        body: Obx(() => IndexedStack(
            index: bottomNavBarController.selectedIndex.value,
            children: screens)),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            selectedItemColor: const Color.fromARGB(255, 78, 128, 255),
            unselectedItemColor: Colors.grey.shade600,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (index) {
              bottomNavBarController.changeIndex(index);
            },
            currentIndex: bottomNavBarController.selectedIndex.value,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    IconlyBold.home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    IconlyBold.calendar,
                  ),
                  label: 'Calendar'),
              BottomNavigationBarItem(
                  icon: Icon(
                    IconlyBold.profile,
                  ),
                  label: 'Profile'),
            ],
          ),
        ));
  }
}
