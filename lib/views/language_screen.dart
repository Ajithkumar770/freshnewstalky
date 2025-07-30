import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshtalky/utils/constants/color_constant.dart';
import 'package:freshtalky/utils/constants/file_constant.dart';
import 'package:freshtalky/utils/constants/string_constant.dart';
import 'package:freshtalky/utils/size_config.dart';
import 'package:freshtalky/views/category_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<String> languages = [
    "English",
    "தமிழ்",
    "ಕನ್ನಡ",
    "മലയാളം",
    "తెలుగు",
    "हिन्दी"
  ];

  String? selectedLanguageCode;
  Timer? mytimer;

  @override
  void dispose() {
    super.dispose();
    mytimer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    bool isOdd = languages.length % 2 != 0;
    int gridItemCount = languages.length;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          Positioned(child: SvgPicture.asset(FileConstant.logobg)),
          Positioned(
              top: 24.87,
              left: 25.96,
              child: SvgPicture.asset(
                FileConstant.logo,
                height: 52.9,
                width: 52.86,
              )),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  StringConstant.selectlanguage,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: blackColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  StringConstant.selectlanguage2,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: blackColor,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight / 3.2,
                      width: SizeConfig.screenWidth/1.1,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 0.0,
                          mainAxisSpacing: 0.0,
                          childAspectRatio: 3,
                        ),
                        itemCount: gridItemCount,
                        itemBuilder: (context, index) {
                          // if (isOdd && index != gridItemCount - 1) {
                            return buildLanguageCard(
                              languages[index],
                              languages[index],
                            );
                          // }
                        },
                      ),
                    ),
                    // Center(
                    //   child: buildLanguageCard(
                    //     languages.last,
                    //     languages.last,
                    //   ),
                    // )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLanguageCard(String language, String code) {
    bool isSelected = selectedLanguageCode == code;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguageCode = code;
          // isSelected = true;
          mytimer = Timer(const Duration(seconds: 1), () {
            // After 2 seconds, navigate to the HomeScreen
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CategoryScreen(
                          selectedlang: selectedLanguageCode,
                        )));
          });
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0.0,
        color: isSelected ? yellowCOlor : whiteColor,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: isSelected ? whiteColor : whiteColor,
                  borderRadius: BorderRadius.circular(
                      30), // Adjust the radius as needed
                ),
                child: Icon(Icons.circle,
                    size: 10, color: isSelected ? blackColor : whiteColor),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                language,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
