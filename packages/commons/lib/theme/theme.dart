import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../commons.dart';

ThemeData lightTheme() {
  const scaffoldBackgroundColor = Color(0XFFEEEEEE);
  const cardColor = Colors.white;
  return ThemeData(
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    //fontFamily: "Muli",
    fontFamily: Platform.isIOS ? "Muli" : "Gotham",
    appBarTheme: lightAppBarTheme(),
    textTheme: textTheme(),
    brightness: Brightness.light,
    inputDecorationTheme: inputDecorationThemeUnderline(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: kPrimaryColor,
    primaryColorLight: kPrimaryLightColor,
    primaryColorDark: kPrimaryDarkColor,
    cardColor: cardColor,
    cardTheme: cardTheme(),
    sliderTheme: const SliderThemeData().copyWith(
      activeTrackColor: kPrimaryDarkColor,
      inactiveTrackColor: kPrimaryLightColor.withOpacity(0.7),
      thumbColor: kPrimaryDarkColor,
    ),
    dialogTheme: const DialogTheme().copyWith(
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: kTextColor)),
    bottomSheetTheme: const BottomSheetThemeData()
        .copyWith(modalBackgroundColor: const Color(0XFFFAFAFA)),
    snackBarTheme: const SnackBarThemeData().copyWith(
      backgroundColor: Colors.grey[700],
      contentTextStyle: const TextStyle(
        color: Colors.white70,
      ),
      actionTextColor: kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
    dividerTheme: const DividerThemeData().copyWith(
      indent: 10,
      endIndent: 10,
    ),
    tabBarTheme: tabBarTheme(cardColor).copyWith(
      labelColor: kTextColor,
      unselectedLabelColor: kTextColor,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return kPrimaryColor;
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return kPrimaryColor;
        }
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return kPrimaryColor;
        }
        return null;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return kPrimaryColor;
        }
        return null;
      }),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
        .copyWith(secondary: kAccentColor)
        .copyWith(background: Colors.white)
        .copyWith(secondary: kAccentColor),
  );
}

ThemeData darkTheme() {
  const scaffoldBackgroundColor = Colors.black;
  const cardColor = Color(0XFF26282A);
  return lightTheme().copyWith(
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    brightness: Brightness.dark,
    cardColor: cardColor, //Colors.grey[900],
    canvasColor: const Color(0XFF26282A),
    cardTheme: cardTheme(),
    disabledColor: kSecondaryColor,
    textTheme: textTheme().copyWith(
      bodyLarge: textTheme().bodyLarge!.copyWith(
            color: Colors.white70,
          ),
      bodyMedium: textTheme().bodyMedium!.copyWith(
            color: Colors.white70,
          ),
      headlineSmall: const TextStyle(color: Colors.white70),
      titleLarge: const TextStyle(color: Colors.white70),
    ),
    appBarTheme: lightAppBarTheme().copyWith(
      color: Colors.white70, // const Color(0XFF212121), // Colors.black87,
      iconTheme: const IconThemeData(color: Colors.white70),
    ),
    dialogTheme: const DialogTheme().copyWith(
      backgroundColor: Colors.grey[850],
      titleTextStyle: const TextStyle(color: Colors.white70),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData()
        .copyWith(backgroundColor: Colors.grey[900]),
    inputDecorationTheme: inputDecorationThemeUnderline().copyWith(
      labelStyle: const TextStyle(color: Colors.white70),
      helperStyle: const TextStyle(color: Colors.white70),
    ),
    bottomSheetTheme: const BottomSheetThemeData().copyWith(
      backgroundColor: Colors.grey[900],
      modalBackgroundColor: Colors.grey[900],
    ),
    toggleButtonsTheme: const ToggleButtonsThemeData()
        .copyWith(color: Colors.white70, borderColor: Colors.white12),
    snackBarTheme: lightTheme().snackBarTheme.copyWith(
        backgroundColor: Colors.grey[400],
        contentTextStyle: const TextStyle(color: Colors.black54)),
    dividerTheme: const DividerThemeData()
        .copyWith(indent: 10, endIndent: 10, color: Colors.white12),
    listTileTheme: const ListTileThemeData().copyWith(),
    tabBarTheme: tabBarTheme(cardColor).copyWith(
      labelColor: Colors.white70,
    ),
    colorScheme: const ColorScheme(
      background: Colors.black87,
      brightness: Brightness.dark,
      error: Colors.red,
      onBackground: Colors.white70,
      onError: Colors.white70,
      onPrimary: Colors.white70,
      onSecondary: Colors.white70,
      onSurface: Colors.white70,
      primary: Colors.white70,
      secondary: Colors.white70,
      surface: Colors.white70,
      // ignore: deprecated_member_use
      // primarySwatch: Colors.grey,
    ),
  );
}

InputDecorationTheme inputDecorationThemeOutline() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: kSecondaryColor),
    gapPadding: 10,
  );
  OutlineInputBorder focusOutlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: kPrimaryColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
      // If  you are using latest version of flutter then lable text and hint text shown like this
      // if you r using flutter less then 1.20.* then maybe this is not working properly
      // if we are define our floatingLabelBehavior in our theme then it's not applayed
      // floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      enabledBorder: outlineInputBorder,
      focusedBorder: focusOutlineInputBorder,
      border: outlineInputBorder,
      labelStyle: TextStyle(color: Colors.grey[600]));
}

InputDecorationTheme inputDecorationThemeUnderline() {
  UnderlineInputBorder underlineInputBorder = UnderlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: kGrayColor),
  );
  return InputDecorationTheme(
    contentPadding: EdgeInsets.only(
      left: 50.w,
      top: 5.h,
      bottom: 15.h,
    ),
    isDense: false,
    enabledBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    errorBorder: underlineInputBorder.copyWith(
        borderSide: BorderSide(color: Colors.red[700]!)),
    focusedBorder: underlineInputBorder,
    focusedErrorBorder: underlineInputBorder.copyWith(
        borderSide: BorderSide(color: Colors.red[700]!)),
    border: InputBorder.none,
    focusColor: kPrimaryColor,
    labelStyle: TextStyle(color: Colors.grey[600]),
    floatingLabelAlignment: FloatingLabelAlignment.start,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    //floatingLabelStyle: TextStyle(color: Colors.grey[600], fontSize: 16.sp),
    suffixStyle: TextStyle(
      color: Colors.grey[600],
      fontWeight: FontWeight.w600,
    ),
    hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16.sp),
    errorStyle: TextStyle(
      fontSize: 13.sp,
    ),
  );
}

TextTheme textTheme() {
  return GoogleFonts.poppinsTextTheme(
    const TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor),
    ),
  );
}

TabBarTheme tabBarTheme(Color indicatorFillColor) {
  return const TabBarTheme().copyWith(
    indicatorSize: TabBarIndicatorSize.tab,
    labelPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.w),
  );
}

CardTheme cardTheme() {
  return CardTheme(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ));
}

AppBarTheme lightAppBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: textTheme().copyWith(
      headline6: TextStyle(
        color: const Color(0XFF8B8B8B),
        fontSize: 18.sp,
      ),
    ),
  );
}

TextStyle mediumGoogleFontTextStyle(
    {double fontSize = 14.0, fontWeight = FontWeight.w500, Color? color}) {
  return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
}
