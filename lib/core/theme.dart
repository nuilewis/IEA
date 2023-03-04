import 'package:flutter/material.dart';
import 'package:water_project/core/constants.dart';

ThemeData customLightTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    primaryColor: kPurple80,
    scaffoldBackgroundColor: kDark20,
    brightness: Brightness.light,
    cardColor: kDark20,
    iconTheme: const IconThemeData(color: kDark),
    fontFamily: "Poppins",
    textTheme: const TextTheme(
        displayLarge: kHeading,
        displayMedium: kHeadingLight,
        bodyLarge: kBody,
        bodyMedium: kBody),
    colorScheme: const ColorScheme.light()
        .copyWith(secondary: kFuchsia)
        .copyWith(background: Colors.white),
  );
}

ThemeData customDarkTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    primaryColor: kPurple80,
    scaffoldBackgroundColor: const Color.fromARGB(255, 17, 17, 17),
    brightness: Brightness.dark,
    cardColor: kDark60,
    iconTheme: const IconThemeData(color: Colors.white),
    fontFamily: "Poppins",
    textTheme: const TextTheme(
        displayLarge: kHeading,
        displayMedium: kHeadingLight,
        bodyLarge: kBody,
        bodyMedium: kBody),
    colorScheme: const ColorScheme.dark()
        .copyWith(secondary: kFuchsia)
        .copyWith(background: const Color.fromARGB(255, 17, 17, 17)),
  );
}
