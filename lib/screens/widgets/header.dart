import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/core.dart';

class Header extends StatelessWidget {
    const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(kDefaultPadding2x)),
          padding:   const EdgeInsets.symmetric(
              vertical: kDefaultPadding, horizontal: kDefaultPadding2x),
          child: Text(
            "Monday 22 December",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),

        ///Notifaction Icon

          const SizedBox(width: kDefaultPadding2x),

        ///Notification Button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:   const CircleBorder(),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 10,
          ),
          onPressed: () {
            ///Todo: show notifcations tray
          },
          child: Stack(
            children: [
              Padding(
                padding:   const EdgeInsets.all(12),
                child: SvgPicture.asset("assets/svg/notification_icon.svg"),
              ),
            ],
          ),
        ),
          const SizedBox(width: kDefaultPadding2x),
        Text(
          "John Doe",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
          const SizedBox(width: kDefaultPadding2x),
        Container(
          padding:   const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border:
                  Border.all(width: 2, color: Theme.of(context).colorScheme.primary ),
              shape: BoxShape.circle),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            minRadius: kDefaultPadding,
            maxRadius: kDefaultPadding2x - 8,
          ),
        )
      ],
    );
  }
}
