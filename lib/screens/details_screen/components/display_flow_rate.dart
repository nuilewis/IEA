import 'package:flutter/material.dart';
import 'package:water_project/core/constants.dart';
import 'package:water_project/core/widgets/custom_card.dart';
import 'package:water_project/models/flow_data_model.dart';

class DisplayFlowRate extends StatelessWidget {
  final FlowRate flowRate;
  const DisplayFlowRate({
    required this.flowRate,
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
            //  mainAxisSize: MainAxisSize.min,
            children: [
              Text("Current Flow Rate",
                  style: theme.textTheme.bodyLarge!.copyWith(color: kPurple)),
              const SizedBox(height: kDefaultPadding),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: flowRate.flowRate.toString(),
                        style: theme.textTheme.displayLarge!
                            .copyWith(fontSize: 48, color: kPurple)),
                    TextSpan(
                        text: "m3/min",
                        style: theme.textTheme.bodyMedium!.copyWith(
                            fontSize: 18, color: kPurple.withOpacity(.5))),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            width: kDefaultPadding,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Text("Flow Velocity",
                  style: theme.textTheme.bodyLarge!.copyWith(color: kPurple)),
              const SizedBox(height: kDefaultPadding),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: flowRate.flowRate.toString(),
                        style: theme.textTheme.displayLarge!
                            .copyWith(fontSize: 48, color: kPurple)),
                    TextSpan(
                        text: "m/sec",
                        style: theme.textTheme.bodyMedium!.copyWith(
                            fontSize: 24, color: kPurple.withOpacity(.5)))
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
