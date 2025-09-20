import 'package:flutter/material.dart';

class AppModel {
  final String title;
  final Color color;
  final IconData? icon; // for flutter/material/fontawesome icons
  final String? assetPath; // for svg/png icons
  final Widget? screen; // if it opens a screen
  final String? link; // if it opens a link

  AppModel({
    required this.title,
    required this.color,
    this.icon,
    this.assetPath,
    this.screen,
    this.link,
  });
}
