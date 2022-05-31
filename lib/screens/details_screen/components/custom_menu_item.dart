import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding2x, vertical: kDefaultPadding/2),
          padding: const EdgeInsets.only(top: kDefaultPadding, bottom:kDefaultPadding, left: kDefaultPadding2x*2 ,right: kDefaultPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kDefaultPadding ),
              color: isSelected!
                  ? kPurple20
                  : theme.scaffoldBackgroundColor),
          child: Row(
           mainAxisAlignment: MainAxisAlignment.start, 
            children: [
              SvgPicture.asset(
                svgSrc,
                color: isSelected! ? theme.primaryColor: theme.iconTheme.color,
               // height: 16,
              ),
SizedBox(width: kDefaultPadding),
              Text(title, style: theme.textTheme.bodyText1!.copyWith(fontSize: 18, color: isSelected! ? theme.primaryColor : theme.iconTheme.color)),
            ],
          ),
        ),
      ),
    );
  }
}
