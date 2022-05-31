import 'package:fl_chart/fl_chart.dart';
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
        const SizedBox(width: kDefaultPadding2x),
        Expanded(
          flex: 9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        
            children: [
              const SizedBox(height: kDefaultPadding2x,),
              const Align(
                alignment: Alignment.centerRight,
                child: Header()),
               Text(
                    "Sensor 1",
                    style: theme.textTheme.headline1!
                        .copyWith(color: theme.primaryColor),
                  ),
          
                  const SizedBox(height: kDefaultPadding*3,),
              SizedBox(
                height: 300,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                
                  children: [
                   
                    const SensorMetaData(),
                        const SizedBox(width: kDefaultPadding2x),
                    ///Current Flow Rate
                    const DisplayFlowRate(),
                        const SizedBox(width: kDefaultPadding2x,),
                    ///Normal or Abnormal
                    const FlowStatus(
                      
                      isNormal: false,
                    ),
                        const SizedBox(width: kDefaultPadding2x),
                    CustomButton(
                      onPressed: () {},
                      text: "Locate On Map",
                      showIcon: true,
                      iconLink: "assets/svg/map_pin.svg",
                    )
                  ],
                ),
              ),
              const SizedBox(height: kDefaultPadding2x),
              CustomCard(
                bgColor: Colors.white,
                shadowColor:  kPurple20,
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
                    ),

                    LineChart(LineChartData( minY: 0, maxY: 100, minX: 0, maxX: 100)),
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
            ),)
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
