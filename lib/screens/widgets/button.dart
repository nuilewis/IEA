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
      {super.key,
      required this.onPressed,
      required this.text,
      this.iconLink,
      this.showIcon = false,
      this.isSecondary = false,
      this.bgColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          side: isSecondary
              ? BorderSide(color: bgColor ?? Theme.of(context).colorScheme.primary , width: 1.5)
              : null,
          backgroundColor:
              isSecondary ? Colors.transparent : bgColor ?? Theme.of(context).colorScheme.primary ,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kDefaultPadding),
          ),
          elevation: 0),
      child: Center(
        child: Padding(
          padding:   const EdgeInsets.all(kDefaultPadding),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              showIcon
                  ? SvgPicture.asset(
                      iconLink!,
                      color: isSecondary
                          ? bgColor ?? Theme.of(context).colorScheme.primary 
                          : textColor ?? Colors.white,
                    )
                  :   const SizedBox(),
              showIcon
                  ?   const SizedBox(width: kDefaultPadding)
                  :   const SizedBox(),
              Text(
                text,
                style: theme.textTheme.bodyLarge!.copyWith(
                    color: isSecondary
                        ? bgColor ?? Theme.of(context).colorScheme.primary 
                        : textColor ?? Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
