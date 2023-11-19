import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FemaleCameraScreen extends StatelessWidget {
  const FemaleCameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FemaleCameraController());
    return GetBuilder<FemaleCameraController>(
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

class FemaleCameraController extends GetxController {
  // late CameraController cameraController;
  List<String> hairStylesList = [
    "assets/images/girl_brown.png",
    "assets/images/girl_short.png",
    "assets/images/girl_straight.png",
  ];
  String selectedImage = '';

  // @override
  // onInit() {
  //   asynFunc();
  //   super.onInit();
  // }

  // asynFunc() async {
  //   print("async");
  //   await initializeCamera();
  // }

  // Future<void> initializeCamera() async {
  //   try {
  //     WidgetsFlutterBinding.ensureInitialized();
  //     // cameras = await availableCameras();
  //     final cameras = await availableCameras();
  //     cameraController = CameraController(
  //       cameras[0], // Use the first available camera
  //       ResolutionPreset.medium,
  //     );

  //     await cameraController.initialize().then((value) {
  //       return print("RESULT");
  //     }); // Use the non-null assertion operator (!) since cameraController is now nullable
  //   } catch (e) {
  //     print('Error initializing camera: $e');
  //   }
  // }

  // @override
  // void onClose() {
  //   cameraController.dispose();
  //   super.onClose();
  // }
}
