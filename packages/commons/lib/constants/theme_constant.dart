// Colors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color blackColor = Colors.black;
const Color kWhiteColor = Colors.white;
const Color kGrayColor = Color(0XFF424242);
//const Color primaryColor = Colors.deepPurpleAccent;
const Color transparentColor = Colors.transparent;
const Color actionLinkColor = Colors.blueAccent;

const kPrimaryColor = Color.fromARGB(227, 243, 70, 70);
const kPrimaryLightColor = Color.fromARGB(213, 252, 139, 139);
const kPrimaryDarkColor = Color.fromARGB(218, 163, 44, 44);
final kPrimaryExtraDarkColor = Colors.orange[900]!;
const kAccentColor = Color.fromARGB(243, 236, 109, 59);
const kAccentLightColor = Color.fromARGB(255, 247, 157, 79);
const kAccentDarkColor = Color.fromARGB(255, 247, 147, 122);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color.fromARGB(255, 104, 77, 47), Color.fromARGB(255, 49, 15, 3)],
);
const kSecondaryColor = Color.fromARGB(235, 253, 235, 198);
const kTextColor = Color(0xFF303030);
const kTextDarkColor = Color(0xFFFEFEFE);
const kLightGray = Color(0XFFEEEEEE);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: 14.sp,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final heading2Style = TextStyle(
  fontSize: 13.sp,
  fontWeight: FontWeight.w500,
  color: kTextColor,
  height: 1,
);
