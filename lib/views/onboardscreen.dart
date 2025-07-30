import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshtalky/utils/constants/color_constant.dart';
import 'package:freshtalky/utils/constants/file_constant.dart';
import 'package:freshtalky/utils/constants/string_constant.dart';
import 'package:freshtalky/utils/size_config.dart';
import 'package:freshtalky/utils/widgets/custom_style_button.dart';
import 'package:freshtalky/views/language_screen.dart';
import 'package:google_fonts/google_fonts.dart';

//---------Onboarding------------
const background = Color.fromARGB(255, 35, 35, 35);
// const background = Color.fromRGBO(52, 55, 80, 1);
const pageImageColor = Color.fromARGB(255, 212, 212, 212);
const pageTitleStyle = TextStyle(
  fontSize: 20.0,
  wordSpacing: 1,
  letterSpacing: 1.2,
  fontWeight: FontWeight.w900,
  color: Colors.white,
);
const pageInfoStyle = TextStyle(
  color: Colors.white,
  letterSpacing: 0.8,
  height: 1.6,
  fontSize: 14,
);

//---------Skip button-----------

const defaultSkipButtonColor = Color.fromARGB(255, 93, 93, 93);
const defaultSkipButtonBorderRadius = BorderRadius.all(Radius.circular(20.0));
const defaultSkipButtonPadding =
    EdgeInsets.symmetric(horizontal: 17.0, vertical: 5.0);
const defaultSkipButtonTextStyle =
    TextStyle(color: Colors.white, letterSpacing: 1.0);

//---------Signin button-----------

const signinButtonColor = Color.fromARGB(255, 158, 69, 69);
const signinButtonBorderRadius = BorderRadius.all(Radius.circular(20.0));
const signinButtonPadding =
    EdgeInsets.symmetric(horizontal: 17.0, vertical: 5.0);
const signinButtonTextStyle =
    TextStyle(color: Colors.white, letterSpacing: 1.0);

//--------Proceed Button---------

const defaultProceedButtonColor = Color.fromARGB(255, 88, 94, 147);
const defaultProceedButtonBorderRadius =
    BorderRadius.all(Radius.circular(20.0));
const defaultProceedButtonPadding =
    EdgeInsets.symmetric(horizontal: 17.0, vertical: 5.0);
const defaultProceedButtonTextStyle = TextStyle(
  color: Colors.white,
  letterSpacing: 1.0,
);

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({
    super.key,
  });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final activePainter = Paint();

  final inactivePainter = Paint();

  Material? materialButton;
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
    activePainter.color = yellowCOlor;
    activePainter.strokeWidth = 1;
    activePainter.strokeCap = StrokeCap.round;
    activePainter.style = PaintingStyle.fill;

    inactivePainter.color = Colors.white;
    inactivePainter.strokeWidth = 1;
    inactivePainter.strokeCap = StrokeCap.round;
    inactivePainter.style = PaintingStyle.fill;
  }

  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0; // Track current page index

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
    
      PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: [
            // Your onboarding pages here

            listWidget1(context),
            listWidget2(context),
            listWidget3(context),
          ]),
      // Indicator example (adjust as per your actual indicator implementation)
      Positioned(
        bottom: 60,
        left: SizeConfig.screenWidth * 0.42,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildIndicator(0, currentIndex),
            const SizedBox(width: 10),
            buildIndicator(1, currentIndex),
            const SizedBox(width: 10),
            buildIndicator(2, currentIndex),
          ],
        ),
      ),
    ]));
  }

  Widget buildIndicator(int pageIndex, int currentIndex) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: pageIndex == currentIndex ? yellowCOlor : whiteColor,
      ),
    );
  }
}

listWidget1(BuildContext context) {
  return Stack(
    children: [
      Positioned.fill(
        child: Image.asset(
          FileConstant.onboard1,
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
          bottom: 0,
          child: ClipRect(
              // <-- clips to the 200x200 [Container] below
              child: Container(
                  alignment: Alignment.center,
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight / 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade700.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container()))),
      Center(
          child: ClipRect(
              // <-- clips to the 200x200 [Container] below
              child: Container(
                  alignment: Alignment.center,
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container()))),
      Positioned(
        top: 88.66,
        left: 151.74,
        child: SvgPicture.asset(
          width: 70,
          height: 70,
          FileConstant.logo,
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
        top: 23,
        right: 20,
        child: SizedBox(
          width: SizeConfig.screenWidth * 0.25,
          height: SizeConfig.screenHeight * 0.04,
          // width: 83,
          // height: 32,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LanguageScreen()));
            },
            style: CustomButtonStyles.fillyellowA,
            child: Row(
              children: [
                Text(
                  "Skip ",
                  style: TextStyle(color: blackColor),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: blackColor,
                  size: 15,
                )
              ],
            ),
          ),
        ),
      ),
      Positioned(
        bottom: SizeConfig.screenHeight / 6.4,
        left: SizeConfig.screenWidth / 3.8,
        child: Text(StringConstant.onboard1headtext,
            style: GoogleFonts.inter(
              color: whiteColor,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
              fontSize: 24,
            )),
      ),
      Positioned(
        bottom: SizeConfig.screenHeight / 7.3,
        left: SizeConfig.screenWidth / 2.42,
        child: SizedBox(
            width: SizeConfig.screenWidth / 7,
            child: Divider(thickness: 3, color: whiteColor)),
      ),
      Positioned(
        bottom: SizeConfig.screenHeight / 10.2,
        left: SizeConfig.screenWidth / 5.6,
        child: Text(StringConstant.onboard1desctext,
            style: GoogleFonts.inter(
              color: whiteColor,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            )),
      ),
      Positioned(
        bottom: 10,
        right: 20,
        child: Text("Swipe left to view news",
            style: GoogleFonts.inter(
              color: greyColor,
              fontWeight: FontWeight.w400,
              fontSize: 10,
            )),
      )
    ],
  );
}

