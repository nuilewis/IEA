import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class CustomMenuItem extends StatelessWidget {
  const CustomMenuItem({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.onPressed,
    this.onSelected,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback onPressed;
  final bool? onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
      ),
      child: ListTile(
        onTap: onPressed,
        horizontalTitleGap: 0.0,
        leading: SvgPicture.asset(
          svgSrc,
          color: Theme.of(context).iconTheme.color,
          height: 16,
        ),
        title: Text(title, style: Theme.of(context).textTheme.bodyText1),
      ),
    );
  }
}