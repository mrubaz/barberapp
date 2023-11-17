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
    this.onTap,
  }) : super(key: key);

  final String imagePath;
  final bool isMainWidget;
  final String? title;
  final String? desc;
  final VoidCallback? onTap;

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
          Image.asset(
            imagePath,
            height: Get.height * .15,
          ),
          const SizedBox(height: 10),
          isMainWidget == true
              ? const Offstage()
              : Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: onTap,
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                ),
          isMainWidget == false
              ? const Offstage()
              : const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "long hair rough cutt",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
          isMainWidget == false ? const Offstage() : const SizedBox(height: 5),
          isMainWidget == false
              ? const Offstage()
              : Padding(
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
          isMainWidget == false ? const Offstage() : const SizedBox(height: 15),
        ],
      ),
    );
  }
}
