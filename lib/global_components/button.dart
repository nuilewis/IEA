import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      
          elevation: 20, primary: bgColor ?? theme.primaryColor),
      child: showIcon
          ? Row(
              children: [
                SvgPicture.asset(
                  iconLink!,
                  color: textColor ?? theme.iconTheme.color ?? Colors.white,
                )
              ],
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
