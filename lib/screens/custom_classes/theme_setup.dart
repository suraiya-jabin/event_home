import 'package:flutter/material.dart';

List<ThemeData> getThemes() {
  return [
    ThemeData(canvasColor: Colors.blue, cardColor: Colors.yellow),
    ThemeData(canvasColor: Colors.white, cardColor: Colors.green),
    ThemeData(canvasColor: Colors.purple, cardColor: Colors.green),
    ThemeData(canvasColor: Colors.black, cardColor: Colors.red),
    ThemeData(canvasColor: Colors.red, cardColor: Colors.blue),
  ];
}
