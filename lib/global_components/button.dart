import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:water_project/constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isSecondary;
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
      this.isSecondary = false,
      this.bgColor,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          side: isSecondary
              ? BorderSide(color: bgColor ?? theme.primaryColor, width: 2)
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kDefaultPadding2x),
          ),
          elevation: 0,
          primary:
              isSecondary ? Colors.transparent : bgColor ?? theme.primaryColor),
      child: showIcon
          ? Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding, horizontal: kDefaultPadding2x),
              child: Row(
                children: [
                  SvgPicture.asset(
                    iconLink!,
                    color: isSecondary
                        ? bgColor ?? theme.primaryColor
                        : textColor ?? Colors.white,
                  ),
                  const SizedBox(width: kDefaultPadding),
                  Text(
                    text,
                    style: theme.textTheme.bodyText1!.copyWith(
                        fontSize: 20,
                        color:
                            isSecondary ? bgColor : textColor ?? Colors.white),
                  ),
                ],
              ),
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Text(
                  text,
                  style: theme.textTheme.bodyText1!.copyWith(
                      fontSize: 20,
                      color: isSecondary
                          ? bgColor ?? theme.primaryColor
                          : textColor ?? Colors.white),
                ),
              ),
            ),
    );
  }
}
