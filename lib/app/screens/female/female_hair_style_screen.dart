import 'dart:io';

import 'package:barberapp/app/screens/female/female_camera_screen.dart';
import 'package:barberapp/app/screens/user_style_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../res/widgets/style_card_widget.dart';

class FemaleHairStyleScreen extends StatelessWidget {
  const FemaleHairStyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FemaleHairStyleController());
    return GetBuilder<FemaleHairStyleController>(
      builder: (_) {
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: StyleCardWidget(
                    imagePath: controller.hairStylesList.first,
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
                  itemCount: controller.hairStylesList
                      .length, // Set the number of containers to display
                  itemBuilder: (context, index) {
                    return StyleCardWidget(
                      imagePath: controller.hairStylesList[index],
                      onTapCamera: () {
                        Get.to(() => const FemaleCameraScreen());
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

class FemaleHairStyleController extends GetxController {
  ImagePicker imagePicker = ImagePicker();
  List<String> hairStylesList = [
    "assets/images/girl_brown.png",
    "assets/images/girl_short.png",
    "assets/images/girl_straight.png",
    "assets/images/girl_brown.png",
    "assets/images/girl_short.png",
    "assets/images/girl_straight.png",
    "assets/images/girl_brown.png",
    "assets/images/girl_short.png",
    "assets/images/girl_straight.png",
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
