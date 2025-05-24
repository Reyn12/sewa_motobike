import 'package:course_motobike/widget/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Atur status bar biar iconnya item
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness:
            Brightness.dark, // <-- ini bikin icon jadi item
        statusBarBrightness: Brightness.light, // <-- ini buat iOS
        statusBarColor: Colors.transparent, // opsional, biar transparan
      ),
    );
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap(70),
          Image.asset("assets/logo_text.png", height: 38, width: 171),
          Gap(10),
          Text(
            'Drive & Be Happy!',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Color(0xff070632),
            ),
          ),
          Expanded(
            child: Transform.translate(
              offset: const Offset(-99, 0),
              child: Image.asset("assets/splash_screen.png"),
            ),
          ),
          Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'We provide all beautiful motorbike for your road trip and great memories of life.',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.5,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff070632),
              ),
            ),
          ),
          Gap(50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ButtonPrimary(
              text: "Explore Now",
              onTap: () {
                Navigator.pushReplacementNamed(context, "/signup");
              },
            ),
          ),
          Gap(50),
        ],
      ),
    );
  }
}
