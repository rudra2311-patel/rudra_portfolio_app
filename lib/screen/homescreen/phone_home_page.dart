import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // NEW: Import the SVG package
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../consts/data.dart';
import '../../providers/current_state.dart';

class PhoneHomeScreen extends StatelessWidget {
  const PhoneHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);

    return Container(
      padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
      child: Column(
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.start,
            children: List.generate(
              apps.length,
              (index) => Container(
                margin: const EdgeInsets.only(
                  right: 10,
                  top: 10,
                  bottom: 20,
                  left: 10,
                ),
                child: Column(
                  children: [
                    AnimatedButton(
                      height: 45,
                      width: 45,
                      color: apps[index].color,
                      shadowDegree: ShadowDegree.dark,
                      onPressed: () {
                        if (apps[index].link != null) {
                          currentState.launchInBrowser(apps[index].link!);
                        } else if (apps[index].screen != null) {
                          currentState.changePhoneScreen(
                            apps[index].screen!,
                            false,
                            titlee: apps[index].title,
                          );
                        }
                      },
                      // This child property is now updated with the fix
                      child: Builder(builder: (context) {
                        final app = apps[index];
                        if (app.assetPath != null) {
                          // CORRECTION: Check if the path is an SVG
                          if (app.assetPath!.endsWith('.svg')) {
                            return SvgPicture.asset(
                              app.assetPath!,
                              width: 25,
                              height: 25,
                            );
                          } else {
                            // Otherwise, use the standard Image.asset
                            return Image.asset(
                              app.assetPath!,
                              width: 25,
                              height: 25,
                            );
                          }
                        } else {
                          // Fallback for standard icons
                          return Icon(
                            app.icon,
                            size: 25,
                            color: Colors.black,
                          );
                        }
                      }),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 60,
                      child: Center(
                        child: Text(
                          apps[index].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.openSans(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
