
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
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(kDefaultPadding2x)),
          color: kPurple20,
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Text(
            "Moday 22 December",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),

        ///Notifaction Icon

        Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: kDark20,
                    blurRadius: 20,
                    offset: Offset(5, 5))
              ]),
        ),

        ///Notification Button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shadowColor: kDark20,
            elevation: 30,
            primary: Theme.of(context).scaffoldBackgroundColor,
          ),
          onPressed: () {
            ///Todo: show notifcations tray
          },
          child: Stack(
            children: [
              SvgPicture.asset(
                  "assets/svg/notification_icon.svg"),
            ],
          ),
        ),

        Text("John Doe", style: Theme.of(context).textTheme.bodyText1,),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(width: 2, color: Theme.of(context).primaryColor),
            shape: BoxShape.circle
          ),
          child: const CircleAvatar(
            backgroundColor: kPurple,
            minRadius: kDefaultPadding2x,
            maxRadius: kDefaultPadding2x+8,
            backgroundImage: AssetImage("assets/svg/Detailed View.png"),
          ),
        )
      ],
    );
  }
}
