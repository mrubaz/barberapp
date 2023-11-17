import 'package:barberapp/app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'male_hair_style_screen.dart';

class MaleHomeScreen extends StatelessWidget {
  const MaleHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MaleHomeScreenController());
    return GetBuilder<MaleHomeScreenController>(
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

class MaleHomeScreenController extends GetxController {
  int selectedWidget = 0;

  List<BottomNavigationBarItem> navigationBarItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Home"),
    const BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Profile'),
  ];

  List<Widget> screens = [
    const MaleHairStyleScreen(),
    const ProfileScreen(),
  ];
  void changePage(int index) {
    selectedWidget = index;
    update();
  }
}
