import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshtalky/utils/constants/color_constant.dart';
import 'package:freshtalky/utils/constants/file_constant.dart';
import 'package:freshtalky/utils/size_config.dart';
import 'package:freshtalky/utils/widgets/custom_style_button.dart';
import 'package:freshtalky/views/settings_screen.dart';
import 'package:freshtalky/views/update_profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final List<String> images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSORVkPrOcsdpppRwxxiDQYu1-SwP_cAyFzBA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBPgWd1ndgttu_kIDULbIUFZOoMF0YKLrqUA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8Ni9tTS2wrFEEu04KlEkH2EK8rJPXSzrbqQ&s',
    'https://cdn6.aptoide.com/imgs/1/8/f/18fdb96adf9b4232cfb6e6663d3d06aa_screen.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTopFYF1cmmDGPWtRm7VekLiYMWPfbpJCNbnQ&s',
    'https://scontent.cdninstagram.com/v/t39.30808-6/368724031_18104606314336209_3530135203435755107_n.jpg?stp=dst-jpg_e15&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE4MDAuc2RyLmYzMDgwOCJ9&_nc_ht=scontent.cdninstagram.com&_nc_cat=109&_nc_ohc=8iB80H_iSawQ7kNvgGA2383&edm=APs17CUAAAAA&ccb=7-5&ig_cache_key=MzE3NDI1MTc5NTIyMDIyNTkwOA%3D%3D.2-ccb7-5&oh=00_AYCooBp2TtrcqxEbaU-SbNFVW2yMuN2r5UgTG8SVKvq4Lw&oe=66966A0D&_nc_sid=10d13b',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmxo6e-1_8qUa1qnftEypyYAQTpj2x1tXU6g&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBXj2_TT94yvvrbtTUz1B1WxBwuNYh47SgeQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDywviAmDxegjXQGJ_daM0jZd_LnuRfi_qbQ&s'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SvgPicture.asset(
                FileConstant.settingsiconsvg,
                color: blackColor,
                width: 20,
                height: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset(
              FileConstant.shareicon,
              color: blackColor,
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          profilehead(context),
          const SizedBox(
            height: 10,
          ),
          walletdetailsbutton(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: greyColor,
          ),
          tabbarview(context)
        ],
      ),
    );
  }

  Widget tabbarview(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: TabBar(
                  // isScrollable: true, // if you have many tabs
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.fill,
                  tabs: [
                    Tab(
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.favorite_border,
                              size: 13,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Likes",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.bookmark_border,
                              size: 13,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Bookmarked",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  labelColor: darkyellowColor,
                  unselectedLabelColor: greyColor,
                  indicator: const BoxDecoration(),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        childAspectRatio: 1 /
                            (MediaQuery.of(context).size.height /
                                3.8 /
                                (MediaQuery.of(context).size.width /
                                    2.47)), // Adjust aspect ratio
                      ),
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            CachedNetworkImage(
                                imageUrl: images[index], fit: BoxFit.cover),
                            Positioned(
                                bottom: 10,
                                right: 20,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      color: redColor,
                                      size: 11,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "12.1 K",
                                      style: GoogleFonts.inter(
                                          color: whiteColor,
                                          fontSize: 8,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ))
                          ],
                        );
                      },
                    ),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        childAspectRatio: 1 /
                            (MediaQuery.of(context).size.height /
                                2.7 /
                                (MediaQuery.of(context).size.width /
                                    2.47)), // Adjust aspect ratio
                      ),
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(images[index]),
                                  fit: BoxFit
                                      .cover, // Ensures the image fills the grid cell
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 10,
                                right: 20,
                                child: SvgPicture.asset(
                                  FileConstant.bookmarkfilledicon,
                                  color: whiteColor,
                                ))
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget walletdetailsbutton() {
    return SizedBox(
      width: SizeConfig.screenWidth * 0.9,
      height: SizeConfig.screenHeight * 0.055,
      child: ElevatedButton(
        onPressed: () {},
        style: CustomButtonStyles.fillyellowA,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              FileConstant.walleticonsvg,
              width: 18,
              height: 18,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Wallet details",
              style: GoogleFonts.inter(
                  color: blackColor, fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Widget profilehead(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Container(
          width: 77,
          height: 77,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.transparent,
              width: 0.5,
            ),
          ),
          child: ClipOval(
            child: Image.network(
              "https://miro.medium.com/v2/resize:fit:2400/1*jF9pRoN2c7SnAF4CV1icMA.jpeg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Ajithkumar",
                style: GoogleFonts.inter(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateProfileScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: SvgPicture.asset(FileConstant.editiconsvg),
                      ),
                      Text(
                        "Edit Profile",
                        style: GoogleFonts.inter(
                            color: darkyellowColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class CircularProfileImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  final double borderWidth;
  final Color borderColor;

  CircularProfileImage({
    required this.imageUrl,
    required this.size,
    this.borderWidth = 2.0,
    this.borderColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: ClipOval(
        child: Image.network(
          imageUrl,
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
