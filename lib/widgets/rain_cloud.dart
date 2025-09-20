import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class Rain extends StatefulWidget {
  const Rain({super.key, required this.top, required this.oposite});
  final double top;
  final bool oposite;

  @override
  State<Rain> createState() => _RainState();
}

class _RainState extends State<Rain> with SingleTickerProviderStateMixin {
  SMIInput<bool>? rain;
  SMIInput<bool>? hover;
  Artboard? waterArtBoard;

  late AnimationController _controller;
  late Animation<double> _animation;

  void playRain() {
    if (rain?.value == false) {
      rain?.value = true;
    } else if (rain?.value == true) {
      rain?.value = false;
    }
  }

  @override
  void initState() {
    super.initState();

    /// rive setup
    rootBundle.load('assets/rive/rain.riv').then((data) {
      final file = RiveFile.import(data);
      final artBoard = file.mainArtboard;
      var controller =
          StateMachineController.fromArtboard(artBoard, 'State Machine 1');

      if (controller != null) {
        artBoard.addController(controller);
        rain = controller.findInput('isPressed');
        hover = controller.findInput('isHover');
        rain?.value = false;
        hover?.value = false;
      }
      setState(() {
        waterArtBoard = artBoard;
      });
    });

    /// cloud drifting animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20), // adjust speed here ⬅️
    )..repeat(reverse: true); // loop back & forth

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear, // constant speed drift
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        double start = widget.oposite ? size.width - 150 : 0.0;
        double end = widget.oposite ? 0.0 : size.width - 150;
        double position = start + (end - start) * _animation.value;

        return Positioned(
          top: widget.top,
          right: position,
          child: MouseRegion(
            onEnter: (_) => hover?.value = true,
            onExit: (_) => hover?.value = false,
            child: GestureDetector(
              onTap: () => playRain(),
              child: SizedBox(
                height: 100,
                width: 220,
                child: waterArtBoard != null
                    ? Rive(
                        useArtboardSize: true,
                        artboard: waterArtBoard!,
                        fit: BoxFit.cover,
                      )
                    : Container(),
              ),
            ),
          ),
        );
      },
    );
  }
}
