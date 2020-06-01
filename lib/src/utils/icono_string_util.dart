import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  "add_alert": Icons.add_alert,
  "accessibility": Icons.accessibility_new,
  "folder_open": Icons.folder_open,
  "donut_large": Icons.donut_large,
  "inputs": Icons.input,
  "checks": Icons.tune,
  "list": Icons.list
};

Icon getIcon(String iconName) {
  return Icon(_icons[iconName], color: Colors.blue);
}
