import 'package:flutter/material.dart';

import '../../core/core.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color? bgColor;
  final bool? showShadow;
  final Color? shadowColor;
    const CustomCard({
    super.key,
    required this.child,
    this.bgColor,
    this.showShadow = true, this.shadowColor,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:   const EdgeInsets.all(kDefaultPadding2x),
        decoration: BoxDecoration(

          color: bgColor ?? Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(kDefaultPadding + 8),
        ),
        child: child);
  }
}
