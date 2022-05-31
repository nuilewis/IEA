import 'package:flutter/material.dart';
import 'package:water_project/constants.dart';
import 'package:water_project/global_components/button.dart';
import 'package:water_project/global_components/custom_card.dart';
import 'package:water_project/screens/details_screen/components/side_menu.dart';

import 'components/display_flow_rate.dart';
import 'components/flow_status.dart';
import 'components/header.dart';
import 'components/sensor_metadata.dart';

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
          flex: 9,
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
                  const Expanded(child: SensorMetaData()),

                  ///Current Flow Rate
                  const Expanded(child: DisplayFlowRate()),

                  ///Normal or Abnormal
                  const Expanded(
                    child: FlowStatus(
                      isNormal: false,
                    ),
                  ),

                  Expanded(
                    child: CustomButton(
                      onPressed: () {},
                      text: "Locate On Map",
                      showIcon: true,
                      iconLink: "assets/svg/map_pin.svg",
                    ),
                  )
                ],
              ),
              CustomCard(
                child: Column(
                  children: [
                    Row(
                      children: const [
                        CategoryItem(
                          title: "Today",
                          onSelected: true,
                        ),
                        CategoryItem(title: "Weekly"),
                        SizedBox(width: kDefaultPadding),
                        CategoryItem(title: "Monthly"),
                        SizedBox(width: kDefaultPadding),
                        CategoryItem(title: "Lifetime"),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const Expanded(
            flex: 1,
            child: SizedBox(
              height: double.infinity,
            ))
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final bool onSelected;
  final String title;
  const CategoryItem({
    Key? key,
    this.onSelected = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding2x),
        color: onSelected ? theme.primaryColor : theme.cardColor,
      ),
      child: Text(
        title,
        style: theme.textTheme.bodyText2!
            .copyWith(color: onSelected ? Colors.white : theme.iconTheme.color),
      ),
    );
  }
}
