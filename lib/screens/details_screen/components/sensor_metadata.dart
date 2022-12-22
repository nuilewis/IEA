import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../core/widgets/custom_card.dart';

class SensorMetaData extends StatelessWidget {
  const SensorMetaData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return CustomCard(
      bgColor: Colors.white,
      shadowColor: kPurple20,
      child: Column(
        //  mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: "Sensor ID:  ",
                    style: theme.textTheme.bodyText2!.copyWith(color: kDark80)),
                TextSpan(
                    text: "SN01 ",
                    style: theme.textTheme.headline1!
                        .copyWith(color: theme.primaryColor, fontSize: 18)),
              ],
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: "Sensor Location:  ",
                    style: theme.textTheme.bodyText2!.copyWith(color: kDark80)),
                TextSpan(
                    text: "Nkwen ",
                    style: theme.textTheme.headline1!
                        .copyWith(color: theme.primaryColor, fontSize: 18)),
              ],
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: "Sensor Diameter:  ",
                    style: theme.textTheme.bodyText2!.copyWith(color: kDark80)),
                TextSpan(
                    text: "15 ",
                    style: theme.textTheme.headline1!
                        .copyWith(color: theme.primaryColor, fontSize: 18)),
                TextSpan(
                    text: "cm",
                    style:
                        theme.textTheme.bodyText2!.copyWith(color: kPurple40)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
