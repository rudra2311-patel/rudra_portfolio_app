import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../consts/data.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xfff5f4e7),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // 👇 your photo here
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // subtle shadow
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white, // border color
                      child: CircleAvatar(
                        radius: 55, // inner photo
                        backgroundImage:
                            AssetImage("assets/icons/rudrapatel.png"),
                      ),
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Text(
                    "Hi, I am Rudra Patel",
                    style: GoogleFonts.openSans(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                Text(
                  introduction,
                  style: GoogleFonts.openSans(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ).animate().fadeIn(duration: const Duration(milliseconds: 500)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
