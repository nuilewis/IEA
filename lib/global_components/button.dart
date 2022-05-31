import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:water_project/constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String? iconLink;
  final bool showIcon;
  final Color? bgColor;
  final Color? textColor;
  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.iconLink,
      this.showIcon = false,
      this.bgColor,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kDefaultPadding),
      ),
          elevation: 0, primary: bgColor ?? theme.primaryColor),
      child: showIcon
          ? Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding, horizontal: kDefaultPadding2x),
            child: Row(
                children: [
                  SvgPicture.asset(
                    iconLink!,
                    color: textColor ??  Colors.white,
                  ),
                  SizedBox(width: kDefaultPadding),
                  Text(
                  text,
                  style: theme.textTheme.bodyText1!
                      .copyWith(fontSize: 20, color: textColor ?? Colors.white),
                ),
                ],
              ),
          )
          : Center(
              child: Text(
                text,
                style: theme.textTheme.bodyText1!
                    .copyWith(fontSize: 20, color: textColor ?? Colors.white),
              ),
            ),
    );
  }
}
