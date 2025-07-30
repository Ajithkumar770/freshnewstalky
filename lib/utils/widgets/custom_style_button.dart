import 'package:flutter/material.dart';
import 'package:freshtalky/utils/constants/color_constant.dart';
import 'package:freshtalky/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.borderColor,
    this.borderWidth = 0,
    this.height,
    this.buttonColor,
    this.buttonTextColor = Colors.white,
    this.shape,
    this.icon,
    this.fontSize,
    this.fontWeight,
  });
  final String title;
  final VoidCallback onPressed;
  final Color? borderColor;
  final double borderWidth;
  final double? height;
  final Color? buttonColor;
  final Color buttonTextColor;
  final OutlinedBorder? shape;
  final Widget? icon;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: shape ??
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.7)),
          backgroundColor: buttonColor ?? Theme.of(context).primaryColor,
          side: BorderSide(
            width: borderWidth,
            color: borderColor ?? Theme.of(context).primaryColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox(),
            Text(
              title,
            ),
          ],
        ),
      ),
    );
  }
}

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillyellowA => ElevatedButton.styleFrom(
        backgroundColor: yellowCOlor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      );
  // static ButtonStyle get fillGreenA => ElevatedButton.styleFrom(
  //       backgroundColor: appTheme.greenA700,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(8.h),
  //       ),
  //     );
  // static ButtonStyle get fillOnError => ElevatedButton.styleFrom(
  //       backgroundColor: theme.colorScheme.onError,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(8.h),
  //       ),
  //     );
  // static ButtonStyle get fillOnPrimaryContainer => ElevatedButton.styleFrom(
  //       backgroundColor: theme.colorScheme.onPrimaryContainer,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(6.h),
  //       ),
  //     );
  // static ButtonStyle get fillRedA => ElevatedButton.styleFrom(
  //       backgroundColor: appTheme.redA700,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(8.h),
  //       ),
  //     );

  // // Outline button style
  // static ButtonStyle get outlineBlackTL5 => ElevatedButton.styleFrom(
  //       backgroundColor: appTheme.whiteA700,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(5.h),
  //       ),
  //       shadowColor: appTheme.black900.withOpacity(0.35),
  //       elevation: 1,
  //     );
  // static ButtonStyle get outlineBlackTL8 => OutlinedButton.styleFrom(
  //       backgroundColor: appTheme.whiteA700,
  //       side: BorderSide(
  //         color: appTheme.black900,
  //         width: 1,
  //       ),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(8.h),
  //       ),
  //     );
  static ButtonStyle get outlineBlueGray => OutlinedButton.styleFrom(
        backgroundColor: whiteColor,
        side: BorderSide(
          color: greyColor,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
