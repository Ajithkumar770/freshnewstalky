import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshtalky/models/news_model.dart';
import 'package:freshtalky/utils/constants/color_constant.dart';
import 'package:freshtalky/utils/constants/file_constant.dart';
import 'package:freshtalky/utils/size_config.dart';
import 'package:freshtalky/utils/widgets/custom_style_button.dart';
import 'package:freshtalky/views/profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  double _progress = 0.0;
  Timer? _timer;
  Timer? _autoScrollTimer;
  int _totalTime = 10;
  int _elapsedTime = 0;
  int _currentPage = 0;
  bool timerClose = false;
  bool _isPaused = false;

  List<NewsModel> newsList = [
    NewsModel(
      downloads: 550,
      shares: 10000,
      likes: 12100,
      views: 15500,
      totalamount: 1200,
      isPremium: false,
      newsImage:
          "https://i.pinimg.com/736x/12/4e/74/124e74bf119962c3cd1dbac206bfa431.jpg",
      newsTitle:
          "India defeats New Zealand in super over for 2nd straight time lead series 4-0",
    ),
    NewsModel(
      downloads: 550,
      shares: 10000,
      likes: 12100,
      views: 15500,
      totalamount: 1200,
      isPremium: false,
      newsImage:
          "https://i.pinimg.com/564x/cb/c4/77/cbc477a1dee928cba3e0e2696a139b4d.jpg",
      newsTitle:
          "India defeats New Zealand in super over for 2nd straight time lead series 4-0",
    ),
    NewsModel(
      downloads: 550,
      shares: 10000,
      likes: 12100,
      views: 15500,
      totalamount: 1200,
      isPremium: true,
      newsImage:
          "https://i.pinimg.com/564x/8e/9c/64/8e9c642e558c6208af5dc8eabdc3a60a.jpg",
      newsTitle:
          "India defeats New Zealand in super over for 2nd straight time lead series 4-0",
    )
  ];

  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0; // Track current page index

  @override
  void initState() {
    super.initState();
    // startProgressTimer();
    // startAutoScrollTimer();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime++;
        if (_elapsedTime >= _totalTime) {
          _elapsedTime = 0;
          _progress = 0.0;
          if (_currentPage < newsList.length - 1) {
            _currentPage++;
            _pageController.animateToPage(
              _currentPage,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          } else {
            _timer!.cancel();
            _elapsedTime = 0;
            _progress = 0.0;
            _totalTime = 0;
            timerClose = true;
            // _currentPage = 0; // Restart from the first page
          }
        } else {
          _progress = _elapsedTime / _totalTime;
        }
      });
    });
  }

  String formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M'; // Million
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K'; // Thousand
    } else {
      return number.toString();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
            startTimer();
          });
        },
        itemCount: newsList.length,
        itemBuilder: (context, pageIndex) {
          if (newsList[pageIndex].isPremium == false) {
            return bodyWidget(newsList[pageIndex]);
          } else {
            // _timer!.cancel();
            return premiumbodyWidget();
          }
        },
      ),
    );
  }

  Widget premiumbodyWidget() {
    return Container(
      color: Colors.black,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(90),
                ),
                child: SvgPicture.asset(
                  FileConstant.premiumiconsvg,
                  width: 33,
                  height: 33,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "PREMIUM NEWS",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const SizedBox(
                      width: 55,
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: SizeConfig.screenWidth / 1.7,
                      child: Text(
                        "Take subscription package to view news",
                        maxLines: 2,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: SizeConfig.screenWidth / 1.2,
                height: SizeConfig.screenHeight * 0.055,
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

  void pauseTimer() {
    _timer?.cancel();
    _isPaused = true;
  }

  void resumeTimer() {
    if (_isPaused) {
      startTimer();
      _isPaused = false;
    }
  }

  void settingModalBottomSheet(BuildContext context) async {
    pauseTimer();
    await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(left: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            height: SizeConfig.screenHeight / 3.2,
            width: SizeConfig.screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Login to save news",
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Keep login to save news for future",
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: SizeConfig.screenWidth / 1.2,
                  height: SizeConfig.screenHeight * 0.07,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewsScreen()));
                    },
                    style: CustomButtonStyles.outlineBlueGray,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          FileConstant.googleiconpng,
                          width: 21,
                          height: 21,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Login with Google",
                          style: GoogleFonts.inter(
                              color: blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Close",
                    style: TextStyle(
                        color: redColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          );
        });
    resumeTimer();
  }

  Widget bodyWidget(NewsModel newsmd) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(newsmd.newsImage!),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 21,
            left: 16,
            child: Image.asset("assets/images/brand.png"),
          ),
          Positioned(
            top: 21,
            right: 20,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  },
                  child: SvgPicture.asset(
                    FileConstant.logo,
                    width: 36,
                    height: 36,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                SvgPicture.asset(
                  FileConstant.searchicon,
                  width: 36,
                  height: 36,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                SvgPicture.asset(
                  FileConstant.bookmarkicon,
                  width: 36,
                  height: 36,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 100,
            right: 20,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  },
                  child: SvgPicture.asset(
                    FileConstant.logo,
                    width: 25,
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: yellowCOlor,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        FileConstant.rupeeiconsvg,
                        width: 12,
                        height: 12,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        newsmd.totalamount!.toString(),
                        style: TextStyle(
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    settingModalBottomSheet(context);
                  },
                  child: SvgPicture.asset(
                    FileConstant.favouriteicon,
                    width: 25,
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    formatNumber(newsmd.likes!).toString(),
                    style: TextStyle(color: whiteColor),
                  ),
                ),
                const SizedBox(height: 20),
                SvgPicture.asset(
                  FileConstant.shareicon,
                  width: 25,
                  height: 25,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    formatNumber(newsmd.shares!).toString(),
                    style: TextStyle(color: whiteColor),
                  ),
                ),
                const SizedBox(height: 20),
                SvgPicture.asset(
                  FileConstant.downloadicon,
                  width: 25,
                  height: 25,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    formatNumber(newsmd.downloads!).toString(),
                    style: TextStyle(color: whiteColor),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: !timerClose,
            child: Positioned(
              bottom: 80,
              left: 20,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      value: _progress,
                      strokeWidth: 4,
                      valueColor: AlwaysStoppedAnimation<Color>(yellowCOlor),
                    ),
                  ),
                  Text(
                    '${_totalTime - _elapsedTime}',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            child: SizedBox(
              width: SizeConfig.screenWidth / 1.2,
              child: Text(
                newsmd.newsTitle!.toString(),
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                softWrap: true,
                maxLines: 2,
              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 10,
            child: Row(
              children: [
                SvgPicture.asset(
                  width: 15,
                  height: 9,
                  FileConstant.eyeicon,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  formatNumber(newsmd.views!).toString(),
                  style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
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
      ),
    );
  }
}
