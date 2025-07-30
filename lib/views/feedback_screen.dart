import 'package:flutter/material.dart';
import 'package:freshtalky/utils/constants/color_constant.dart';
import 'package:freshtalky/utils/size_config.dart';
import 'package:freshtalky/utils/widgets/custom_style_button.dart';
import 'package:freshtalky/views/news_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedbackScreen extends StatelessWidget {
  FeedbackScreen({super.key});
  final TextEditingController _reasoncontroller = TextEditingController();
  final TextEditingController _commentscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Feedback",
          style: GoogleFonts.inter(
              color: blackColor, fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            children: [
              Text(
                "Reason",
                style: GoogleFonts.inter(
                    color: blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              TextField(
                  controller: _reasoncontroller,
                  maxLength: 60,
                  decoration: InputDecoration(
                    hintText: 'Type here....',
                    hintStyle: TextStyle(color: greyColor),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: whiteColor,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                  ),
                  style: const TextStyle(fontSize: 16.0),
                  onChanged: (value) {}),
              Text(
                "Comments",
                style: GoogleFonts.inter(
                    color: blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              TextField(
                  controller: _commentscontroller,
                  maxLength: 300,
                  decoration: InputDecoration(
                    hintText: 'Type here....',
                    hintStyle: TextStyle(color: greyColor),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: whiteColor,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                  ),
                  style: const TextStyle(fontSize: 16.0),
                  onChanged: (value) {}),
            ],
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.095,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
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
                    "Submit",
                    style: GoogleFonts.inter(
                        color: blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
