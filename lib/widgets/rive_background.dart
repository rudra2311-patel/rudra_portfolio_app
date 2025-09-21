// lib/widgets/rive_background.dart

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:provider/provider.dart';
import '../providers/current_state.dart';

// NOTE: The RiveThemeController class has been removed.

class RiveBackground extends StatefulWidget {
  // UPDATED: The constructor no longer requires a controller.
  const RiveBackground({super.key});

  @override
  State<RiveBackground> createState() => _RiveBackgroundState();
}

class _RiveBackgroundState extends State<RiveBackground> {
  SMIBool? _isNight;

  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    _isNight = controller.findInput<bool>('IsNight') as SMIBool;

    final currentState = Provider.of<CurrentState>(context, listen: false);

    _isNight?.value = currentState.isDarkMode;

    currentState.addListener(_onThemeChange);
  }

  void _onThemeChange() {
    final currentState = Provider.of<CurrentState>(context, listen: false);
    if (_isNight != null && _isNight!.value != currentState.isDarkMode) {
      _isNight!.value = currentState.isDarkMode;
    }
  }

  @override
  void dispose() {
    Provider.of<CurrentState>(context, listen: false)
        .removeListener(_onThemeChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      'assets/rive/patelrudra.riv',
      onInit: _onRiveInit,
      fit: BoxFit.cover,
    );
  }
}
