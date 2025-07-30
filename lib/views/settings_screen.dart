import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freshtalky/utils/constants/color_constant.dart';
import 'package:freshtalky/utils/size_config.dart';
import 'package:freshtalky/utils/widgets/custom_style_button.dart';
import 'package:freshtalky/views/feedback_screen.dart';
import 'package:freshtalky/views/news_screen.dart';
import 'package:freshtalky/views/share_screen.dart';
import 'package:freshtalky/views/termsandconditions_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isToggled = false;

  List<Map<String, dynamic>> settingslist = [
    {"title": "Notifications", "isselected": true},
    {"title": "Night mode", "isselected": false},
    {"title": "Video autoplay", "isselected": true},
  ];

  List<Map<String, dynamic>> tileList = [
    {
      "icon": Icons.share,
      "title": "Share this app",
    },
    {
      "icon": Icons.star_border,
      "title": "Rate this app",
    },
    {
      "icon": Icons.mode_comment_outlined,
      "title": "Feedback",
    },
    {
      "icon": Icons.check_box_outlined,
      "title": "Terms & Conditions",
    },
    {
      "icon": Icons.note_add_rounded,
      "title": "Privacy Policy",
    },
  ];

  bool _toggleButton(bool value) {
    value = !value;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Settings",
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w400, color: blackColor, fontSize: 18),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight / 4,
                child: ListView.builder(
                    itemCount: settingslist.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: rowwidget(settingslist[index]));
                    }),
              ),
              SizedBox(
                height: SizeConfig.screenHeight / 2,
                child: ListView.builder(
                    itemCount: tileList.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: tileWidget(tileList, index));
                    }),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.095,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewsScreen()));
                  },
                  style: CustomButtonStyles.fillyellowA,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout,
                        color: blackColor,
                      ),
                      Text(
                        "Logout",
                        style: GoogleFonts.inter(
                            color: blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tileWidget(tileList, index) {
    return ListTile(
        leading: Icon(tileList[index]["icon"]),
        title: Text(tileList[index]["title"]),
        trailing: IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: () {
            switch (index) {
              case 0:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShareUsScreen()));
                break;
              case 1:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FeedbackScreen()));
                break;
              case 2:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FeedbackScreen()));
                break;
              case 3:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GeneralTermsScreen(mode:"Terms")));
                break;
              case 4:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GeneralTermsScreen(mode:"PrivacyPolicy")));
                break;
              default:
            }
          },
        ));
  }

  Widget rowwidget(settingslist) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        settingslist["title"],
        style: GoogleFonts.inter(
            fontSize: 14, fontWeight: FontWeight.w400, color: blackColor),
      ),
      IconButton(
          icon: Icon(
            settingslist["isselected"] ? Icons.toggle_on : Icons.toggle_off,
            size: 50.0,
            color: settingslist["isselected"] ? darkyellowColor : greyColor,
          ),
          onPressed: () {
            bool val = _toggleButton(settingslist["isselected"]);
            setState(() {
              settingslist["isselected"] = val;
            });
          }),
    ]);
  }
}
