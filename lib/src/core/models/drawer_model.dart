import 'package:flutter/material.dart';

class DrawerModel {
  final String text;
  final String svgPath;
  final IconData? data;
  final String? navPath;
  final Widget? trailing;
  DrawerModel({
    required this.text,
    required this.svgPath,
    this.data,
    this.navPath = '',
    this.trailing,
  });
}
