import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ai_agri/Authentication/auth.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      title: const Text(
        "Smart ai_agri",
        style: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
      ),
      logo: Image.asset('assets/cropTech.jfif'),
      logoWidth: 200,
      // backgroundColor: Colors.grey.shade400,
      showLoader: true,
      loadingTextPadding: const EdgeInsets.only(top: 8),
      loadingText: const Text("Loading..."),
      // navigator: const Home(),
      navigator: authPage(),
      durationInSeconds: 5,
      gradientBackground: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [
          0.1,
          0.4,
          0.6,
          0.9,
        ],
        colors: [
          Colors.greenAccent,
          Colors.orangeAccent,
          Colors.redAccent,
          Colors.indigoAccent,
        ],
      ),
    );
  }
}
