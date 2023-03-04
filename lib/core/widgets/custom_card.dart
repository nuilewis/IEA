import 'package:flutter/material.dart';

import '../constants.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color? bgColor;
  final bool? showShadow;
  final Color? shadowColor;
  const CustomCard({
    Key? key,
    required this.child,
    this.bgColor,
    this.showShadow = true,
    this.shadowColor = kDark20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(kDefaultPadding2x),
        decoration: BoxDecoration(
          boxShadow: showShadow!
              ? [
                  BoxShadow(
                    blurRadius: kDefaultPadding,
                    color: shadowColor!,
                    offset: const Offset(5, 5),
                  )
                ]
              : null,
          color: bgColor ?? Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(kDefaultPadding + 8),
        ),
        child: child);
  }
}
