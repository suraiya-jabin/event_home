import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CountryDropdownSearch extends StatelessWidget {
  final ValueChanged<String?>? onChanged;

  const CountryDropdownSearch({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<String>(
      isExpanded: true,
      // hint: const Text(
      //   'Select Country',
      //   style: TextStyle(
      //     fontSize: 14,
      //     color: Colors.black,
      //   ),
      // ),
      items: const [
        DropdownMenuItem(child: Text('Country 1'), value: 'Country 1'),
        DropdownMenuItem(child: Text('Country 2'), value: 'Country 2'),
        DropdownMenuItem(child: Text('Country 3'), value: 'Country 3'),
      ],
      onChanged: onChanged,
    );
  }
}
