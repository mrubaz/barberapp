import 'package:barberapp/app/res/widgets/custom_button.dart';
import 'package:barberapp/app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: Get.height * .1),
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(
              Icons.person_3,
              size: 100,
            ),
          ),
          SizedBox(height: Get.height * .05, width: double.infinity),
          TextFormField(
            controller: TextEditingController(text: "Andrew Tate"),
            decoration: const InputDecoration(),
          ),
          SizedBox(height: Get.height * .03),
          TextFormField(
            controller: TextEditingController(text: "your@gmail.com"),
            decoration: const InputDecoration(),
          ),
          const Expanded(child: SizedBox()),
          Align(
            alignment: Alignment.centerRight,
            child: AppButton(
                onPressed: () {
                  Get.offAll(() => const LoginScreen());
                },
                text: "Logout"),
          ),
          SizedBox(height: Get.height * .05),
        ],
      ),
    );
  }
}
