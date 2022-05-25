import 'package:flutter/material.dart';
import 'package:water_project/global_components/custom_card.dart';

class DisplayFlowRate extends StatelessWidget {
  const DisplayFlowRate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return CustomCard(
      bgColor: theme.primaryColor,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Current Flow Rate", style: theme.textTheme.bodyText1),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "6.3",
                        style: theme.textTheme.headline1!
                            .copyWith(fontSize: 64, color: Colors.white)),
                    TextSpan(
                        text: "m3/min",
                        style: theme.textTheme.bodyText2!
                            .copyWith(fontSize: 24, color: Colors.white))
                  ],
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Flow Velocity",
                  style:
                      theme.textTheme.bodyText1!.copyWith(color: Colors.white)),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "5.1",
                        style: theme.textTheme.headline1!
                            .copyWith(fontSize: 48, color: Colors.white)),
                    TextSpan(
                        text: "m/sec",
                        style: theme.textTheme.bodyText2!
                            .copyWith(fontSize: 24, color: Colors.white))
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
