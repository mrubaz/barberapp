import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MaleCameraScreen extends StatelessWidget {
  const MaleCameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MaleCameraController());
    return GetBuilder<MaleCameraController>(
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        controller.selectedImage.isEmpty
                            ? controller.hairStylesList.first
                            : controller.selectedImage,
                        width: 150,
                      ),
                      Container(
                        height: 180,
                        width: 180,
                        color: const Color(0xffd5d8df),
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          size: 100,
                        ),
                      ),
                      SizedBox(height: Get.height * .2),
                    ],
                  ),
                ),
                const VerticalDivider(),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.hairStylesList.length,
                      physics: const ScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.selectedImage =
                                controller.hairStylesList[index];
                            controller.update();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: const Color(0xffd5d8df),
                              ),
                              child: Center(
                                  child: Image.asset(
                                      controller.hairStylesList[index])),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MaleCameraController extends GetxController {
  List<String> hairStylesList = [
    "assets/images/men_brown.png",
    "assets/images/men.png",
    "assets/images/men_curley.png",
    "assets/images/men_black.png",
  ];
  String selectedImage = '';
}
