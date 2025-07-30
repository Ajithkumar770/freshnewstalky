import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freshtalky/utils/constants/color_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneralTermsScreen extends StatefulWidget {
  GeneralTermsScreen({super.key, @required this.mode});
  String? mode;

  @override
  State<GeneralTermsScreen> createState() => _GeneralTermsScreenState();
}

class _GeneralTermsScreenState extends State<GeneralTermsScreen> {
  final List<String> bulletPoints = [
    '',
    'Second bullet point',
    'Third bullet point',
    'Fourth bullet point',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(
            widget.mode == "Terms" ? "Terms & Conditions" : "Privacy Policy",
            style: GoogleFonts.inter(
                color: blackColor, fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
        body: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              children: [
                Text(
                  "Heading",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: blackColor),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.",
                    style: GoogleFonts.inter(
                        height: 1.5,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: blackColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10),
                  child: Column(
                    children: [
                      Text(
                        "1. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. ",
                        style: GoogleFonts.inter(
                            height: 1.8,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: blackColor),
                      ),
                      Text(
                        "2. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. ",
                        style: GoogleFonts.inter(
                            height: 1.8,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: blackColor),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Heading",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: blackColor),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.",
                    style: GoogleFonts.inter(
                        height: 1.5,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: blackColor),
                  ),
                ),
                Text(
                  "Heading",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: blackColor),
                ),
                Text(
                  "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. ",
                  style: GoogleFonts.inter(
                      height: 1.8,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: blackColor),
                ),

                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Column(
                    children: [
                      Text(
                        "Further Questions?",
                        style: GoogleFonts.inter(
                            height: 1.8,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: textGreenColor),
                      ),
                      Row(
                        children: [
                          Text(
                            "If you have any questions? ",
                            style: GoogleFonts.inter(
                                height: 1.8,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: blackColor),
                          ),
                          Text(
                            "Send us message. ",
                            style: GoogleFonts.inter(
                                height: 1.8,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: textblueColor),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                // RichText(
                //     text: TextSpan(
                //   children: bulletPoints
                //       .map((point) => buildBulletPoint(point))
                //       .toList(),
                // ))
              ],
            ),
          ],
        ));
  }

  TextSpan buildBulletPoint(String text) {
    return TextSpan(
      children: [
        WidgetSpan(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 0.0),
            child: Text(
              '1.',
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
          ),
        ),
        TextSpan(
          text: text,
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
        TextSpan(
          text: '\n', // Adding a new line after each bullet point
        ),
      ],
    );
  }
}
