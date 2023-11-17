import 'package:barberapp/app/screens/gender_screen.dart';
import 'package:barberapp/app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainScreenController());
    return GetBuilder<MainScreenController>(
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: controller.screens[controller.selectedWidget],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            items: controller.navigationBarItems,
            onTap: (index) => controller.changePage(index),
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.white,
          ),
        );
      },
    );
  }
}

class MainScreenController extends GetxController {
  int selectedWidget = 0;

  List<BottomNavigationBarItem> navigationBarItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Home"),
    const BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Profile'),
  ];

  List<Widget> screens = [
    const GenderScreen(),
    const ProfileScreen(),
  ];
  void changePage(int index) {
    selectedWidget = index;
    update();
  }
}
