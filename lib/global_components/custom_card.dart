import 'package:flutter/material.dart';

import '../constants.dart';


class CustomCard extends StatelessWidget {

  final Widget child;
  final Color? bgColor;
  final bool? showShadow;
  final Color? shadowColor;
  const CustomCard({Key? key, required this.child, this.bgColor,  this.showShadow = true, this.shadowColor = kDark20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      color: bgColor ?? Theme.of(context).cardColor,
       padding: const EdgeInsets.all(kDefaultPadding2x),
      decoration: BoxDecoration(
        boxShadow:  showShadow! ?[
          BoxShadow(
          blurRadius: kDefaultPadding2x,
          color: shadowColor!
        )]: null,
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(kDefaultPadding2x),
 
      ),
             child: child
    );
  }
}