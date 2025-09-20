import 'package:animated_button/animated_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/consts/data.dart';
import 'package:portfolio_app/providers/current_state.dart';
import 'package:portfolio_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/frosted_container.dart';
import '../../widgets/rain_cloud.dart';
import 'phone_screen_wrapper.dart';

/// HomePage widget that implements the layered 3D Parallax Portfolio UI.
/// Updated to include:
/// 1. Static zone for the phone (no rotation applied).
/// 2. Restored static tilt for side panels with added dynamic parallax.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context, listen: false);
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);
    Size size = MediaQuery.of(context).size;

    // Ratios for scaling relative to base size
    theme.size = MediaQuery.of(context).size;
    theme.widthRatio = theme.size.width / baseWidth;
    theme.heightRatio = theme.size.height / baseHeight;

    // Mobile breakpoint
    bool phone = size.width < 800;

    return MouseRegion(
      onHover: (event) {
        final double x = (event.position.dx / size.width) * 2 - 1;
        final double y = (event.position.dy / size.height) * 2 - 1;
        currentState.updateMousePosition(Offset(x, y));
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            // ===========================
            // Layer 1: Background
            // ===========================
            Consumer<CurrentState>(
              builder: (context, state, child) {
                final dx = state.mousePosition.dx;
                final dy = state.mousePosition.dy;
                final rotationY = (dx * dx.abs()) * 0.05;
                final rotationX = -(dy * dy.abs()) * 0.05;
                return Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(rotationX)
                    ..rotateY(rotationY),
                  child: child,
                );
              },
              child: Stack(
                children: [
                  Selector<CurrentState, Gradient>(
                    selector: (context, provider) => provider.bgGradient,
                    builder: (context, _, __) {
                      return Container(
                        decoration:
                            BoxDecoration(gradient: currentState.bgGradient),
                      );
                    },
                  ),
                  size.height > 600
                      ? const Rain(oposite: false, top: 300)
                      : Container(),
                  Selector<CurrentState, String>(
                    selector: (context, provider) => provider.selectedCloud,
                    builder: (context, _, __) {
                      return SvgPicture.asset(
                        currentState.selectedCloud,
                        height: size.height,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  size.height > 600
                      ? const Rain(oposite: true, top: 50)
                      : Container(),
                ],
              ),
            ),

            // ===========================
            // Layer 2: Foreground Content
            // ===========================
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // =====================================
                    // LEFT SIDE FROSTED CONTAINERS
                    // =====================================
                    Consumer<CurrentState>(
                      builder: (context, state, child) {
                        final dx = state.mousePosition.dx;
                        final dy = state.mousePosition.dy;

                        // Restored static tilt for left panel
                        const baseRotationY = -0.25; // original inward tilt
                        const baseRotationX = 0.05;

                        // Add subtle dynamic rotation on top
                        final dynamicRotationY = (dx * dx.abs()) * 0.1;
                        final dynamicRotationX = -(dy * dy.abs()) * 0.1;

                        return Transform(
                          alignment: FractionalOffset.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateX(baseRotationX + dynamicRotationX)
                            ..rotateY(baseRotationY + dynamicRotationY),
                          child: child,
                        );
                      },
                      child: phone
                          ? Container()
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FrostedWidget(
                                  childW: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: AutoSizeText(
                                          'RuDraPatel',
                                          style: GoogleFonts.exo(
                                            fontSize: 35,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxFontSize: 35,
                                          minFontSize: 15,
                                          maxLines: 1,
                                        ).animate().fadeIn(
                                            delay: .8.seconds,
                                            duration: .7.seconds),
                                      ),
                                    ),
                                  ),
                                  height: 395 * theme.heightRatio,
                                  width: 247.5 * theme.widthRatio,
                                ),
                                FrostedWidget(
                                  onPressed: () {
                                    currentState.launchInBrowser(leetcode);
                                  },
                                  childW: Center(
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/icons/topMate.png",
                                            width: 50 *
                                                theme.widthRatio *
                                                theme.heightRatio,
                                            height: 50 *
                                                theme.widthRatio *
                                                theme.heightRatio,
                                          ),
                                          SizedBox(
                                            height: 10 * theme.heightRatio,
                                          ),
                                          Flexible(
                                            child: AutoSizeText(
                                              "Let's connect!",
                                              style: GoogleFonts.exo(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 28 *
                                                    theme.widthRatio *
                                                    theme.heightRatio,
                                              ),
                                              textAlign: TextAlign.center,
                                              maxFontSize: 28,
                                              minFontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ).animate().fadeIn(
                                          delay: 1.seconds,
                                          duration: .7.seconds),
                                    ),
                                  ),
                                  height: 175.5 * theme.heightRatio,
                                  width: 245 * theme.widthRatio,
                                ),
                              ],
                            )
                              .animate()
                              .fadeIn(
                                  delay: 500.ms,
                                  duration: 600.ms,
                                  curve: Curves.easeOut)
                              .slideX(
                                  begin: -0.5,
                                  duration: 600.ms,
                                  curve: Curves.easeOut),
                    ),

                    // =====================================
                    // MAIN PHONE (STATIC ZONE)
                    // =====================================
                    // The phone no longer rotates with the mouse
                    SizedBox(
                      height: size.height - 100,
                      child: Consumer<CurrentState>(
                        builder: (context, _, __) {
                          return DeviceFrame(
                            device: currentState.currentDevice,
                            screen: Container(
                              decoration: BoxDecoration(
                                  gradient: currentState.bgGradient),
                              child: ScreenWrapper(
                                childG: currentState.currentScreen,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms, curve: Curves.easeOut)
                        .slideY(
                            begin: 0.2,
                            duration: 600.ms,
                            curve: Curves.easeOut),

                    // =====================================
                    // RIGHT SIDE FROSTED CONTAINERS
                    // =====================================
                    Consumer<CurrentState>(
                      builder: (context, state, child) {
                        final dx = state.mousePosition.dx;
                        final dy = state.mousePosition.dy;

                        // Restored static tilt for right panel
                        const baseRotationY = 0.25; // original inward tilt
                        const baseRotationX = 0.05;

                        // Add subtle dynamic rotation on top
                        final dynamicRotationY = (dx * dx.abs()) * 0.1;
                        final dynamicRotationX = -(dy * dy.abs()) * 0.1;

                        return Transform(
                          alignment: FractionalOffset.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateX(baseRotationX + dynamicRotationX)
                            ..rotateY(baseRotationY + dynamicRotationY),
                          child: child,
                        );
                      },
                      child: phone
                          ? Container()
                          : Column(
                              children: [
                                FrostedWidget(
                                  height: 395 * theme.heightRatio,
                                  width: 247.5 * theme.widthRatio,
                                  childW: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Wrap(
                                        children: [
                                          ...List.generate(
                                            colorPalette.length,
                                            (index) => Consumer<CurrentState>(
                                              builder: (context, _, __) {
                                                return AnimatedButton(
                                                  width: 50 * theme.widthRatio,
                                                  height: 50 * theme.widthRatio,
                                                  color:
                                                      colorPalette[index].color,
                                                  onPressed: () {
                                                    currentState
                                                        .changeGradient(index);
                                                  },
                                                  child: const SizedBox(),
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 0, bottom: 10),
                                  child: FrostedWidget(
                                    childW: Center(
                                      child: Container(
                                        margin: const EdgeInsets.all(10),
                                        padding: EdgeInsets.all(
                                            10 * theme.widthRatio),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AutoSizeText(
                                              '"Nothing in life is to be feared, it is only to be understood. Now is the time to understand more, so that we may fear less"',
                                              style: GoogleFonts.inter(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              maxFontSize: 25,
                                              minFontSize: 10,
                                              maxLines: 3,
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: AutoSizeText(
                                                '-Marie Curie',
                                                style: GoogleFonts.inter(
                                                  color: Colors.white
                                                      .withOpacity(0.6),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                maxFontSize: 12,
                                                minFontSize: 6,
                                                maxLines: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ).animate().fadeIn(
                                        delay: 1.seconds, duration: .7.seconds),
                                    height: 175.5 * theme.heightRatio,
                                    width: 245 * theme.widthRatio,
                                  ),
                                ),
                              ],
                            )
                              .animate()
                              .fadeIn(
                                  delay: 700.ms,
                                  duration: 600.ms,
                                  curve: Curves.easeOut)
                              .slideX(
                                  begin: 0.5,
                                  duration: 600.ms,
                                  curve: Curves.easeOut),
                    ),
                  ],
                ),

                SizedBox(height: 10 * theme.heightRatio),

                // ===========================
                // BOTTOM: DEVICE SWITCHER
                // ===========================
                Selector<CurrentState, DeviceInfo>(
                  selector: (context, p1) => p1.currentDevice,
                  builder: (context, _, __) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...List.generate(devices.length, (index) {
                          return AnimatedButton(
                            width: 37.5,
                            height: 37.5,
                            color: Colors.black,
                            onPressed: () {
                              currentState.changeSelectedDevice(
                                devices[index].device,
                              );
                            },
                            child: Center(
                              child: Icon(
                                devices[index].icon,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          );
                        }),
                      ],
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
