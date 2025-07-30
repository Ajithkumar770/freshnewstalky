import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshtalky/utils/constants/color_constant.dart';
import 'package:freshtalky/utils/constants/file_constant.dart';
import 'package:freshtalky/utils/constants/string_constant.dart';
import 'package:freshtalky/utils/size_config.dart';
import 'package:freshtalky/utils/widgets/custom_style_button.dart';
import 'package:freshtalky/views/news_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, this.selectedlang});
  final String? selectedlang;
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<Map<String, String>> categories = [
    {'name': StringConstant.sportstext, 'image': FileConstant.sporticon},
    {'name': StringConstant.politicstext, 'image': FileConstant.politicsicon},
    {'name': StringConstant.economytext, 'image': FileConstant.economy},
    {'name': StringConstant.socialtext, 'image': FileConstant.social},
    {'name': StringConstant.fashiontext, 'image': FileConstant.fashion},
    {'name': StringConstant.cinema1, 'image': FileConstant.cinema1},
    {'name': StringConstant.eventstext, 'image': FileConstant.events},
    {'name': StringConstant.tourismtext, 'image': FileConstant.tourism},
    {'name': StringConstant.cinematext, 'image': FileConstant.cinema},
  ];
  Timer? mytimer;
  List<String> selectedLanguageCodes = [];
  @override
  void dispose() {
    super.dispose();
    mytimer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    bool isOdd = categories.length % 2 != 0;
    int gridItemCount = categories.length;
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
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  StringConstant.selectcategory,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: blackColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  StringConstant.selectcategory2,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: blackColor,
                  ),
                ),
                // const SizedBox(height: 20),
                Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight / 1.4,
                      width: SizeConfig.screenWidth / 1.2,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 15.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: gridItemCount,
                        itemBuilder: (context, index) {
                          // if (isOdd && index != gridItemCount - 1) {
                          return buildLanguageCard(
                            categories[index]["name"]!,
                            categories[index]["image"]!,
                          );
                          // }
                        },
                      ),
                    ),
                    // Center(
                    //   child: buildLanguageCard(
                    //     categories.last["name"]!,
                    //     categories.last["image"]!,
                    //   ),
                    // )
                  ],
                ),
              ],
            ),
          ),
          Visibility(
            visible: selectedLanguageCodes.isNotEmpty ? true : false,
            child: Positioned(
              bottom: 0,
              child: SizedBox(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * 0.055,
                // width: 83,
                // height: 32,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewsScreen()));
                  },
                  style: CustomButtonStyles.fillyellowA,
                  child: Text(
                    "Continue",
                    style: GoogleFonts.inter(
                        color: blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLanguageCard(String categoryname, String categorynameimage) {
    bool isSelected = selectedLanguageCodes.contains(categorynameimage);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedLanguageCodes.remove(categorynameimage);
          } else {
            selectedLanguageCodes.add(categorynameimage);
          }
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0.0,
        color: isSelected ? yellowCOlor : greyColor.withAlpha(15),
        child: Stack(
          children: [
            Positioned(
              top: 5,
              right: 5,
              child: Icon(
                Icons.check_circle,
                size: 12,
                color: isSelected ? blackColor : greyColor.withAlpha(15),
              ),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SvgPicture.asset(categorynameimage),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    categoryname,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
