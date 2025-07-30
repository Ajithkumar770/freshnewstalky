import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freshtalky/utils/constants/color_constant.dart';
import 'package:freshtalky/utils/constants/file_constant.dart';
import 'package:freshtalky/views/add_category_screen.dart';
import 'package:freshtalky/views/settings_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _nameController =
      TextEditingController(text: "Ajithkumar");
  final TextEditingController _emailController =
      TextEditingController(text: "ajithkumarkak770@gmail.com");
  final TextEditingController _ageController =
      TextEditingController(text: "23");
  List<String> categories = ['Cinema', 'Sports'];

  @override
  Widget build(BuildContext context) {
    // return full(context);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(
                  "Save",
                  style: GoogleFonts.inter(
                    color: darkyellowColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const Center(
            child: CircleAvatar(
              radius: 35,
              foregroundImage: NetworkImage(
                "https://miro.medium.com/v2/resize:fit:2400/1*jF9pRoN2c7SnAF4CV1icMA.jpeg",
              ),
            ),
          ),
          Center(
            child: Text(
              "Change Picture",
              style: GoogleFonts.inter(
                  color: darkyellowColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('Name'),
          textfield(context, "Name", _nameController),
          const SizedBox(height: 16),
          const Text('Email'),
          textfield(context, "Email", _emailController),
          const SizedBox(height: 16),
          const Text('Gender'),
          dropdownwidget(context, ["Male", "Female"]),
          const SizedBox(height: 16),
          const Text('Age'),
          textfield(context, "Age", _ageController),
          const SizedBox(height: 16),
          const Text('Selected Language'),
          dropdownwidget(
              context, ["English", "தமிழ்", "ಕನ್ನಡ", "മലയാളം", "తెలుగు"]),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Your category'),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddCategoryScreen()));
                },
                child: Text(
                  '+ Add category',
                  style: TextStyle(color: darkyellowColor),
                ),
              ),
            ],
          ),
          Wrap(
            spacing: 8.0,
            children: categories.map((category) {
              return Chip(
                side: BorderSide.none,
                color: MaterialStateProperty.all(yellowCOlor),
                label: Text(category),
                deleteIcon: const Icon(
                  Icons.close,
                  size: 14,
                ),
                onDeleted: () {
                  setState(() {
                    categories.remove(category);
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget dropdownwidget(BuildContext context, List<String> list) {
    return DropdownButton<String>(
      isExpanded: true,
      value: list[0],
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {});
      },
    );
  }

  Widget textfield(BuildContext context, String labelText,
      TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: greyColor, width: 0.5, style: BorderStyle.none))),
    );
  }
}
