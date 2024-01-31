import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(48),
          ),
          child: const Text("Monday, 28th January, 2024"),
        ),
        const Gap(16),
        IconButton.filled(
            style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).cardColor,
                elevation: 0,
                fixedSize: const Size(36, 36)),
            onPressed: () {},
            icon: const Icon(FluentIcons.alert_24_regular)),
        const Gap(16),
        Text(
          "John Doe",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Gap(16),
        const CircleAvatar(
          backgroundImage: AssetImage("assets/images/profile.png"),
          radius: 28,
        ),
      ],
    );
  }
}

