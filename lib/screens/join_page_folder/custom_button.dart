import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  final String svgImagePath;
  final String buttonText;
  final VoidCallback onPressed;
  final double screenWidth;

  const CustomButton({
    super.key,
    required this.svgImagePath,
    required this.buttonText,
    required this.onPressed,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.zero,
        // shadowColor: Colors.black45,
      ),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          // gradient: const LinearGradient(
          //   colors: [
          //     Color(0x00f2f3f2),
          //     Color(0x00f9f9f8),
          //   ],
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgImagePath,
                // height: screenWidth * 0.05,
                // width: screenWidth * 0.1,
              ),
              const SizedBox(
                width: 8,
                height: 8,
              ),
              Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
