import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  final AnimationController controller;

  const CircularProgress({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: controller.value,
      semanticsLabel: 'Circular progress indicator',
    );
  }
}
