// lib/widgets/rive_avatar.dart
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveAvatar extends StatefulWidget {
  const RiveAvatar({super.key});

  @override
  State<RiveAvatar> createState() => _RiveAvatarState();
}

class _RiveAvatarState extends State<RiveAvatar> {
  // This will hold the 'isHover' boolean from your Rive state machine
  SMIBool? _isHovered;

  void _onRiveInit(Artboard artboard) {
    // Find the state machine you created in Rive (it might be named 'Animation' or 'State Machine 1')
    final controller =
        StateMachineController.fromArtboard(artboard, 'Animation');
    if (controller != null) {
      artboard.addController(controller);
      // Find the boolean input you created in Rive
      _isHovered = controller.findInput<bool>('isHover') as SMIBool?;
      // Set the initial state to not hovered
      _isHovered?.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // When the mouse enters, tell Rive to activate the hover state
      onEnter: (_) => _isHovered?.value = true,
      // When the mouse exits, tell Rive to return to the idle state
      onExit: (_) => _isHovered?.value = false,
      child: RiveAnimation.asset(
        // IMPORTANT: Replace this with the actual path to your new Rive file
        'assets/rive/diyuuu.riv',
        onInit: _onRiveInit,
   fit: BoxFit.fill, 
  // Tell Rive the animation is contained within a specific area
  alignment: Alignment.center,
      ),
    );
  }
}
