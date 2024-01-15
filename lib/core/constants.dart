import 'package:flutter/material.dart';

///-------DateTime Constants -------////

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

///-------Paddings--------///
const double kDefaultPadding = 16.0;
const double kDefaultPadding2x = 32.0;

///------Input Decorations-------///
class AppInputDecoration {
  static InputDecoration inputDecoration(BuildContext context) {
    return InputDecoration(
        errorStyle: AppTextStyles.bodyMedium
            .copyWith(color: Theme.of(context).colorScheme.error),
        errorBorder: OutlineInputBorder(
          gapPadding: 4,
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.error, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        disabledBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide: const BorderSide(width: 1, color: AppColours.blue60),
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        isDense: true,
        fillColor: Theme.of(context).cardColor,
        hintStyle:
            AppTextStyles.bodyMedium.copyWith(color: AppColours.neutral50),
        labelStyle: AppTextStyles.bodyMedium.copyWith(color: AppColours.black));
  }
}

///------Colours-------///
class AppColours {
  static const Color black = Color(0xFF1C1A22);
  static const Color white = Color(0xFFFFFBFF);

  ///-----------Purple---------///
  static const Color blueSeed = Color(0xFF1F84FB);
  static const Color blue5 = Color(0xFF000448);
  static const Color blue10 = Color(0xFF000866);
  static const Color blue20 = Color(0xFF0012A0);
  static const Color blue30 = Color(0xFF1327D2);
  static const Color blue40 = Color(0xFF3748E8);
  static const Color blue50 = Color(0xFF5465FF);
  static const Color blue60 = Color(0xFF7885FF);
  static const Color blue70 = Color(0xFF9BA4FF);
  static const Color blue80 = Color(0xFFBDC2FF);
  static const Color blue90 = Color(0xFFDFE0FF);
  static const Color blue95 = Color(0xFFF1EFFF);
  static const Color blue98 = Color(0xFFFBF8FF);
  static const Color blue99 = Color(0xFFFDFBFF);

  ///-----------Green---------///
  static const Color greenSeed = Color(0xFF0DCC70);
  static const Color green5 = Color(0xFF001507);
  static const Color green10 = Color(0xFF00210D);
  static const Color green20 = Color(0xFF00391B);
  static const Color green30 = Color(0xFF005229);
  static const Color green40 = Color(0xFF006D39);
  static const Color green50 = Color(0xFF008949);
  static const Color green60 = Color(0xFF00A65A);
  static const Color green70 = Color(0xFF00C46B);
  static const Color green80 = Color(0xFF3AE283);
  static const Color green90 = Color(0xFF5FFF9C);
  static const Color green95 = Color(0xFFC3FFCF);
  static const Color green98 = Color(0xFFEAFFEA);
  static const Color green99 = Color(0xFFF5FFF3);

  ///-----------Yellow---------///
  static const Color yellowSeed = Color(0xFFFECB48);
  static const Color yellow5 = Color(0xFF181000);
  static const Color yellow10 = Color(0xFF251A00);
  static const Color yellow20 = Color(0xFF3F2E00);
  static const Color yellow30 = Color(0xFF5A4300);
  static const Color yellow40 = Color(0xFF775A00);
  static const Color yellow50 = Color(0xFF967200);
  static const Color yellow60 = Color(0xFFB58A00);
  static const Color yellow70 = Color(0xFFD3A521);
  static const Color yellow80 = Color(0xFFF1C03D);
  static const Color yellow90 = Color(0xFFFFDF99);
  static const Color yellow95 = Color(0xFFFFEFD2);
  static const Color yellow98 = Color(0xFFFFF8F2);
  static const Color yellow99 = Color(0xFFFFFBFF);

  ///-----------Red---------///
  static const Color redSeed = Color(0xFFFF4C4C);
  static const Color red15 = Color(0xFF2D0002);
  static const Color red10 = Color(0xFF410004);
  static const Color red20 = Color(0xFF68000B);
  static const Color red30 = Color(0xFF930014);
  static const Color red40 = Color(0xFFBB1623);
  static const Color red50 = Color(0xFFDF3438);
  static const Color red60 = Color(0xFFFF5352);
  static const Color red70 = Color(0xFFFF8982);
  static const Color red80 = Color(0xFFFFB3AE);
  static const Color red90 = Color(0xFFFFDAD7);
  static const Color red95 = Color(0xFFFFEDEB);
  static const Color red98 = Color(0xFFFFF8F7);
  static const Color red99 = Color(0xFFFFFBFF);

  ///-----------Neutral---------///
  static const Color neutral5 = Color(0xFF111114);
  static const Color neutral10 = Color(0xFF1B1B1F);
  static const Color neutral20 = Color(0xFF303034);
  static const Color neutral30 = Color(0xFF47464A);
  static const Color neutral40 = Color(0xFF5F5E62);
  static const Color neutral50 = Color(0xFF78767A);
  static const Color neutral60 = Color(0xFF929094);
  static const Color neutral70 = Color(0xFFADAAAF);
  static const Color neutral80 = Color(0xFFC8C5CA);
  static const Color neutral90 = Color(0xFFE4E1E6);
  static const Color neutral95 = Color(0xFFF3F0F4);
  static const Color neutral98 = Color(0xFFFCF8FD);
  static const Color neutral99 = Color(0xFFFFFBFF);
}

///------Text Styles-------///
class AppTextStyles {
  ///---Display---//

  static TextStyle displayLarge = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 57,
    height: 1,
  );

  static TextStyle displayMedium = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 45,
    height: 1,
  );

  static TextStyle displaySmall = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 36,
    height: 1,
  );

  ///---Headline---///
  static TextStyle headlineLarge = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 32,
    height: 1,
  );
  static TextStyle headlineMedium = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 28,
    height: 1,
  );

  static TextStyle headlineSmall = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 24,
    height: 1,
  );

  ///---Title---///
  static TextStyle titleLargeBold = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 22,
    height: 1,
  );
  static TextStyle titleLarge = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 22,
    height: 1,
  );

  static TextStyle titleMediumBold = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 16,
    //  height: 1,
  );
  static TextStyle titleMedium = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 16,
    //   height: 1,
  );

  static TextStyle titleSmallBold = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 14,
    //   height: 1,
  );
  static TextStyle titleSmall = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    //   height: 1,
  );

  ///---Body---///
  static TextStyle bodyLargeBold = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 16,
    height: 1.5,
  );
  static TextStyle bodyLarge = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 16,
    height: 1.5,
  );

  static TextStyle bodyMediumBold = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 14,
    height: 1.5,
  );
  static TextStyle bodyMedium = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    height: 1.5,
  );

  static TextStyle bodySmallBold = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 12,
    // height: 1,
  );
  static TextStyle bodySmall = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12,
    // height: 1,
  );
}
