import 'package:flutter/material.dart';

const primaryColor = Colors.indigoAccent;
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);
const containercolor = Color.fromRGBO(165, 174, 255, 1);
const rectanglecolor = Color.fromRGBO(255, 255, 255, 0.5);

///--------Colors---------///
// const Color kPurple = Color(0xFF531CF7);
// const Color kPurple80 = Color(0xB3531CF7);
// const Color kPurple60 = Color(0x80531CF7);
// const Color kPurple40 = Color(0x4D531CF7);
// const Color kPurple20 = Color(0x1A531CF7);

const Color kPurple = Color(0xFF3448FF);
const Color kPurple80 = Color(0xFF5061FF);
const Color kPurple60 = Color(0xFFB298FF);
const Color kPurple40 = Color(0xFFA5AEFF);
const Color kPurple20 = Color(0xFFE8EAFF);

const Color kGreen = Color(0xFF52DBB9);
const Color kGreen80 = Color(0xFF85EBD1);
const Color kGreen60 = Color(0xFFBAF2E4);
const Color kGreen40 = Color(0xFFD0F9EF);
const Color kGreen20 = Color(0xFFE8FDF8);

const Color kFuchsia = Color(0xFFFC4684);
const Color kFuchsia80 = Color(0xFFFF7DA9);
const Color kFuchsia60 = Color(0xFFFFACC8);
const Color kFuchsia40 = Color(0xFFFFD4E3);
const Color kFuchsia20 = Color(0xFFFFE9F0);

const Color kDark = Color(0xFF353535);
const Color kDark80 = Color(0xFF4C4C4C);
const Color kDark60 = Color(0xFFBDBDBD);
const Color kDark40 = Color(0xFFD7D7D7);
const Color kDark20 = Color(0xFFF4F4F4);
const Color grey = Color.fromARGB(244, 209, 209, 206);
const Color green = Color.fromARGB(244, 198, 245, 198);

const double kDefaultPadding = 16.0;
const double kDefaultPadding2x = 32.0;

///----TextStyles----///
const TextStyle kHeading = TextStyle(fontWeight: FontWeight.bold, fontSize: 22);
const TextStyle kHeadingLight =
    TextStyle(fontWeight: FontWeight.normal, fontSize: 22);
const TextStyle kBody = TextStyle(fontWeight: FontWeight.normal, fontSize: 14);
const TextStyle kBodyBold =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 14);

const TextStyle kButtonText =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 14);
const TextStyle kFootNote =
    TextStyle(fontWeight: FontWeight.normal, fontSize: 10);

///----------Text Form Field styles ---------////
InputDecoration customTextFieldDecoration = InputDecoration(
  errorStyle: kBody.copyWith(color: kFuchsia),

  errorBorder: OutlineInputBorder(
    gapPadding: 0,
    borderSide: const BorderSide(width: 1, color: kFuchsia80),
    borderRadius: BorderRadius.circular(
      kDefaultPadding,
    ),
  ),

  border: OutlineInputBorder(
    gapPadding: 0,
    borderSide: const BorderSide(width: 1, color: kPurple40),
    borderRadius: BorderRadius.circular(kDefaultPadding),
  ),
  focusedBorder: OutlineInputBorder(
    gapPadding: 0,
    borderSide: const BorderSide(width: 2, color: kPurple60),
    borderRadius: BorderRadius.circular(kDefaultPadding),
  ),
  enabledBorder: OutlineInputBorder(
    gapPadding: 0,
    borderSide: const BorderSide(width: 1, color: kPurple40),
    borderRadius: BorderRadius.circular(kDefaultPadding),
  ),
  hoverColor: kPurple20.withOpacity(.5),
  isDense: true,
  filled: true,
  fillColor: Colors.transparent,
  hintStyle: kBody,

  // fillColor: kPurple20,
);

///-------DateTime Constants -------////
///
Map<int, String> monthsOfYear = {
  1: "January",
  2: "February",
  3: "March",
  4: "April",
  5: "May",
  6: "June",
  7: "July",
  8: "August",
  9: "September",
  10: "October",
  11: "November",
  12: "December",
};
