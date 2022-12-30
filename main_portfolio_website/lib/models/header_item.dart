import 'package:flutter/material.dart';

class NameOnTap {
  final String title;
  final IconData? iconData;
  final VoidCallback onTap;
  final bool? isDarkTheme;
  Color? color;

  NameOnTap({
    this.color,
    required this.title,
    required this.onTap,
    this.iconData,
    this.isDarkTheme,
  });
}
