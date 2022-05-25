import 'package:flutter/material.dart';
import 'package:water_project/constants.dart';
import 'package:water_project/global_components/button.dart';
import 'package:water_project/screens/details_screen/components/side_menu.dart';

import 'components/display_flow_rate.dart';
import 'components/flow_status.dart';
import 'components/header.dart';

class DetailsScreen extends StatefulWidget {
  static const id = "details screen";
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      children: [
        const Expanded(
          flex: 2,
          child: SideMenu(),
        ),
        Expanded(
          flex: 10,
          child: Column(
            children: [
              const Header(),
              Row(
                children: [
                  Text(
                    "Sensor 1",
                    style: theme.textTheme.headline1!
                        .copyWith(color: theme.primaryColor),
                  ),
                  const SensorMetaData(),

                  ///Current Flow Rate
                  const DisplayFlowRate(),

                  ///Normal or Abnormal
                  const FlowStatus(
                    isNormal: false,
                  ),

                  CustomButton(
                    onPressed: () {},
                    text: "Locate On Map",
                    showIcon: true,
                    iconLink: "assets/svg/map_pin.svg",
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

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
