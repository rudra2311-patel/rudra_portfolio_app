import 'package:flutter/material.dart';
import 'package:portfolio_app/consts/data.dart';

class ThemeProvider extends ChangeNotifier {
  late BuildContext context;
  late Size size;
  late double heightRatio = size.height / baseHeight;
  late double widthRatio = size.width / baseWidth;
}
