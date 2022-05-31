import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
              color: kPurple20,
              borderRadius: BorderRadius.circular(kDefaultPadding2x)),
          padding: const EdgeInsets.symmetric(
              vertical: kDefaultPadding, horizontal: kDefaultPadding2x),
          child: Text(
            "Moday 22 December",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),

        ///Notifaction Icon

        SizedBox(width: kDefaultPadding2x),

        ///Notification Button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            shadowColor: kDark20,
            elevation: 10,
            primary: Theme.of(context).scaffoldBackgroundColor,
          ),
          onPressed: () {
            ///Todo: show notifcations tray
          },
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset("assets/svg/notification_icon.svg"),
              ),
            ],
          ),
        ),
        SizedBox(width: kDefaultPadding2x),
        Text(
          "John Doe",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(width: kDefaultPadding2x),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border:
                  Border.all(width: 2, color: Theme.of(context).primaryColor),
              shape: BoxShape.circle),
          child: const CircleAvatar(
            backgroundColor: kPurple,
            minRadius: kDefaultPadding,
            maxRadius: kDefaultPadding2x-8,
            backgroundImage: AssetImage("assets/svg/Detailed View.png"),
          ),
        )
      ],
    );
  }
}