listWidget2(BuildContext context) {
  return Stack(
    children: [
      Positioned.fill(
        child: Image.asset(
          FileConstant.onboard2,
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
          bottom: 0,
          child: ClipRect(
              // <-- clips to the 200x200 [Container] below
              child: Container(
                  alignment: Alignment.center,
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight / 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade700.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container()))),
      Center(
          child: ClipRect(
              // <-- clips to the 200x200 [Container] below
              child: Container(
                  alignment: Alignment.center,
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container()))),
      Positioned(
        top: 88.66,
        left: 151.74,
        child: SvgPicture.asset(
          width: 70,
          height: 70,
          FileConstant.logo,
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
        top: 23,
        right: 20,
        child: SizedBox(
          width: SizeConfig.screenWidth * 0.25,
          height: SizeConfig.screenHeight * 0.04,
          // width: 83,
          // height: 32,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LanguageScreen()));
            },
            style: CustomButtonStyles.fillyellowA,
            child: Row(
              children: [
                Text(
                  "Skip ",
                  style: TextStyle(color: blackColor),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: blackColor,
                  size: 15,
                )
              ],
            ),
          ),
        ),
      ),
      Positioned(
        bottom: SizeConfig.screenHeight / 10.2,
        left: SizeConfig.screenWidth / 6.8,
        child: Column(
          children: [
            Text(StringConstant.onboard2headtext,
                style: GoogleFonts.inter(
                  color: whiteColor,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                  fontSize: 24,
                )),
            SizedBox(
                width: SizeConfig.screenWidth / 7,
                child: Divider(thickness: 3, color: whiteColor)),
            Text(StringConstant.onbaord2desctext,
                style: GoogleFonts.inter(
                  color: whiteColor,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.8,
                  fontSize: 16,
                ))
          ],
        ),
      ),
      Positioned(
        bottom: 10,
        right: 20,
        child: Text("Swipe left to view news",
            style: GoogleFonts.inter(
              color: greyColor,
              fontWeight: FontWeight.w400,
              fontSize: 10,
            )),
      )
    ],
  );
}

listWidget3(BuildContext context) {
  return Stack(
    children: [
      Positioned.fill(
        child: Image.asset(
          FileConstant.onboard3,
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
          bottom: 0,
          child: ClipRect(
              // <-- clips to the 200x200 [Container] below
              child: Container(
                  alignment: Alignment.center,
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight / 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade700.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container()))),
      Center(
          child: ClipRect(
              // <-- clips to the 200x200 [Container] below
              child: Container(
                  alignment: Alignment.center,
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container()))),
      Positioned(
        top: 88.66,
        left: 151.74,
        child: SvgPicture.asset(
          width: 70,
          height: 70,
          FileConstant.logo,
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
        bottom: SizeConfig.screenHeight / 10.2,
        left: SizeConfig.screenWidth / 6.8,
        child: Column(
          children: [
            Text(StringConstant.onboard3headtext,
                style: GoogleFonts.inter(
                  color: whiteColor,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                  fontSize: 24,
                )),
            SizedBox(
                width: SizeConfig.screenWidth / 7,
                child: Divider(thickness: 3, color: whiteColor)),
            Text(StringConstant.onbaord3desctext,
                style: GoogleFonts.inter(
                  color: whiteColor,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.8,
                  fontSize: 16,
                )),
          ],
        ),
      ),
      Positioned(
        bottom: 0,
        child: SizedBox(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight * 0.055,
          // width: 83,
          // height: 32,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LanguageScreen()));
            },
            style: CustomButtonStyles.fillyellowA,
            child: Text(
              "Continue",
              style: GoogleFonts.inter(
                  color: blackColor, fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    ],
  );
}
