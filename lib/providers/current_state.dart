import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/consts/data.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screen/homescreen/phone_home_page.dart';

class CurrentState extends ChangeNotifier {
  DeviceInfo currentDevice = Devices.ios.iPhone13;
  String selectedCloud = "assets/images/cloudyBlue.svg";
  Gradient bgGradient = const LinearGradient(
    begin: Alignment.topLeft,
    colors: [Colors.blue, Colors.black45],
  );
  int selectedColor = 1;

  Offset _mousePosition = Offset.zero;

  Offset get mousePosition => _mousePosition;

  // NEW: A map to store GlobalKeys for your icons.
  // We use String as the key (e.g., 'about', 'skills')
  final Map<String, GlobalKey> _keys = {};

  // NEW: A method to get a key for a specific icon.
  // If a key doesn't exist, it creates one.
  GlobalKey getKey(String keyName) {
    if (!_keys.containsKey(keyName)) {
      _keys[keyName] = GlobalKey();
    }
    return _keys[keyName]!;
  }

  void updateMousePosition(Offset newPosition) {
    _mousePosition = newPosition;
    notifyListeners();
  }

  void changeSelectedDevice(DeviceInfo device) async {
    currentDevice = device;
    notifyListeners();
  }

  bool isMainScreen = true;
  String? title;

  Widget currentScreen = const PhoneHomeScreen();

  void changeGradient(int index) {
    selectedColor = index;
    bgGradient = colorPalette[index].gradient;
    selectedCloud = colorPalette[index].svgPath;
    notifyListeners();
  }

  Future<void> launchInBrowser(String link) async {
    Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      print('Could not launch $url');
    }
  }

  void changePhoneScreen(Widget change, bool isMain, {String? titlee}) {
    title = titlee;
    currentScreen = change;
    isMainScreen = isMain;
    notifyListeners();
  }
}
