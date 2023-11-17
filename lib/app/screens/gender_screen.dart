import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'female/female_home_screen.dart';
import 'male/male_home_screen.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: Get.height * .15),
        const Align(
          alignment: Alignment.center,
          child: Text(
            "Hi",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
        ),
        const Align(
          alignment: Alignment.center,
          child: Text(
            "Select Your Gender",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(height: Get.height * .15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => const MaleHomeScreen());
                  },
                  child: Image.asset(
                    "assets/images/male.jpg",
                    height: Get.height * .2,
                  ),
                ),
                const Text(
                  "Male",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Container(
                color: Colors.black,
                width: 3,
                height: Get.height * .2,
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => const FemaleHomeScreen());
                  },
                  child: Image.asset(
                    "assets/images/female.jpg",
                    height: Get.height * .2,
                  ),
                ),
                const Text(
                  "Female",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),
      ],
    ));
  }
}
