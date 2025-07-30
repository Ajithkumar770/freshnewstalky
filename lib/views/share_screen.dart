import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freshtalky/utils/constants/color_constant.dart';
import 'package:freshtalky/utils/constants/file_constant.dart';
import 'package:freshtalky/utils/size_config.dart';
import 'package:freshtalky/utils/widgets/custom_style_button.dart';
import 'package:freshtalky/views/news_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ShareUsScreen extends StatefulWidget {
  ShareUsScreen({super.key});

  @override
  State<ShareUsScreen> createState() => _ShareUsScreenState();
}

class _ShareUsScreenState extends State<ShareUsScreen> {
  final TextEditingController _controller = TextEditingController();

  bool isCopied = false;

  String codeText = "";

  String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  void initState() {
    super.initState();
    codeText = getRandomString(7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Share this app",
          style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Image.asset(FileConstant.shareuspng),
              ),
              Text("Invite your friends and get 600 points in your wallet",
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: blackColor)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          labelText: 'Your code',
                          labelStyle: TextStyle(color: greyColor),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: whiteColor,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                        ),
                        style: const TextStyle(fontSize: 16.0),
                        onChanged: (value) {
                          if (isCopied) {
                            setState(() {
                              isCopied = false;
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    GestureDetector(
                      onTap: () {
                        if (codeText.isNotEmpty) {
                          Clipboard.setData(ClipboardData(text: codeText));
                          setState(() {
                            isCopied = true;
                          });
                          // _controller.clear();
                        }
                      },
                      child: Text(codeText,
                          style: GoogleFonts.inter(
                              color: textVioletColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
              ),
              Text(isCopied ? 'Copied' : 'Click to Copy'),
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
                    "Share",
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
