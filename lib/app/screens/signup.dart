import 'package:barberapp/app/res/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/widgets/show_ok_dialog.dart';
import 'login.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SingUpController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Form(
            key: controller.signupFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * .05),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Hairstyle Augmentation",
                    style: TextStyle(fontSize: 20),
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
                    hintText: "Password (must be 6-5 characters)",
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.check_box_outline_blank
                          // Icons.check_box
                          ),
                    ),
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          text: 'I have read and agree to the ',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Terms of Service Privacy Policy',
                              style: const TextStyle(
                                  color: Colors.blueAccent, fontSize: 14),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => {},
                            ),
                          ],
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
                      if (!controller.signupFormKey.currentState!.validate()) {
                        return;
                      }
                      CallOkDialog.showOSDialog(
                        message: "Congratulations You are Resgister",
                        onTapOk: () {
                          Get.back();
                          Get.to(() => const LoginScreen());
                        },
                      );
                    },
                    text: "Register",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SingUpController extends GetxController {
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  TextEditingController emialController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void onClose() {
    emialController.dispose();
    passwordController.dispose();

    super.onClose();
  }
}
