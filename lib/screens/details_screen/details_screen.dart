import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/display_flow_rate.dart';
import 'components/flow_status.dart';
import 'components/sensor_metadata.dart';
import '../../core/core.dart';
import '../../models/models.dart';
import '../../providers/providers.dart';

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
    return Consumer<SensorProvider>(builder: (context, sensorData, child) {
      return Scaffold(
        body: Row(
          children: [
            const SizedBox(width: kDefaultPadding2x),
            Expanded(
              flex: 13,
              child: ListView(
                children: [
                  const SizedBox(
                    height: kDefaultPadding2x,
                  ),
                  const Align(
                      alignment: Alignment.centerRight, child: Header()),
                  Text(
                    "Sensor 1",
                    style: theme.textTheme.displayLarge!
                        .copyWith(color: theme.primaryColor),
                  ),
                  const SizedBox(
                    height: kDefaultPadding * 3,
                  ),
                  SizedBox(
                    height: 160,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SensorMetaData(),
                          const SizedBox(width: kDefaultPadding2x),

                          ///Current Flow Rate
                          const DisplayFlowRate(
                            flowRate: FlowRate(flowRate: 10, velocity: 10),
                          ),
                          const SizedBox(
                            width: kDefaultPadding2x,
                          ),

                          ///Normal or Abnormal
                          const FlowStatus(
                            isNormal: true,
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
                  ),
                  const SizedBox(height: kDefaultPadding2x),
                  CustomCard(
                    bgColor: Colors.white,
                    shadowColor: kPurple20,
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            CategoryItem(
                              title: "Today",
                              onSelected: true,
                            ),
                            SizedBox(width: kDefaultPadding),
                            CategoryItem(title: "Weekly"),
                            SizedBox(width: kDefaultPadding),
                            CategoryItem(title: "Monthly"),
                            SizedBox(width: kDefaultPadding),
                            CategoryItem(title: "Lifetime"),
                          ],
                        ),
                        const SizedBox(height: kDefaultPadding2x),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: SizedBox(
                height: double.infinity,
              ),
            )
          ],
        ),
      );
    });
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
        style: theme.textTheme.bodyMedium!
            .copyWith(color: onSelected ? Colors.white : theme.iconTheme.color),
      ),
    );
  }
}
