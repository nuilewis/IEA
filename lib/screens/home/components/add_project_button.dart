import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:water_project/core/constants.dart';

class AddProjectButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AddProjectButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      splashColor: Theme.of(context).colorScheme.primary.withOpacity(.2),
      splashFactory: InkSparkle.splashFactory,
      onTap: onPressed,
      child: Ink(
          height: 150,
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.brightness == Brightness.light? AppColours.blue90 : AppColours.neutral20

          ),
          child: Center(
            child: Icon(
              size: 32,
              FluentIcons.add_48_regular, color: Theme.of(context).colorScheme.primary,),
          )
      ),
    );
  }
}