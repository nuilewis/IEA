import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants.dart';

class CustomMenuItem extends StatelessWidget {
  final String title;
  final String svgSrc;
  final VoidCallback onPressed;
  final bool? isSelected;

  const CustomMenuItem({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.onPressed,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding / 2, horizontal: kDefaultPadding),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: kPurple20,
          backgroundColor:
              isSelected! ? kPurple20 : theme.scaffoldBackgroundColor,
          elevation: 0,
          alignment: Alignment.center,
          // minimumSize: Size(double.infinity, 54 ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kDefaultPadding)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: kDefaultPadding + 2, bottom: kDefaultPadding + 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                svgSrc,
                color: isSelected! ? theme.primaryColor : theme.iconTheme.color,
                // height: 16,
              ),
              const SizedBox(width: kDefaultPadding),
              Text(title,
                  style: theme.textTheme.bodyLarge!.copyWith(
                      fontSize: 18,
                      color: isSelected!
                          ? theme.primaryColor
                          : theme.iconTheme.color)),
            ],
          ),
        ),
      ),
    );
  }
}
