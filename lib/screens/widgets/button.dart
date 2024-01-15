import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:water_project/core/constants.dart';

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
              ? BorderSide(color: bgColor ?? theme.primaryColor, width: 1.5)
              : null,
          backgroundColor:
              isSecondary ? Colors.transparent : bgColor ?? theme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kDefaultPadding),
          ),
          elevation: 0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              showIcon
                  ? SvgPicture.asset(
                      iconLink!,
                      color: isSecondary
                          ? bgColor ?? theme.primaryColor
                          : textColor ?? Colors.white,
                    )
                  : const SizedBox(),
              showIcon
                  ? const SizedBox(width: kDefaultPadding)
                  : const SizedBox(),
              Text(
                text,
                style: theme.textTheme.bodyLarge!.copyWith(
                    color: isSecondary
                        ? bgColor ?? theme.primaryColor
                        : textColor ?? Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
