// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StyleCardWidget extends StatelessWidget {
  const StyleCardWidget({
    Key? key,
    required this.imagePath,
    this.isMainWidget = false,
    this.title,
    this.desc,
    this.onTapCamera,
    this.onTapHairStyle,
  }) : super(key: key);

  final String imagePath;
  final bool isMainWidget;
  final String? title;
  final String? desc;
  final VoidCallback? onTapCamera;
  final VoidCallback? onTapHairStyle;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      color: const Color(0xffd5d8df),
      margin: EdgeInsets.zero,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(width: 2.0),
      ),
      child: Column(
        children: [
          const SizedBox(height: 5),
          Expanded(
            child: InkWell(
              onTap: onTapHairStyle,
              child: Image.asset(
                imagePath,
                height: Get.height * .15,
              ),
            ),
          ),
          // const Expanded(child: SizedBox(height: 10)),
          isMainWidget == true
              ? const Offstage()
              : Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: onTapCamera,
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                ),
          isMainWidget == false
              ? const Offstage()
              : Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "long hair rough cutt",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "lates style",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
        ],
      ),
    );
  }
}
