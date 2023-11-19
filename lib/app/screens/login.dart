import 'package:barberapp/app/res/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../res/widgets/show_ok_dialog.dart';
import 'main_screen.dart';
import 'signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Form(
            key: controller.loginFormKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * .05),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Hairstyle Augmentation",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: Get.height * .1),
                TextFormField(
                  controller: controller.emialController,
                  decoration: const InputDecoration(
                    hintText: "Enter Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (!value.isEmail) {
                      return 'Please enter correct email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: Get.height * .03),
                TextFormField(
                  controller: controller.passwordController,
                  decoration: const InputDecoration(
                    hintText: "Enter Password",
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Plese Enter Your Password Here";
                    }
                    if (value.length < 8) {
                      return "Please Enter Password with 8 Characters";
                    }

                    return null;
                  },
                ),
                SizedBox(height: Get.height * .03),
                Row(
                  children: [
                    TextButton(
                      onPressed: () => Get.to(() => const SignUpScreen()),
                      child: const Text(
                        "Resgister Now",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forget Password",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * .03),
                SizedBox(
                  width: double.infinity,
                  child: AppButton(
                    onPressed: () {
                      if (!controller.loginFormKey.currentState!.validate()) {
                        return;
                      }
                      CallOkDialog.showOSDialog(
                        message: "Congratulations You are Login",
                        onTapOk: () {
                          Get.back();
                          Get.offAll(() => const MainScreen());
                        },
                      );
                    },
                    text: "Login",
                  ),
                ),
                SizedBox(height: Get.height * .03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.black,
                      height: 1.5,
                      width: Get.width * .25,
                    ),
                    const Text(
                      "Log in with",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                    Container(
                      color: Colors.black,
                      height: 1.5,
                      width: Get.width * .25,
                    ),
                  ],
                ),
                SizedBox(height: Get.height * .03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/google_icon.svg",
                        width: Get.width * .1),
                    const SizedBox(width: 10),
                    const Text(
                      "Google",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginController extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emialController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    emialController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
