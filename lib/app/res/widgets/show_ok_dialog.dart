import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_button.dart';

// Call Dialog Function
class CallOkDialog {
  static Future showOSDialog({
    required String message,
    VoidCallback? onTapOk,
  }) async {
    await showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: OkDialog(
            message: message,
            onTapOk: onTapOk ?? () => Get.back(),
          ),
        );
      },
    );
  }
}

// Alert Dialog Widget
class OkDialog extends StatelessWidget {
  const OkDialog({
    super.key,
    required this.message,
    required this.onTapOk,
  });
  final String message;
  final VoidCallback onTapOk;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(message),
      titleTextStyle: const TextStyle(
          fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      contentTextStyle: const TextStyle(
        fontSize: 13,
        color: Colors.grey,
        overflow: TextOverflow.visible,
      ),
      actions: [
        AppButton(
          onPressed: onTapOk,
          text: "ok",
          isTextGreen: false,
          isRadiusRound: true,
        )
        // TextButton(
        //   onPressed: () => Get.back(),
        //   child: Text(
        //     "Ok",
        //     style: StyleRefer.poppinsRegular
        //         .copyWith(fontSize: 14, color: AppColors.greenColor),
        //   ),
        // ),
      ],
    );
  }
}
