// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isBackgroundGreen = true,
    this.isBorder = false,
    this.isTextGreen = true,
    this.isRadiusRound = false,
  }) : super(key: key);
  final void Function() onPressed;
  final String text;
  final bool isBackgroundGreen;
  final bool isBorder;
  final bool isTextGreen;
  final bool isRadiusRound;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)
            // isRadiusRound == false
            //     ? BorderRadius.circular(25.0)
            //     : BorderRadius.circular(8.0),
            ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.amber,
        ),
      ),
    );
  }
}
