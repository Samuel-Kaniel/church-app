import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData? icon;
  final String? imagePath;
  final String? route;
  final Color? textColor;
  final VoidCallback? onTap;

  MenuItem({
    required this.title,
    this.icon,
    this.imagePath,
    this.route,
    this.textColor,
    this.onTap,
  });
}
