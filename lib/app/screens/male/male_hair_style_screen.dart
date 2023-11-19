import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../res/widgets/style_card_widget.dart';
import '../user_style_data.dart';
import 'male_camera_screen.dart';

class MaleHairStyleScreen extends StatelessWidget {
  const MaleHairStyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MaleHairStyleController());
    return GetBuilder<MaleHairStyleController>(
      builder: (_) {
        return Column(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: StyleCardWidget(
                    imagePath: "assets/images/men_brown.png",
                    isMainWidget: true),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: controller.hairStylesList.length,
                  itemBuilder: (context, index) {
                    return StyleCardWidget(
                      imagePath: controller.hairStylesList[index],
                      onTapCamera: () {
                        Get.to(() => const MaleCameraScreen());
                      },
                      // controller.onTapCameraFunc(),
                      onTapHairStyle: () {
                        Get.to(() => const UserHairStyleList());
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class MaleHairStyleController extends GetxController {
  ImagePicker imagePicker = ImagePicker();

  List<String> hairStylesList = [
    "assets/images/men.png",
    "assets/images/men_curley.png",
    "assets/images/men_black.png",
    "assets/images/men.png",
    "assets/images/men_curley.png",
    "assets/images/men_black.png",
    "assets/images/men.png",
    "assets/images/men_curley.png",
    "assets/images/men_black.png",
  ];

  onTapCameraFunc() async {
    try {
      final XFile? pickedFile =
          await imagePicker.pickImage(source: ImageSource.camera);
      final File imageFile = File(pickedFile!.path);
      update();
      return imageFile;
    } catch (e) {
      return null;
    }
  }
}
