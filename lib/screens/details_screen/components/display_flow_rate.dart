import 'package:flutter/material.dart';
import 'package:water_project/constants.dart';
import 'package:water_project/global_components/custom_card.dart';

class DisplayFlowRate extends StatelessWidget {
  const DisplayFlowRate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return CustomCard(
      bgColor: Colors.white,
      shadowColor: kPurple20,
      showShadow: true,
    
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Current Flow Rate", style: theme.textTheme.bodyText1!.copyWith(color: kPurple)),
              SizedBox(height: kDefaultPadding),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "6.3",
                        style: theme.textTheme.headline1!
                            .copyWith(fontSize: 48, color:kPurple)),
                    TextSpan(
                        text: "m3/min",
                        style: theme.textTheme.bodyText2!
                            .copyWith(fontSize: 18, color: kPurple.withOpacity(.5))),
                  ],
                ),
              )
            ],
          ),
          SizedBox(width: kDefaultPadding,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Flow Velocity",
                  style:
                      theme.textTheme.bodyText1!.copyWith(color: kPurple)),
                      SizedBox(height: kDefaultPadding),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "5.1",
                        style: theme.textTheme.headline1!
                            .copyWith(fontSize: 48, color: kPurple)),
                    TextSpan(
                        text: "m/sec",
                        style: theme.textTheme.bodyText2!
                            .copyWith(fontSize: 24, color: kPurple.withOpacity(.5)))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
