import 'package:epic_multivendor/helper/helper_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String? rs = '\u{20B9}';

ThemeData appTextStyle = ThemeData(
    textTheme: TextTheme(
        headline1: GoogleFonts.poppins(textStyle: TextStyle()),
        headline2: GoogleFonts.poppins(textStyle: TextStyle()),
        headline3: GoogleFonts.poppins(textStyle: TextStyle()),
        headline4: GoogleFonts.poppins(textStyle: TextStyle()),
        headline5: GoogleFonts.poppins(textStyle: TextStyle()),
        headline6: GoogleFonts.poppins(textStyle: TextStyle()),
        subtitle1: GoogleFonts.poppins(
            textStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: AppColors.black,
        )),
        bodyText1: GoogleFonts.poppins(
            textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          height: 1.445,
          color: AppColors.black,
        )),
        subtitle2: GoogleFonts.poppins(textStyle: TextStyle()),
        button: GoogleFonts.poppins(
            textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: 1.5,
          color: AppColors.white,
        )),
        bodyText2: GoogleFonts.poppins(textStyle: TextStyle())));
String rupees = '\u{20B9}';
