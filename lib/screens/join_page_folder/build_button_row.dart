import 'package:event_home/screens/custom_classes/slider_app.dart';
import 'package:flutter/material.dart';
import '../custom_classes/custom_button.dart';

class BuildButtonRow extends StatelessWidget {
  const BuildButtonRow({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 10),
        CustomButton(
          svgImagePath: 'assets/icons/Image 2.svg',
          buttonText: 'Photo',
          onPressed: () {
            //
          },
          screenWidth: screenWidth,
        ),
        CustomButton(
          svgImagePath: 'assets/icons/Budget.svg',
          buttonText: 'Expenditure',
          onPressed: () {
            //
          },
          screenWidth: screenWidth,
        ),
        CustomButton(
          svgImagePath: 'assets/icons/contribute.svg',
          buttonText: 'Contributigdfghjon',
          onPressed: () {
            print('Push');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SliderNew()),
            );
          },
          screenWidth: screenWidth,
        ),
      ],
    );
  }
}
