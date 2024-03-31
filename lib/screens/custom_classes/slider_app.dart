import 'package:flutter/material.dart';

class SliderNew extends StatefulWidget {
  const SliderNew({super.key});

  @override
  State<SliderNew> createState() => _SliderNewState();
}

class _SliderNewState extends State<SliderNew> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider')),
      body: Slider(
        value: _currentSliderValue,
        max: 100,
        divisions: 5,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
      ),
    );
  }
}
