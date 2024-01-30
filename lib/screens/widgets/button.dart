import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/core.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final ButtonType buttonType;
  final IconData? iconData;
  final String? iconPath;
  final Color? color;
  final Color? backgroundColor;
  final bool? overrideIconColor;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color,
    this.backgroundColor,
    this.iconPath,
    this.iconData,
    this.overrideIconColor = true,
    this.buttonType = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {

    if(iconData!=null && iconPath!=null){
      throw ErrorHint("Cannot provide both an icon path and and IconData simultaneously");
    }

    final theme = Theme.of(context);
    ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? theme.colorScheme.primary,
      foregroundColor: color ?? Colors.white,
    );
    Color labelColor = theme.colorScheme.primary;
    switch (buttonType) {
      case ButtonType.primary:
        style = ElevatedButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: backgroundColor ?? theme.colorScheme.primary,
          foregroundColor: color ?? Colors.white,
        );
        labelColor = color ?? theme.colorScheme.onPrimary;
        break;

      case ButtonType.secondary:
        style = ElevatedButton.styleFrom(
          backgroundColor:
              backgroundColor ?? theme.colorScheme.primaryContainer,
          foregroundColor: color ?? theme.colorScheme.onPrimaryContainer,
        );
        labelColor = color ?? theme.colorScheme.onPrimaryContainer;
        break;

      case ButtonType.outline:
        style = ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: color ?? theme.colorScheme.primary,
            side: BorderSide(
              width: 1,
              color: backgroundColor ?? theme.colorScheme.primary,
            ));

        labelColor = color ?? theme.colorScheme.primary;
        break;
      case ButtonType.text:
        style = ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: color ?? theme.colorScheme.primary);
        labelColor = color ?? theme.colorScheme.primary;
        break;

      default:
        style = ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? theme.colorScheme.primary,
          foregroundColor: color ?? Colors.white,
        );
        labelColor = color ?? theme.colorScheme.primary;
        break;
    }
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Visibility(
                  visible: iconData !=null,
                  replacement: SvgPicture.asset(
                    iconPath??"",
                    colorFilter: overrideIconColor!
                        ? ColorFilter.mode(
                            labelColor,
                            BlendMode.srcIn, // the blend mode
                          )
                        : null,
                  ),
                  child: Icon(iconData),
                ),
                const SizedBox(width: 12),
              ],
            ),
            Text(label,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: labelColor)),
          ],
        ),
      ),
    );
  }
}
