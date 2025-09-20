import 'dart:async'; // NEW: Import for the Timer
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // NEW: Import for Lottie animations
import 'package:portfolio_app/providers/current_state.dart';
import 'package:portfolio_app/providers/theme_provider.dart';
import 'package:portfolio_app/screen/homescreen/home_page.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

Future<void> main() async {
  // Your existing setup - no changes needed here
  WidgetsFlutterBinding.ensureInitialized();
  await RiveFile.initialize();
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    // Your MultiProvider setup is perfect and remains unchanged
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CurrentState()),
      ],
      // The MaterialApp is now wrapped in a Consumer to handle theme changes
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            // CHANGED: The app now starts with SplashScreen
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}

// NEW: The Splash Screen Widget
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // After 3 seconds, navigate to your HomePage
    Timer(const Duration(seconds: 3), () {
      // Use pushReplacement to prevent going back to the splash screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Using the Lottie animation from the asset folder
        child: Lottie.asset(
          'assets/cat_animation.json',
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
