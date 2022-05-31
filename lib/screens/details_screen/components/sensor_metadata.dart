

import 'package:flutter/material.dart';

import '../../../constants.dart';

class SensorMetaData extends StatelessWidget {
  const SensorMetaData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Text(
          "sensor id",
          style: theme.textTheme.bodyText2!.copyWith(color: kDark60),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: "Sensor Diameter: ",
                  style: theme.textTheme.bodyText2!.copyWith(color: kDark60)),
              TextSpan(
                  text: "15 ",
                  style: theme.textTheme.headline1!
                      .copyWith(color: theme.primaryColor)),
              TextSpan(
                  text: "cm ",
                  style: theme.textTheme.bodyText2!.copyWith(color: kDark60)),
            ],
          ),
        )
      ],
    );
  }
}
