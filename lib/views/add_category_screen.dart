import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshtalky/utils/constants/color_constant.dart';
import 'package:freshtalky/utils/constants/file_constant.dart';
import 'package:freshtalky/utils/constants/string_constant.dart';
import 'package:freshtalky/utils/size_config.dart';
import 'package:freshtalky/views/settings_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final TextEditingController searchController = TextEditingController();
  final List<Map<String, String>> suggestedtopicslist = [
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
  List<String> selectedsuggestedtopics = [];

  final List<Map<String, String>> categories = [
    {
      'name': StringConstant.topstoriestext,
      'image': FileConstant.topstoriesicon
    },
    {'name': StringConstant.trendingtext, 'image': FileConstant.trendingicon},
    {'name': StringConstant.bookmarkstext, 'image': FileConstant.bookmarkicon},
    {'name': StringConstant.worldStoriestext, 'image': FileConstant.globeicon},
  ];
  List<String> selectedCategorylist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Discover',
          style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintText: 'Search for news',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Category',
              style:
                  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 5),
            Divider(
              color: greyColor,
            ),
            const SizedBox(height: 5),
            SizedBox(
                height: SizeConfig.screenHeight * 0.17,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 2.0, right: 2),
                        child: buildcategorycard(
                          categories[index]["name"]!,
                          categories[index]["image"]!,
                        ),
                      );
                    })),
            const SizedBox(height: 16),
            Text(
              'Suggested Topics',
              style:
                  GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Divider(
              color: greyColor,
            ),
            const SizedBox(height: 5),
            SizedBox(
                height: SizeConfig.screenHeight * 0.17,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: suggestedtopicslist.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 2.0, right: 2),
                        child: buildSuggestionList(
                          suggestedtopicslist[index]["name"]!,
                          suggestedtopicslist[index]["image"]!,
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }

  Widget buildcategorycard(String categoryname, String categorynameimage) {
    bool isSelected = selectedCategorylist.contains(categorynameimage);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedCategorylist.remove(categorynameimage);
          } else {
            selectedCategorylist.add(categorynameimage);
          }
        });
      },
      child: SizedBox(
        width: SizeConfig.screenWidth * 0.255,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 0.0,
          color: isSelected ? yellowCOlor : greyColor.withAlpha(25),
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
      ),
    );
  }

  Widget buildSuggestionList(String categoryname, String categorynameimage) {
    bool isSelected = selectedsuggestedtopics.contains(categorynameimage);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedsuggestedtopics.remove(categorynameimage);
          } else {
            selectedsuggestedtopics.add(categorynameimage);
          }
        });
      },
      child: SizedBox(
        width: SizeConfig.screenWidth * 0.255,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 0.0,
          color: isSelected ? yellowCOlor : greyColor.withAlpha(25),
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
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.grey),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class TopicItem extends StatelessWidget {
  final String label;
  final IconData iconData;

  const TopicItem({required this.label, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, size: 40, color: Colors.grey),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

Widget textfield(
    BuildContext context, String labelText, TextEditingController controller) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          size: 20,
        ),
        prefixIconColor: greyColor,
        hintText: labelText,
        hintStyle: GoogleFonts.inter(fontSize: 14, color: greyColor),
        border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(0)),
            borderSide: BorderSide(
                color: greyColor, width: 0.5, style: BorderStyle.none))),
  );
}
