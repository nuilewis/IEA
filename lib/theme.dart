import 'package:flutter/material.dart';
import 'package:water_project/constants.dart';

ThemeData customLightTheme(BuildContext context) {
  return ThemeData(
    primaryColor: kPurple,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    cardColor: kDark20,
    iconTheme: const IconThemeData(color: kDark),
    colorScheme: const ColorScheme.light().copyWith(secondary: kFuchsia),
    fontFamily: "Poppins",
    textTheme: const TextTheme(
        headline1: kHeading,
        headline2: kHeadingLight,
        bodyText1: kBody,
        bodyText2: kBody),
  );
}

ThemeData customDarkTheme(BuildContext context) {
  return ThemeData(
    primaryColor: kPurple,
    scaffoldBackgroundColor: Color.fromARGB(255, 17, 17, 17),
    brightness: Brightness.dark,
    backgroundColor: Color.fromARGB(255, 17, 17, 17),
    cardColor: kDark60,
    iconTheme: const IconThemeData(color: Colors.white),
    colorScheme: const ColorScheme.dark().copyWith(secondary: kFuchsia),
    fontFamily: "Poppins",
    textTheme: const TextTheme(
        headline1: kHeading,
        headline2: kHeadingLight,
        bodyText1: kBody,
        bodyText2: kBody),
  );
}
