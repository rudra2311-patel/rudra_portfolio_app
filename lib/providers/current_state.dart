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

  final Map<String, GlobalKey> _keys = {};

  // NEW: Flag to track if we are in dark mode. Initialized to false.
  bool isDarkMode = false;

  // NEW: Define your universal dark theme assets
  final Gradient _darkGradient = const LinearGradient(
    colors: [Color(0xff0b0033), Color(0xff000000)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  final String _darkCloud =
      "assets/images/night_cloud.svg"; // Make sure this asset exists

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

  // UPDATED: This function now also sets dark mode to false
  void changeGradient(int index) {
    isDarkMode = false;
    selectedColor = index;
    bgGradient = colorPalette[index].gradient;
    selectedCloud = colorPalette[index].svgPath;
    notifyListeners();
  }

  // UPDATED: This function toggles the day/night theme
  void toggleTheme() {
    isDarkMode = !isDarkMode;

    if (isDarkMode) {
      // Switch to Night Mode
      bgGradient = _darkGradient;
      selectedCloud = _darkCloud;
    } else {
      // Switch back to the last selected color theme
      changeGradient(selectedColor);
    }

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
