import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String? imagePath;
  final String route;

  MenuItem({
    required this.title,
    required this.icon,
    this.imagePath,
    required this.route,
  });
}
