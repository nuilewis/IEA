

import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../global_components/custom_card.dart';

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
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      RichText(text:    TextSpan(
          
              children: [
                TextSpan(
                    text: "Sensor ID:  ",
                    style: theme.textTheme.bodyText2!.copyWith(color: kDark80)),
                TextSpan(
                    text:  "SN01 ",
                    style: theme.textTheme.headline1!
                        .copyWith(color: theme.primaryColor, fontSize: 18)),
               
              ],
            ),),
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
                    style: theme.textTheme.bodyText2!.copyWith(color: kPurple40)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
