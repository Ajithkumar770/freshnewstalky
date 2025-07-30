import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshtalky/utils/constants/file_constant.dart';
import 'package:freshtalky/utils/constants/string_constant.dart';
import 'package:freshtalky/views/onboardscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? mytimer;
  @override
  void initState() {
    super.initState();
    mytimer = Timer(const Duration(seconds: 3), () {
      // After 2 seconds, navigate to the HomeScreen
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
    });
  }

  @override
  void dispose() {
    super.dispose();
    mytimer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background SVG image
          Positioned.fill(
            child: SvgPicture.asset(
              FileConstant.splashscreensvg,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SvgPicture.asset(
              FileConstant.logo,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 20, // Adjust the distance from the bottom as needed
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  StringConstant.appName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF2A2A2A),
                  ),
                ),
                const SizedBox(
                  width: 48,
                  child: Divider(
                    thickness: 1,
                    color: Color(0XFF292929),
                  ),
                ),
                const Text(
                  'Read Smart News | Anytime, Anywhere',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF2A2A2A),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
