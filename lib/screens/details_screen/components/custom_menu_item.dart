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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding2x),
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding/2, horizontal: kDefaultPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kDefaultPadding / 2),
              color: isSelected!
                  ? kPurple20
                  : Theme.of(context).scaffoldBackgroundColor),
          child: Row(
            children: [
              SvgPicture.asset(
                svgSrc,
                color: Theme.of(context).iconTheme.color,
                height: 16,
              ),
              Text(title, style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
      ),
    );
  }
}
